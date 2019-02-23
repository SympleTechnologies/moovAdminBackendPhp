<?php
namespace src\app\Controllers\Admin;

use src\app\Helpers\HWallet;
use src\app\Models\BankDetails;
use src\app\Models\DriverDetails;
use src\app\Models\MoovWallet;
use src\app\Models\School;
use src\app\Models\SchoolWallet;
use src\app\Models\Transaction;
use src\app\Models\User;
use src\app\Models\User as Users;
use src\app\Models\Wallet;
use src\app\Models\Wallet as WalletModel;

trait PaymentTraits {
	public function creditSchoolWallet($req, $res, $args) {
		if (!$this->validateToken($req, $res) || !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}

		$schoolid = $args['id'];
		$wallet = SchoolWallet::where('w_edu_id', $schoolid)->first();
		if (\is_null($wallet)) {
			$school = School::find($schoolid);
			if (!\is_null($school)) {
				$wallet = new SchoolWallet();
				$wallet->w_edu_id = $schoolid;
				$wallet->w_amount = (int) $args['amount'];
				$wallet->save();
			} else {
				return $res->getBody()->write(json_encode([
					'status' => 404, 'message' => 'No School Found with id provided',
				]));
			}

		} else {
			$wallet->w_amount += $args['amount'];
			$wallet->save();
		}

		$mw = new MoovWallet();
		$mw->mw_user_id = $schoolid;
		$mw->mw_transaction_type = 'FUND_SCHOOL';
		$mw->mw_amount = $args['amount'];
		$mw->mw_date = \date('Y-m-d');
		//$mw->mw_is_school = 1;
		$mw->save();

		return $res->getBody()->write(json_encode([
			'status' => 200, 'message' => 'School Wallet Funded from Moov Wallet',
		]));
	}
	public function payout($req, $res, $args) {
		//$paystack = new \Yabacon\Paystack($this->env['paystack_secret']);

		/*$tranx = $paystack->transaction->initialize([
				'amount' => 100, // in kobo
				'email' => ', // unique to customers
				'reference' => $reference, // unique to transactions
			]);
		*/

	}
	public function creditDriversWallet($req, $res, $args) {
		//error_reporting(E_ALL ^ E_WARNING);
		$this->beginTransaction();
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$driver = DriverDetails::where('dd_driver_id', $args['id'])
			->join('users', 'driver_details.dd_driver_id', 'users.u_id')
			->first();

		if (\is_null($driver)) {
			return $res->getBody()->write(json_encode([
				'status' => 404, 'message' => 'No Driver found with ID',
			]));
		}

		// if school admin, restrict to user's school
		if ($this->isAdmin()) {
			if ($driver->u_edu_institution != $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'No Driver Found with ID']));
			}
		}

		$wallet = Wallet::where('w_user_id', (int) $args['id'])->first();
		if (\is_null($wallet)) {
			$wallet = new Wallet();
			$wallet->w_user_id = (int) $args['id'];
			$wallet->w_amount = (int) $args['amount'];

			$wallet->save();
		} else {
			$wallet->w_amount += $args['amount'];
			$wallet->save();
		}

		$mw = new MoovWallet();
		$mw->mw_user_id = @(int) $args['id'];

		$mw->mw_transaction_type = 'FUND_DRIVER';
		$mw->mw_amount = $args['amount'];
		$mw->mw_date = \date('Y-m-d');
		//$mw->mw_is_school = 0;
		$mw->save();
		$this->commitTransaction();
		return $res->getBody()->write(json_encode([
			'status' => 200, 'message' => 'Driver Wallet Funded from Moov Wallet',
		]));
	}

	public function reverseUserTransaction($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		throw new \Exception("Action not yet implemented");
	}
	public function searchTransactions($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}
		$page = (\is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;

		$query = Transaction::with(array('user' => function ($query) {
			$query->select('u_id', 'u_first_name as first_name', 'u_last_name as last_name');
		}));

		if (!empty($req->getQueryParam('keyword'))) {
			$keyword = $req->getQueryParam('keyword');
			$query->whereHas('user', function ($query) use ($keyword) {
				$query->where('u_first_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_email', 'LIKE', "%$keyword%");
			});
		}
		if (!empty($req->getQueryParam('date'))) {
			$query->where('t_date', 'LIKE', "%{$req->getQueryParam('date')}%");
		}

		if ($this->isAdmin() || !empty($req->getQueryParam('school'))) {

			if ($this->isAdmin()) {
				$school_id = $this->user->u_edu_institution;
			} else {
				$school_id = $req->getQueryParam('school');
			}

			$query->whereHas('user', function ($q) use ($school_id) {
				$q->where('u_edu_institution', '=', $school_id);
			});
		}

		$total = $query->count();
		$query->skip($skip)->take($limit)->orderBy('t_id', 'desc');
		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;

		$transactions = $query->get(['t_id', 't_user_id', 't_amount as amount', 't_date as date', 't_status as status', 't_type as type']);

		return $res->getBody()->write(json_encode([
			'status' => 200,
			'transactions' => $transactions,
			'total' => $total,
			'totalPages' => $totalPages,
			'page' => $page,
			'limit' => $limit,
		]));
	}
	public function payoutSchoolAndDrivers($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}
		//TODO: Check if the driver with the email belongs to a particular admin.

		set_time_limit(0);
		$driver_list = @$this->input['driver_id_list'];
		$school_list = @$this->input['school_id_list'];
		$user_email = @$this->input['user_email'];

		if (!is_null($driver_list)) {
			$payout_type = 'drivers_payout';
			$usersIDList = $driver_list;
		} else if (!is_null($school_list)) {
			$payout_type = 'schools_payout';
			$usersIDList = $school_list;
		} else if (!is_null($user_email)) {
			$payout_type = 'drivers_payout';
			/*$usersIDList = [
				Use
			];*/

			$user = Users::where('u_email', $user_email)->first();
			//print_r(json_encode($user));
			if (!$user || $user->u_type != self::DRIVER) {
				$output = array(
					"status" => false,
					// 'user' => $user,
					// 'driver' => self::DRIVER,
					"message" => "Driver with that email address does not exists!",
				);
				return $res->getBody()->write(json_encode($output));
			}

			$usersIDList = [$user->u_id];
		}

		if (isset($usersIDList) && !is_array($usersIDList)) {
			$output = array(
				"status" => false,
				"message" => 'Driver IDs must be passed in as arrays',
			);
			return $res->getBody()->write(json_encode($output));

		}

		$results = array_filter($usersIDList, function ($user_id) use ($payout_type) {
			try {
				if ($payout_type == 'drivers_payout') {
					$output = $this->singleDriverPayout($user_id);
				} else {
					$output = $this->singleSchoolPayout($user_id);
				}
				//var_dump($output);
				return $output['status'];
			} /*catch (\Throwable $e) {
				$this->logger->Error('Payout Error', $e->getMessage());
				//print("Get message:".$e->getMessage());
				return false;
			}*/ catch (\Exception $e) {
				$this->logger->Error('Payout Error: ' . $e->getMessage());
				//print("Get message:".$e->getMessage());
				return false;
			}

		});
		$numberOfSuccessfulTransactions = count($results);
		$totalNumberOfTransactions = count($usersIDList);

		$message = "Payout successful, {$numberOfSuccessfulTransactions} of {$totalNumberOfTransactions} transactions successful!";
		$output = array(
			"status" => true,
			"message" => $message,
		);
		return $res->getBody()->write(json_encode($output));
	}
	public function payoutDrivers() {

		$driver_id = $this->input['user_id'];
		$output = $this->singleDriverPayout($driver_id);
		return $this->response->withJson($output);
	}

	private function singleDriverPayout($driver_id) {
		$this->beginTransaction();
		$user = Users::find($driver_id);
		$bank_details = $this->getAccountDetails($driver_id);
		$driver_wallet = HWallet::balance($driver_id);
		$balance = $driver_wallet->balance;

		if ($balance <= 0) {
			$output = array(
				"status" => false,
				"message" => "An error occured, please ensure that you have enough balance!",
			);
			return $output;
		}
		if ($driver_wallet && $bank_details && $user) {

			$remainingAmount = 0; //($balance->balance - $normalamount);
			WalletModel::where('w_user_id', $driver_id)
				->update([
					"w_amount" => $remainingAmount,
				]);
			$output = $this->initiateBankTransfer([
				"name" => $user->u_first_name . " " . $user->u_last_name,
				"description" => "Payout for driver",
				"account_number" => $bank_details->bd_account_number,
				"bank_code" => $bank_details->bd_bank_code,
				"amount" => $balance * 100,
			]);
			//$output['amount'] = $balance;

		} else {
			$output = array(

				"status" => false,

				"message" => "No wallet enabled to payout or invalid entity!",

			);
		}
		$this->commitTransaction();
		return $output;
	}
	private function singleSchoolPayout($school_id) {
		$this->beginTransaction();
		$school = School::find($school_id);
		$bank_details = BankDetails::where('institution_id', $school_id)->first();
		$school_wallet = SchoolWallet::where('w_edu_id', $school_id)->first();
		$balance = $school_wallet->w_amount;

		if ($school_wallet && $bank_details && $school) {

			$remainingAmount = 0; //($balance->balance - $normalamount);
			SchoolWallet::where('w_edu_id', $school_id)
				->update([
					"w_amount" => $remainingAmount,
				]);
			$output = $this->initiateBankTransfer([
				"name" => $school->ei_name,
				"description" => "Payout for schools",
				"account_number" => $bank_details->bd_account_number,
				"bank_code" => $bank_details->bd_bank_code,
				"amount" => $balance * 100,
			]);

		} else {
			$output = array(

				"status" => false,

				"message" => "No wallet enabled to payout or invalid entity!",

			);
		}
		$this->commitTransaction();
		return $output;
	}
	private function getAccountDetails($userID) {
		return BankDetails::where('bd_user_id', $userID)->first();
	}
	public function transfer_to_bank() {
		$this->beginTransaction();
		$output = $this->initiateBankTransfer($this->input);

		/*$from = $this->input['userid'];
			$name = $this->input['name'];
			$description = $this->input['description'];
			$account_number = $this->input['account_number'];
			$bank_code = $this->input['bank_code'];
			$amountInNira = ($this->input['amount'] * 100);
			$balance = HWallet::balance($from);

			if (empty($balance)) {
				$balance = 0;
			}
			$normalamount = $this->input['amount'];
			$amount = ($balance->balance - $normalamount);
			if ($amount >= 0) {
				$this->db->table('wallet')->where('w_user_id', $from)
					->update([
						"w_amount" => $amount,
					]);
				//cul calls
				$recipient_data = array(
					"type" => "nuban",
					"name" => $name,
					"description" => $description,
					"account_number" => $account_number,
					"bank_code" => $bank_code,
					"currency" => "NGN",
				);

				$recipient = $this->generate_transfer_recipient($recipient_data);

				$output = array(
					"status" => true,
					"test" => $recipient,

					"message" => "Amount mooved successfully",
				);
			} else {
				$output = array(
					"status" => false,
					"message" => "An error occured, please ensure that you have enough balance!",
				);
		*/
		$this->commitTransaction();
		return $this->response->withJson($output);

	}
	public function initiateBankTransfer($recipient_data) {
		$name = $recipient_data['name'];
		$description = $recipient_data['description'];
		$account_number = $recipient_data['account_number'];
		$bank_code = $recipient_data['bank_code'];
		$amountInNira = ($recipient_data['amount'] * 100);
		$normalamount = $recipient_data['amount'];

		//cul calls
		$recipient_data = array(
			"type" => "nuban",
			"name" => $name,
			"description" => $description,
			"account_number" => $account_number,
			"bank_code" => $bank_code,
			"currency" => "NGN",
		);

		$recipient = $this->generate_transfer_recipient($recipient_data);

		$output = $this->completeBankTransfer([
			"source" => "balance", "reason" => $description, "amount" => $normalamount, "recipient" => $recipient,
		]);
		//$this->logger->Info(json_encode($output));
		if (!$output['status']) {
			$this->rollbackTransaction();
		}
		/*$output = array(
				"status" => true,
				"test" => $recipient,

				"message" => "Amount mooved successfully",
			);*/

		return $output;
	}
	public function completeBankTransfer($array) {
		$key = $this->env['paystack_secret'];
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, "https://api.paystack.co/transfer");
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($array));
		curl_setopt($ch, CURLOPT_POST, 1);

		$headers = array();
		$headers[] = "Authorization: Bearer $key";
		$headers[] = "Content-Type: application/json";
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

		$result = curl_exec($ch);
		if (curl_errno($ch)) {
			throw new \Exception('curl_errno Error:' . curl_error($ch));
		}
		curl_close($ch);

		$decode = json_decode($result, true);
		return $decode; //['recipient_code'];
	}

	public function generate_transfer_recipient($array) {
		$key = $this->env['paystack_secret'];
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL, "https://api.paystack.co/transferrecipient");
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($array));
		curl_setopt($ch, CURLOPT_POST, 1);

		$headers = array();
		$headers[] = "Authorization: Bearer $key";
		$headers[] = "Content-Type: application/json";
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

		$result = curl_exec($ch);
		if (curl_errno($ch)) {
			throw new \Exception('curl_errno Error:' . curl_error($ch));
		}
		curl_close($ch);

		$decode = json_decode($result, true);
		if (!$decode['status']) {
			throw new \Exception('Transfer recipient error:' . $decode['message']);
		}
		return $decode['data']['recipient_code'];
		//->data->recipient_code; //['data']['recipient_code'];
		// return $result;
	}
}
