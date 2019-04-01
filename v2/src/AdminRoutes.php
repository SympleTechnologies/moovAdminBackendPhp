<?php
$app->post('/admin', function ($req, $res) {(new src\app\Controllers\Admin\SuperAdmin())->login($req, $res);});

$app->post('/admin/user', function ($req, $res) {(new src\app\Controllers\Admin\SuperAdmin())->createUser($req, $res);});

$app->put('/admin/user', function ($req, $res) {(new src\app\Controllers\Admin\SuperAdmin())->editUser($req, $res);});

$app->get('/admin/users[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->allUsers($req, $res, $args);});

$app->get('/admin/school/users/{id}[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->usersPerSchool($req, $res, $args);});

$app->get('/admin/drivers/school/{id}[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->driversPerSchool($req, $res, $args);});

$app->post('/admin/drivers/payout', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->payout($req, $res, $args);});

$app->get('/admin/price/share', function ($req, $res) {(new src\app\Controllers\Admin\SuperAdmin())->listPriceShares($req, $res);});

$app->post('/admin/price/share', function ($req, $res) {
	(new src\app\Controllers\Admin\SuperAdmin())->addPriceShare($req, $res);
});

$app->put('/admin/price/share/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->updatePriceShare($req, $res, $args);});

// Rides

$app->get('/admin/rides/school/{id}[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->getRidesForSchool($req, $res, $args);});
$app->get('/admin/rides/user/{id}[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->getRidesForUser($req, $res, $args);});

$app->get('/admin/rides/driver/{id}[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->getRidesForDriver($req, $res, $args);});
$app->get('/admin/rides/all[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->allRides($req, $res, $args);});
// new
$app->get('/admin/rides/detail/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->rideDetail($req, $res, $args);});

// Schools
$app->get('/admin/schools[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->allSchools($req, $res, $args);});
$app->get('/admin/school/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->getSchool($req, $res, $args);});
$app->post('/admin/schools', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->addSchool($req, $res, $args);});
$app->put('/admin/school/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->updateSchool($req, $res, $args);});
$app->post('/admin/schools/{id}/payment_details', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->saveSchoolPaymentDetails($req, $res, $args);});

// Drivers
$app->get('/admin/drivers[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->searchDrivers($req, $res, $args);});

$app->put('/admin/driver/activate/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->activateDriver($req, $res, $args);});

$app->put('/admin/driver/deactivate/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->deactivateDriver($req, $res, $args);});
$app->put('/admin/driver/reset/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->resetUserPassword($req, $res, $args);});

//Transactions
$app->get('/admin/transactions[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->searchTransactions($req, $res, $args);});

//Bank Transfers
$app->post('/wallet/payout/school', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->payoutSchoolAndDrivers($req, $res, $args);});

// payment

$app->put('/admin/school/wallet/{id}/{amount}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->creditSchoolWallet($req, $res, $args);});
$app->put('/admin/driver/wallet/{id}/{amount}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->creditDriversWallet($req, $res, $args);});

// support
$app->get('/admin/supports[/{page}[/{limit}]]', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->searchSupportMessages($req, $res, $args);});

$app->put('/admin/user/deactivate/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->deactivateUser($req, $res, $args);});
$app->put('/admin/user/activate/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->reactivateUser($req, $res, $args);});
$app->put('/admin/user/reset/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->resetUserPassword($req, $res, $args);});
$app->put('/admin/user/suspend/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->suspendUser($req, $res, $args);});

// details

$app->get('/admin/details/user/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->userDetails($req, $res, $args);});
$app->get('/admin/details/driver/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->driverDetails($req, $res, $args);});
$app->get('/admin/details/school/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->schoolDetails($req, $res, $args);});

// manage school and school admin
$app->get('/admin/school/admins/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->browseSchoolAdmins($req, $res, $args);});
$app->put('/admin/school/reset/{id}', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->resetSchoolPassword($req, $res, $args);});

// miscellaneous
$app->get('/admin/stats', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->adminstats($req, $res, $args);});
$app->get('/admin/inituser', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->inituser($req, $res, $args);});

// FILTER
$app->get('/admin/filter/user', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->filterUsers($req, $res, $args);});
$app->get('/admin/filter/driver', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->filterDrivers($req, $res, $args);});
$app->get('/admin/filter/school', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->filterSchools($req, $res, $args);});

// email
$app->post('/admin/support/email', function ($req, $res, $args) {(new src\app\Controllers\Admin\SuperAdmin())->sendSupportEmail($req, $res, $args);});

?>