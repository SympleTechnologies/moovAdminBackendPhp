<?php
namespace src\app\Controllers;

use src\app\Helpers\HWallet;
use src\app\Models\User as Users;
use src\config\Api_Controller;

class Wallet extends Api_Controller
{

    public function view_balance($request, $response, $args)
    {
        //   $user= $this->input['userid'];
        $user = $args['id'];

        $balance = HWallet::balance($user);
        //echo $balance;
        if (!empty($balance)) {

            $wallets['wallet_balance'] = (float)$balance['balance'];
        } else {
            $wallets['wallet_balance'] = 0;

        }

        return $this->response->withJson($wallets);
    }

    public function random_string($length)
    {
        $date = md5(date("Y-m-d h:i:sa", time()) . "moov");
        $binhx = md5(bin2hex(random_bytes($length)));
        $result = md5($date . "" . $binhx);
        return substr($result, 0, $length);
    }

    public function start_transaction()
    {
        ob_start();
        $callbackurl = $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/wallet/payment_success";

        $paystack = new \Yabacon\Paystack($this->env['paystack_secret']);
        try
        {

            $amount = ($this->input['amount'] * 100);
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

    public function call_back_url()
    {
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

    public function verify_transaction()
    {$ref = "";
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


$this->db->table('transactions')
    ->where('t_reference', $tranx->data->reference)
    ->update([
        't_access_code' => $tranx->data->reference, 't_amount' => $amountInNira, 't_currency' => $tranx->data->currency, 't_status' => 'completed', 't_started' => time_now(), 't_type' => 'recharge',
         't_response' => serialize($tranx->data)
    ]);

            if ($userid == $tranx->data->metadata->site_details->user_id) {
                $balance = HWallet::balance($userid);
                if (empty($balance)) {
                    $balance = 0;
                }
$amount=($balance->balance + $amountInNira);
                $this->db->table('wallet')
                    ->where('w_user_id', $userid)
                    ->update([
                        "w_amount" => $amount,

                    ]);

$output = array(
    "status" => true,
    "message" => "Wallet Recharged Successfully",
    "data" => array("new_wallet_balance" =>$amount),
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

}

// sk_test_74e513f5df1005e34aa4ad00dacbde86a9790b26 //secret
// pk_test_a6af2f1a14e21db600abc7a894428260a4159e11 //public
