<?php
function time_now()
{
    return date("Y-m-d H:i:s");
}
/**
 * Helper function to convert value to boolean, 
 * it converts truthy values to boolean
 */
function toBoolean($value){
    return (boolean)json_decode(strtolower($value));
}

function converToTz($time = "", $toTz = '', $fromTz = 'UTC')
{
    $date = new DateTime($time, new DateTimeZone($fromTz));
    $date->setTimezone(new DateTimeZone($toTz));
    $time = $date->format('Y-m-d H:i:s');
    return $time;
}

function base_url($param = '')
{
    global $app;
    $c = $app->getContainer();
    $request = $c['request'];
    return ($request->getUri()->getBaseUrl() . "" . $param);
}

function hmac_sign($message, $key)
{
    return hash_hmac('sha256', $message, $key);
}
function hmac_verify($bundle, $key)
{
    $msgMAC = mb_substr($bundle, 0, 64, '8bit');
    $message = mb_substr($bundle, 64, null, '8bit');
    return hash_equals(
        hash_hmac('sha256', $message, $key),
        $msgMAC
    );
}

function my_simple_crypt($string, $action = 'e')
{
    // you may change these values to your own
    $secret_key = 'my_simple_secret_key';
    $secret_iv = 'my_simple_secret_iv';

    $output = false;
    $encrypt_method = "AES-256-CBC";
    $key = hash('sha256', $secret_key);
    $iv = substr(hash('sha256', $secret_iv), 0, 16);

    if ($action == 'e') {
        $output = base64_encode(openssl_encrypt($string, $encrypt_method, $key, 0, $iv));
    } elseif ($action == 'd') {
        $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
    }

    return $output;
}

function randomPassword($length = 8)
{
    $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
    $pass = array();
    $alphaLength = strlen($alphabet) - 1;
    for ($i = 0; $i < $length; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass);
}
