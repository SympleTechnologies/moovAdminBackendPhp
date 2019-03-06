<?php
return [

	'settings' => [

		'displayErrorDetails' => true, // set to true in production

		'addContentLengthHeader' => false,

		'determineRouteBeforeAppMiddleware' => true,

		"db" => [

			'driver' => 'mysql',

			'host' => get_env('DB_HOST'),

			'database' => get_env('DB_NAME', 'themoovapp_test'), //'themoovapp_test', //themoova_pp_live

			'username' => get_env('DB_USER'), //'israelalagbe', //themoova_moov

			'password' => get_env('DB_PASS'), //'T36l@BLB%vp3',

			'charset' => 'utf8',

			'collation' => 'utf8_unicode_ci',

			'prefix' => '',

		],

	],

]

/*

'driver' => 'mysql',

'host' => 'localhost',

'database' => 'themoova_pp_live',

'username' => 'themoova_moov',

'password' => 'moov_app#123',

'charset' => 'utf8',

'collation' => 'utf8_unicode_ci',

'prefix' => '',

 */

?>

