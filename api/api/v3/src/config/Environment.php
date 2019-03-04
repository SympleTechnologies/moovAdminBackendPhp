<?php

namespace src\config;

//call after depedeny.php

$env = $container['environment'];

$re = $container['request'];





//app details

$env['app_name'] = 'Sample app';

$env['app_url'] = $re->getUri()->getBaseUrl();

$env['app_version'] = 'v1';

$env['app_versions'] =['v1',];

$env['app_c_version_url'] =$env['app_url']."/".$env['app_version'];



$env['app_url_live'] ="http://themoovapp.com";



$env['oauth_secret_key'] = '&^moovApp^&';

$env['oauth_secret_iv'] = '&^*alliswell#$^*';

$env['otp_length']=5;

$env['driver_id'] = '4'; //default id of drivers

$env['booking_distance'] = '24'; //max distances





$env['booking_completed'] = 'completed';

/*

//Tests 
$env['paystack_secret'] = 'sk_test_1a69ad12652e1fdbebe8f5a97d0f1c2ee4ae6058';

$env['paystack_secret_test'] = 'sk_test_1a69ad12652e1fdbebe8f5a97d0f1c2ee4ae6058';

$env['paystack_public'] = 'pk_test_1544ffee69407a91be7cece08566ea4ca1343126';
*/

//Live
$env['paystack_secret'] = 'sk_live_16199471dd19052d68adc5424723ee0d3b384bc3';

$env['paystack_secret_test'] = 'sk_live_16199471dd19052d68adc5424723ee0d3b384bc3';

$env['paystack_public'] = 'pk_live_808cad3e44ee879630593bfd58a7d39a18631f54';





$env['twilio_sid'] = 'AC30d02d007d5bcbdb263d0efa323d0278';

$env['twilio_token'] = 'afc9ffd44c8d9d5a8606de5420d32c16';





// $env['google_map_api'] = 'AIzaSyC0rzowId2yv8feBxUpkssIX0zXEiMhn2A';



if($_SERVER['HTTP_HOST']=='127.0.0.1'||$_SERVER['HTTP_HOST']=='localhost'){

define("DB_DSN",  'mysql:host=localhost;dbname=the_moov_app;charset=utf8');

define("DB_USER",  'root');

define("DB_PASSWORD" , '');

}else{



define("DB_DSN", 'mysql:host=localhost;dbname=themoovapp_test;charset=utf8');

define("DB_USER", 'themoovapp_test'); 

define("DB_PASSWORD", 'moov_app#123');

// 'themoovapp_test', //themoova_pp_live  //db
// 'themoovapp_test', //themoova_moov //user

}





$env['google_map_api'] = 'AIzaSyB6aH2GUchtBI9Pfu6BA8eRTNvvEFCx5r0'; //live from client







// test keys

// sk_test_74e513f5df1005e34aa4ad00dacbde86a9790b26 //secret

// pk_test_a6af2f1a14e21db600abc7a894428260a4159e11 //public

// Test Secret Key: sk_test_1a69ad12652e1fdbebe8f5a97d0f1c2ee4ae6058

// Test Public Key: pk_test_1544ffee69407a91be7cece08566ea4ca1343126

//database

// $env['db_name'] = '';

// $env['db_host'] = 'localhost';

// $env['db_user'] = 'root';

// $env['db_password'] = '';



 





