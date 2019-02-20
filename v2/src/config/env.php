<?php
$ENVIRONMENT_VARIABLES = [

	//'DB_NAME' => 'themoova_pp_live',
	'DB_NAME' => 'themoova_pp_test',
	'DB_USER' => 'root',
	'DB_PASS' => '',
	'DB_HOST' => 'localhost',

	'MAIL_DRIVER' => 'log'
	, 'MAIL_HOST' => 'smtp.gmail.com'
	, 'MAIL_PORT' => 587
	, 'MAIL_USERNAME' => 'israelalagbe53@gmail.com'
	, 'MAIL_PASSWORD' => 'Superbru'
	, 'MAIL_ENCRYPTION' => 'tls'
	, 'MAIL_PRETEND' => true,

];
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
