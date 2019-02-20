<?php

namespace src\app\Controllers;



use src\config\Api_Controller;



class Otp extends Api_Controller

{

     public function __construct($app)

    {

        parent::__construct();

          $this->key=$this->env['paystack_secret'];


    }

    public function otp(){

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, "https://api.paystack.co/transfer/disable_otp");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);

$headers = array();
$headers[] = "Authorization: Bearer $this->key";
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

$result = curl_exec($ch);
if (curl_errno($ch)) {
    echo 'Error:' . curl_error($ch);
}
curl_close ($ch);

echo  ($result);

    }

    public function pin($request, $response, $args){
        $pin=$args['pin'];
        
$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, "https://api.paystack.co/transfer/disable_otp_finalize");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, "{\"otp\": \"$pin\"}");
curl_setopt($ch, CURLOPT_POST, 1);

$headers = array();
$headers[] = "Authorization: Bearer $this->key";
$headers[] = "Content-Type: application/json";
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

$result = curl_exec($ch);
if (curl_errno($ch)) {
    echo 'Error:' . curl_error($ch);
}
curl_close ($ch);
echo  ($result);


    }




}

