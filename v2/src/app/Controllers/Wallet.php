<?php

namespace src\app\Controllers;

use src\app\Helpers\HWallet;
use src\app\Models\User as Users;
use src\config\Api_Controller;

class Wallet extends Api_Controller {
	/**
	 * summary
	 */
	public function beginTransaction() {
		$connection = $this->db->getConnection();
		$connection->beginTransaction();
	}
	/**
	 * summary
	 */
	public function commitTransaction() {
		$connection = $this->db->getConnection();
		$connection->commit();
	}
	/**
	 * Rollback transaction
	 */
	public function rollBackTransaction() {
		$connection = $this->db->getConnection();
		$connection->rollBack();
	}
	public function calculate_amount_fee($amount) {
		$tax = .015;
		$fixed = 100;
		if ($amount <= 2500) {
			return round($amount + ($amount * $tax), 2);
		} else {
			return round($amount + ($amount * $tax) + $fixed, 2);
		}
		return 0;
	}

	public function view_balance($request, $response, $args) {

		//   $user= $this->input['userid'];

		$user = $args['id'];

		$balance = HWallet::balance($user);

		//echo $balance;

		if (!empty($balance)) {

			$wallets['wallet_balance'] = (float) $balance['balance'];

		} else {

			$wallets['wallet_balance'] = 0;

		}

		return $this->response->withJson($wallets);

	}

	public function random_string($length) {

		$date = md5(date("Y-m-d h:i:sa", time()) . "moov");

		$binhx = md5(bin2hex(random_bytes($length)));

		$result = md5($date . "" . $binhx);

		return substr($result, 0, $length);

	}
	function initExternalPayment() {
		if (!isset($this->input['email']) || !isset($this->input['reference']) || !isset($this->input['amount'])) {
			$output = array(
				"status" => 'failed',
				"message" => "Invalid data provided!",
			);

		} else {
			$user = Users::where('u_email', $this->input['email'])
				->where('u_role', 5)
				->select('u_id', 'u_first_name as first_name', 'u_last_name as last_name')
				->first();
			if (!$user) {
				$output = array(
					"status" => false,
					"message" => "User with that email does not exist",
				);

			} else {
				$reference = $this->input['reference'];
				$this->db->table('transactions')->insert([

					't_user_id' => $user->u_id,

					't_reference' => $reference,

					't_access_code' => '',

					't_amount' => $this->calculate_amount_fee($this->input['amount']),

					't_currency' => '',

					't_status' => 'started',

					't_started' => time_now(),
					't_type' => 'external_recharge',
					't_response' => 'created',

				]);
				$output = [
					'status' => true,
					'message' => 'Transaction initiated',
					'data' => [
						'user' => [
							'id' => $user->u_id,
							'first_name' => $user->first_name,
							'last_name' => $user->last_name,
						],
					],
				];
			}
		}

		return $this->response->withJson($output);
	}
	public function start_transaction() {

		ob_start();

		$callbackurl = $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/wallet/payment_success";

		$paystack = new \Yabacon\Paystack($this->env['paystack_secret']);

		try

		{

			$withTax = $this->calculate_amount_fee($this->input['amount']);

			$amount = ($withTax * 100);

			$uid = $this->input['userid'];

			$email = Users::where('u_id', $uid)->pluck('u_email')->first();

			$u_first_name = Users::where('u_id', $uid)->pluck('u_first_name')->first();

			$reference = $this->random_string(20);

			$tranx = $paystack->transaction->initialize([

				'amount' => $amount, // in kobo

				'email' => $email, // unique to customers

				'reference' => $reference, // unique to transactions

				"first_name" => $u_first_name,

				"metadata" => array("site_details" => array(

					"first_name" => $u_first_name,

					"user_id" => $uid,

				)),

				'callback_url' => $callbackurl,

			]);

		} catch (\Yabacon\Paystack\Exception\ApiException $e) {

			print_r($e->getResponseObject());

			die($e->getMessage());

		}

		$this->db->table('transactions')->insert([

			't_user_id' => $uid,

			't_reference' => $reference,

			't_access_code' => $tranx->data->access_code,

			't_amount' => $this->input['amount'],

			't_currency' => '',

			't_status' => 'started',

			't_started' => time_now(),

			't_type' => 'recharge',

			't_response' => 'created',

		]);

		return $this->response->withJson($tranx);

		//echo $tranx->data->authorization_url;

		///  header('Location: ' . $tranx->data->authorization_url);

	}

