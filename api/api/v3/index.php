<?php
use \Psr\Http\Message\ServerRequestInterface as Request;

require '../vendor/autoload.php';
date_default_timezone_set ('Asia/Kolkata'); //Africa/Lagos
// date_default_timezone_set('UTC'); //Africa/Lagos

$settings = require 'src/config/settings.php';
$app = new \Slim\App($settings);
require '../jfunctions.php';
require '../push_alert.php';
require 'src/config/includes.php'; //load all model and controllers
require 'src/dependencies.php';
require 'src/config/Environment.php';
$amw = new src\app\Middleware\JAuth();

require 'src/routes.php';

$app->run();
