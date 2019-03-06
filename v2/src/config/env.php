<?php
if (file_exists('.env')) {
	$ENVIRONMENT_VARIABLES = array_merge(parse_ini_file(".env"));
}
else{
	$ENVIRONMENT_VARIABLES=$_ENV;
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
