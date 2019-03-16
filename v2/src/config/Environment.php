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

$env['otp_length'] = 5;

$env['driver_id'] = '4'; //default id of drivers

$env['booking_distance'] = '24'; //max distances

$env['booking_completed'] = 'completed';


foreach ($ENVIRONMENT_VARIABLES as $key => $value) {
	# code...
	$env[$key]=$value;
}

$ENVIRONMENT_VARIABLES=$env;