	public function call_back_url() {

		$event = \Yabacon\Paystack\Event::capture();

		http_response_code(200);

		/* It is a important to log all events received. Add code *

         * here to log the signature and body to db or file       */

		openlog('MyPaystackEvents', LOG_CONS | LOG_NDELAY | LOG_PID, LOG_USER | LOG_PERROR);

		syslog(LOG_INFO, $event->raw);

		closelog();

		$this->logger->Info('Payment response', $event->raw);

		/* Verify that the signature matches one of your keys*/

		$my_keys = [

			'live' => $this->env['paystack_secret'],

			'test' => $this->env['paystack_secret_test'],

		];

		$owner = $event->discoverOwner($my_keys);

		if (!$owner) {

			// None of the keys matched the event's signature

			die();

		}

		switch ($event->obj->event) {

		// charge.success

		case 'charge.success':

			if ('success' === $event->obj->data->status) {

				// TIP: you may still verify the transaction

				// via an API call before giving value.

			}

			break;

		}

	}

	public function verify_transaction() {
		$ref = "";

		$reference = isset($this->input['reference']) ? $this->input['reference'] : '';

		if (!$reference) {

			$reference = $ref;

		}

		// initiate the Library's Paystack Object

		$paystack = new \Yabacon\Paystack($this->env['paystack_secret']);

		try

		{

			// verify using the library

			$tranx = $paystack->transaction->verify([

				'reference' => $reference, // unique to transactions

			]);

		} catch (\Yabacon\Paystack\Exception\ApiException $e) {

			print_r($e->getResponseObject());

			die($e->getMessage());

		}

		if ('success' === $tranx->data->status) {

			$userid = $this->input['userid'];

			$amountinKobo = $tranx->data->amount;

			$amountInNira = $amountinKobo / 100;

			$amountToBeCreditedToWallet=$this->db->table('transactions')
				->where('t_reference', $tranx->data->reference)
				->first()
				->t_amount;

			$this->db->table('transactions')

				->where('t_reference', $tranx->data->reference)

				->update([

					't_access_code' => $tranx->data->reference, 't_amount' => $amountInNira, 't_currency' => $tranx->data->currency, 't_status' => 'completed', 't_started' => time_now(),

					't_response' => serialize($tranx->data),

				]);

			if ($userid == $tranx->data->metadata->site_details->user_id) {

				$balance = HWallet::findOrCreate($userid);

				if (empty($balance)) {

					$balance = 0;

				}

				$amount = ($balance->balance + $amountToBeCreditedToWallet);

				$this->db->table('wallet')

					->where('w_user_id', $userid)

					->update([

						"w_amount" => $amount,

					]);

				$output = array(

					"status" => true,

					"message" => "Wallet Recharged Successfully",

					"data" => array("new_wallet_balance" => $amount),

				);

			} else {

				$output = array(

					"status" => false,

					"message" => "Authentification failed, please try again",

					"errors" => array("message" => "Security errors"),

					"data" => array("reg_details" => array()),

				);

			}

			// return $this->response->withJson($tranx);

		} else {

			$output = array(

				"status" => false,

				"message" => "Access code failed",

			);

		}

		return $this->response->withJson($output);

	}

