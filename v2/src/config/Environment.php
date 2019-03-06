<?php

namespace src\config;

//call after depedeny.php

$env = $container['environment'];

$re = $container['request'];

//app details
function scheme() {
	if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
		$uri = 'https://';
	} else {
		$uri = 'http://';
	}
	return $uri;
}
function origin_url() {
	//scheme http
	//host localhost
	//then the path to the dir
	$port = $_SERVER["SERVER_PORT"] == 80 ? '' : ':' . $_SERVER["SERVER_PORT"];
	return scheme() . $_SERVER["HTTP_HOST"] . $port; //. dirname($_SERVER['SCRIPT_NAME']);
}

$env['app_name'] = 'Sample app';

$env['app_url'] = $re->getUri()->getBaseUrl();

$env['app_version'] = 'v2';

$env['app_versions'] = ['v2'];

$env['app_c_version_url'] = $env['app_url'] . "/" . $env['app_version'];

$env['app_url_live'] = origin_url(); //'https://moov-php-backend-staging.herokuapp.com';

/* $env['oauth_secret_key'] = 'REDACTED';

$env['oauth_secret_iv'] = 'REDACTED'; */

$env['otp_length'] = 5;

$env['driver_id'] = '4'; //default id of drivers

$env['booking_distance'] = '24'; //max distances

$env['booking_completed'] = 'completed';

//Tests
/*$env['paystack_secret'] = 'REDACTED';

$env['paystack_secret_test'] = 'REDACTED';

$env['paystack_public'] = 'REDACTED';*/
/* $env['paystack_secret'] = 'REDACTED';

$env['paystack_secret_test'] = 'REDACTED';

$env['paystack_public'] = 'REDACTED'; */

//Live
/*
$env['paystack_secret'] = 'REDACTED';

$env['paystack_secret_test'] = 'REDACTED';

$env['paystack_public'] = 'REDACTED';
 */

/* $env['twilio_sid'] = 'REDACTED';

$env['twilio_token'] = 'REDACTED'; */

// $env['google_map_api'] = 'REDACTED';

/*if ($_SERVER['HTTP_HOST'] == '127.0.0.1' || $_SERVER['HTTP_HOST'] == 'localhost') {

define("DB_DSN", 'mysql:host=localhost;dbname=themoova_pp_live;charset=utf8');

define("DB_USER", 'root');

define("DB_PASSWORD", '');

} else {
die("We die here")

define("DB_DSN", 'mysql:host=localhost;dbname=themoova_pp_live;charset=utf8');

define("DB_USER", 'israelalagbe');

define("DB_PASSWORD", 'REDACTED');

// 'themoovapp_test', //themoova_pp_live  //db
// 'themoovapp_test', //themoova_moov //user

}*/

/* $env['google_map_api'] = 'REDACTED'; //live from client */
foreach ($ENVIRONMENT_VARIABLES as $key => $value) {
	# code...
	$env[$key]=$value;
}

$ENVIRONMENT_VARIABLES=$env;
print_r($ENVIRONMENT_VARIABLES);
die("The End!");



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
