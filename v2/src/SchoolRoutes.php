<?php
	$app->post('/school', function($req, $res){ (new \src\app\Controllers\Admin\SchoolController())->login($req, $res); });
	$app->get('/school/logout', function($req, $res){ (new \src\app\Controllers\Admin\SchoolController())->logout($req, $res); });
	$app->get('/school/stats', function($req, $res){ (new \src\app\Controllers\Admin\SchoolController())->stats($req, $res); });
	$app->get('/school/users[/{page}[/{limit}]]', function($req, $res, $args){ (new \src\app\Controllers\Admin\SchoolController())->browseUsers($req, $res, $args); });
	$app->get('/school/drivers[/{page}[/{limit}]]', function($req, $res, $args){ (new \src\app\Controllers\Admin\SchoolController())->browseDrivers($req, $res, $args); });
?>