	public function transfer() {

		$from = $this->input['from'];
		$to = $this->input['to'];
		$amountInNira = $this->input['amount'];

		$balance = HWallet::balance($from);

		if (empty($balance)) {

			$balance = 0;

		}

		$amount = ($balance->balance - $amountInNira);

		if ($amount >= 0) {

			$this->db->table('wallet')
				->where('w_user_id', $from)
				->update([
					"w_amount" => $amount,
				]);
			$balance = HWallet::balance($to);
			$this->db->table('wallet')
				->where('w_user_id', $to)
				->update([
					"w_amount" => $balance->balance + $amountInNira,
				]);

			$output = array(

				"status" => true,

				"message" => "Amount mooAll Threads
1 new reply
ved successfully",

			);

		} else {
			$output = array(

				"status" => false,

				"message" => "An error occured",

			);

		}
		return $this->response->withJson($output);

	}

	public function check_phone_exists($request, $response, $args) {
		$phone = $args['phone'];
		$userdata = array(

			'u_phone' => $phone,

		);

		$data = Users::select('u_id', 'u_first_name', 'u_last_name')->where($userdata)->first(); //   ->count(); //

		if (!empty($data)) {

			$output = array(

				"status" => true,
				"data" => $data,

				"message" => "Account exists",

			);

		} else {
			$output = array(

				"status" => false,

				"message" => "0 account found",

			);

		}

		return $this->response->withJson($output);

	}

	public function list_banks($req, $res, $args) {
		//var_dump($req->get());
		//var_dump($res);
		/*if (isset($_GET['dummy'])) {
				return ("[{
	      "name": "First Bank of Nigeria",
	      "slug": "first-bank-of-nigeria",
	      "code": "011",
	      "longcode": "011151003",
	      "gateway": "emandate-disabled",
	      "pay_with_bank": false,
	      "active": true,
	      "is_deleted": null,
	      "country": "Nigeria",
	      "currency": "NGN",
	      "type": "nuban",
	      "id": 7,
	      "createdAt": "2016-07-14T10:04:29.000Z",
	      "updatedAt": "2016-07-14T10:04:29.000Z"
	    },
	    {
	      "name": "First City Monument Bank",
	      "slug": "first-city-monument-bank",
	      "code": "214",
	      "longcode": "214150018",
	      "gateway": "emandate",
	      "pay_with_bank": true,
	      "active": true,
	      "is_deleted": null,
	      "country": "Nigeria",
	      "currency": "NGN",
	      "type": "nuban",
	      "id": 8,
	      "createdAt": "2016-07-14T10:04:29.000Z",
	      "updatedAt": "2016-07-14T10:04:29.000Z"
	    },
	    {
	      "name": "Guaranty Trust Bank",
	      "slug": "guaranty-trust-bank",
	      "code": "058",
	      "longcode": "058152036",
	      "gateway": "ibank",
	      "pay_with_bank": true,
	      "active": true,
	      "is_deleted": null,
	      "country": "Nigeria",
	      "currency": "NGN",
	      "type": "nuban",
	      "id": 9,
	      "createdAt": "2016-0s7-14T10:04:29.000Z",
	      "updatedAt": "2018-12-18T08:55:45.000Z"
	    }]");
*/
		$key = $this->env['paystack_secret'];
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL, "https://api.paystack.co/bank");
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");

		$headers = array();
		$headers[] = "Authorization: Bearer $key";
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

		$result = curl_exec($ch);
		if (curl_errno($ch)) {
			echo 'Error:' . curl_error($ch);
		}
		curl_close($ch);
		return ($result);
	}

	public function verify_account_number($request, $response, $args) {

		$key = $this->env['paystack_secret'];
		$number = $args['number'];
		$bank_code = $args['bank_code'];

		// Generated by curl-to-PHP: http://incarnate.github.io/curl-to-php/
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL, "https://api.paystack.co/bank/resolve?account_number=$number&bank_code=$bank_code");
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");

		$headers = array();
		$headers[] = "Authorization: Bearer $key";
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

		$result = curl_exec($ch);
		if (curl_errno($ch)) {
			echo 'Error:' . curl_error($ch);
		}
		curl_close($ch);

		return ($result);

	}

}

// sk_test_74e513f5df1005e34aa4ad00dacbde86a9790b26 //secret

// pk_test_a6af2f1a14e21db600abc7a894428260a4159e11 //public
