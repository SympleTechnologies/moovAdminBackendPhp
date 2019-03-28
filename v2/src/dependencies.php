<?php

use src\app\Helpers\DbLoggerHandler;
if (!toBoolean(get_env('DEBUG'))) {
	error_reporting(0);
}
$container = $app->getContainer();


\Cloudinary::config(array( 
	"cloud_name" => get_env('cloudinary_cloud_name'), 
	"api_key" => get_env('cloudinary_api_key'), 
	"api_secret" => get_env('cloudinary_api_secret') 
  ));

$container['db'] = function ($container) {
	$capsule = new \Illuminate\Database\Capsule\Manager;
	$capsule->addConnection($container['settings']['db']);
	$capsule->setAsGlobal();
	$capsule->bootEloquent();
	return $capsule;
};

$container['profile_pic_upload'] = "public/uploads/userpic/";
$container['profile_pic_upload_croped'] = "public/uploads/userpic/croped/";
$container['profile_pic_upload_croped_100'] = "public/uploads/userpic/croped/100/";
$container['profile_pic_upload_croped_200'] = "public/uploads/userpic/croped/200/";

$container['profile_pic_upload_url'] = "/public/uploads/userpic/";
$container['profile_pic_upload_croped_100_url'] = "/public/uploads/userpic/croped/100/";
$container['profile_pic_upload_croped_200_url'] = "/public/uploads/userpic/croped/200/";

$container['logger'] = function ($c) {
	$logger = new \Monolog\Logger('moov_logger_v1');
	$file_handler = new \Monolog\Handler\StreamHandler('../logs/' . date('Y/m/d-m-Y') . '.html');
	$file_handler->setFormatter(new Monolog\Formatter\HtmlFormatter());
	$dbHander=new DbLoggerHandler();
	$logger->pushHandler($file_handler);
	$logger->pushHandler($dbHander);
	return $logger;
};

$container['view'] = function ($container) {
	$view = new \Slim\Views\Twig('src/app/views', [
		'cache' => false,
	]);
	$basePath = rtrim(str_ireplace('index.php', '', $container->get('request')->getUri()->getBasePath()), '/');
	$view->addExtension(new Slim\Views\TwigExtension($container->get('router'), $basePath));

	return $view;
};

$container['notFoundHandler'] = function ($c) {
	return function ($request, $response) use ($c) {
		$data = array("message" => "🚖 The item does not exist 🚕");
		return $c['response']->withStatus(404)->withHeader('Content-Type', 'application/json')->withJson($data);
	};
};
$container['notAllowedHandler'] = function ($c) {
	return function ($request, $response, $methods) use ($c) {
		$data = array("message" => "🚕 Method not matching 🚖");
		return $c['response']->withStatus(405)->withHeader('Content-Type', 'application/json')->withJson($data);
	};
};
$container['phpErrorHandler'] = $container['errorHandler'] = function ($container) {
	return function ($request, $response, $exception) use ($container) {
		$container['logger']->error($exception);
		if (!toBoolean(get_env('DEBUG'))) {
			return $response->withStatus(500)
				->withHeader('Content-Type', 'text/html')
				->write('Something went wrong!');
		} else { 
			return $response->withStatus(500)
				->withHeader('Content-Type', 'text/html')
				->write("<pre>$exception</pre>");
		}
	};
};
$container["jwt"] = function ($container) {
	return new StdClass;
};

$container['JAuth'] = function ($container) {
	return new src\app\Middleware\JAuth($container);
};
//for consistency  classes moved to routes page
