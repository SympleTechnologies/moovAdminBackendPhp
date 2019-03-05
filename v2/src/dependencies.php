<?php

$container = $app->getContainer();

$container['db'] = function ($container) {
	$capsule = new \Illuminate\Database\Capsule\Manager;
	$capsule->addConnection($container['settings']['db']);
	$capsule->setAsGlobal();
	$capsule->bootEloquent();
	return $capsule;
};

$container['profile_pic_upload'] = "../../public/uploads/userpic/";
$container['profile_pic_upload_croped'] = "../../public/uploads/userpic/croped/";
$container['profile_pic_upload_croped_100'] = "../../public/uploads/userpic/croped/100/";
$container['profile_pic_upload_croped_200'] = "../../public/uploads/userpic/croped/200/";

$container['profile_pic_upload_url'] = "/public/uploads/userpic/";
$container['profile_pic_upload_croped_100_url'] = "/public/uploads/userpic/croped/100/";
$container['profile_pic_upload_croped_200_url'] = "/public/uploads/userpic/croped/200/";

$container['logger'] = function ($c) {
	$logger = new \Monolog\Logger('moov_logger_v1');
	$file_handler = new \Monolog\Handler\StreamHandler('../logs/' . date('Y/m/d-m-Y') . '.html');
	$file_handler->setFormatter(new Monolog\Formatter\HtmlFormatter());
	$logger->pushHandler($file_handler);
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

$container["jwt"] = function ($container) {
	return new StdClass;
};

$container['JAuth'] = function ($container) {
	return new src\app\Middleware\JAuth($container);
};
//for consistency  classes moved to routes page
