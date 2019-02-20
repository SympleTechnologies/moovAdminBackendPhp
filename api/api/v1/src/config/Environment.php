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



$env['oauth_secret_key'] = 'REDACTED';

$env['oauth_secret_iv'] = 'REDACTED';

$env['otp_length']=5;

$env['driver_id'] = '4'; //default id of drivers

$env['booking_distance'] = '24'; //max distances





$env['booking_completed'] = 'completed';

/*

//Tests 
$env['paystack_secret'] = 'REDACTED';

$env['paystack_secret_test'] = 'REDACTED';

$env['paystack_public'] = 'REDACTED';
*/

//Live
$env['paystack_secret'] = 'REDACTED';

$env['paystack_secret_test'] = 'REDACTED';

$env['paystack_public'] = 'REDACTED';





$env['twilio_sid'] = 'REDACTED';

$env['twilio_token'] = 'REDACTED';





// $env['google_map_api'] = 'REDACTED';



if($_SERVER['HTTP_HOST']=='127.0.0.1'||$_SERVER['HTTP_HOST']=='localhost'){

define("DB_DSN",  'mysql:host=localhost;dbname=the_moov_app;charset=utf8');

define("DB_USER",  'root');

define("DB_PASSWORD" , '');

}else{



define("DB_DSN", 'mysql:host=localhost;dbname=themoova_pp_live;charset=utf8');

define("DB_USER", 'themoova_moov');

define("DB_PASSWORD", 'REDACTED');

}





$env['google_map_api'] = 'REDACTED'; //live from client







// test keys

// REDACTED //secret

// REDACTED //public

// Test Secret Key: REDACTED

// Test Public Key: REDACTED

//database

// $env['db_name'] = '';

// $env['db_host'] = 'localhost';

// $env['db_user'] = 'root';

// $env['db_password'] = '';



 





