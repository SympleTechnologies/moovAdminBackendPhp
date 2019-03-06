<?php
$ENVIRONMENT_VARIABLES = [

	// 'DB_NAME' => 'themoova_pp_test',
	// 'DB_USER' => 'root',
	// 'DB_PASS' => '',
	// 'DB_HOST' => 'localhost',

	//Heroku config
	/*'DB_NAME' => 'heroku_701b649672bdddd',
	'DB_USER' => 'b1c916ec2507c8',
	'DB_PASS' => '1f2d801d',
	'DB_HOST' => 'us-cdbr-iron-east-03.cleardb.net',

	'MAIL_DRIVER' => 'log'
	, 'MAIL_HOST' => 'smtp.gmail.com'
	, 'MAIL_PORT' => 587
	, 'MAIL_USERNAME' => 'israelalagbe53@gmail.com'
	, 'MAIL_PASSWORD' => 'Superbru'
	, 'MAIL_ENCRYPTION' => 'tls'
	, 'MAIL_PRETEND' => true,*/

];
if (file_exists('.env')) {
	$ENVIRONMENT_VARIABLES = array_merge(parse_ini_file(".env"), $ENVIRONMENT_VARIABLES);
}
if (!function_exists('get_env')) {

	function get_env($key, $defaultValue = null) {
		GLOBAL $ENVIRONMENT_VARIABLES;
		if (isset($ENVIRONMENT_VARIABLES[$key])) {
			return $ENVIRONMENT_VARIABLES[$key];
		} else {
			return $defaultValue;
		}
	}
}
