<?php
return [

	'settings' => [

		'displayErrorDetails' => true, // set to true in production

		'addContentLengthHeader' => false,

		'determineRouteBeforeAppMiddleware' => true,

		"db" => [

			'driver' => 'mysql',

			'host' => get_env('DB_HOST'),

			'database' => get_env('DB_NAME'),

			'username' => get_env('DB_USER'),

			'password' => get_env('DB_PASS'),

			'charset' => 'utf8',

			'collation' => 'utf8_unicode_ci',

			'prefix' => '',

		],

	],

]

?>
