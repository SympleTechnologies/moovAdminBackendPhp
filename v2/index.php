<?php

require '../vendor/autoload.php';
// date_default_timezone_set ('Asia/Kolkata'); //Africa/Lagos
date_default_timezone_set('Africa/Lagos'); //Africa/Lagos
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Methods:GET,POST,PUT,DELETE,PATCH");
/*header("Access-Control-Allow-Headers:Content-Type,X-XSRF-TOKEN,token");*/
$settings = require 'src/config/settings.php';
$app = new \Slim\App($settings);
require '../jfunctions.php';
require '../push_alert.php';
require 'src/config/includes.php'; //load all model and controllers
require 'src/dependencies.php';
require 'src/config/Environment.php';
$amw = new src\app\Middleware\JAuth();

require 'src/AdminRoutes.php';
require 'src/SchoolRoutes.php';
require 'src/routes.php';

$app->options('/{routes:.+}', function ($request, $response, $args) {
	return $response;
});

$app->add(function ($req, $res, $next) {
	$response = $next($req, $res);
	return $response
		->withHeader('Access-Control-Allow-Origin', '*')
		->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization, Token')
		->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->run();
