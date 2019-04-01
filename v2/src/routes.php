<?php

//its shouldn't  be here, but only for next developers inner peace....  ,

$container['User'] = function ($container) {
	return new src\app\Controllers\User($container);
};

$container['Auth'] = function ($container) {
	return new src\app\Controllers\Auth($container);
};

$container['Booking'] = function ($container) {
	return new src\app\Controllers\Booking($container);
};

$container['DriverAuth'] = function ($container) {
	return new src\app\Controllers\DriverAuth($container);
};

$container['Wallet'] = function ($container) {
	return new src\app\Controllers\Wallet($container);
};

$container['Ride'] = function ($container) {
	return new src\app\Controllers\Ride($container);
};

$container['Email'] = function ($container) {
	return new src\app\Controllers\Email($container);
};

$container['Tests'] = function ($container) {
	return new src\app\Controllers\Tests($container);
};
$container['FutureBooking'] = function ($container) {
	return new src\app\Controllers\FutureBooking($container);
};
$container['cronbooking'] = function ($container) {
	return new src\app\Controllers\cronbooking($container);
};

$container['Otp'] = function ($container) {
	return new src\app\Controllers\Otp($container);
};

$app->any('/', function ($request, $response, $args) {
	$name = (isset($args['name'])) ? $args['name'] : " Bot";

	$response->getBody()->write("<font size='100'>Welcome to Moov 🚕🚖🚕 api 😉😇</font>");

	return $response;
});

$app->any('/viewdriver', function ($request, $response, $args) {
	echo file_get_contents("../logs/2018/07/30-07-2018.log"); // get the contents, and echo it out.
});

$env['route'] = array(

	"user" => array(

		"login" => "/auth/login/email",
		"check_email" => "/auth/check/email",

		"forgot" => "/auth/forgot",

		"register" => "/auth/register",

		"social_registration" => "/auth/social_registration",

		"social_login" => "/auth/social_login",

		"select_college" => "/auth/select_college",

		"select_type" => "/auth/select_user_type",

		"ride_amount_search" => "/ride/search/amount/{from}/{to}/{seats}/{pooling}",

		"ride_amount_from_distance" => "/ride/search/amount/{distance}/{seats}/{pooling}",

		"ride_list_edu" => "/ride/view_colleges/[{id}]",

		"ride_book_now" => "/ride/book_now",
		"ride_book_future" => "/ride/book_future",

		"ride_add_rating" => "/ride/add_rating",

		"view_user_details" => "/view/details/user/{id}",

		"view_rides" => "/view/rides/user/{id}",

		"view_current_ride" => "/view/rides/current/user/{id}",

	),

	"driver" => array(

		"login" => "/auth/driver/login/email",

		"register" => "/auth/driver/register",

		"select_type" => "/auth/driver/select_user_type",

		"select_college" => "/auth/driver/select_college",

		"car_models" => "/auth/driver/car_models",

		"shift_change" => "/driver/shift_change",

		"update_last_location" => "/driver/update/last_location",

		"view_driver_details" => "/view/details/driver/{id}",

		"view_previous_trips" => "/rides/trips/driver/{id}",

		"view_trip" => "/rides/driver/trips/{id}",

		"ride_stop" => '/rides/stop/{id}/{lat}/{long}',

		"driver_near_notification" => '/rides/{id}/rider_notification',

		"view_active_trip" => '/rides/driver/active/{id}',

		"ride_start" => '/rides/start/{id}/{lat}/{long}',
		"get_drivers_by_user" => '/users/{user_id}/driver',
	),

	"global" => array(
		"get_available_drivers" => '/schools/{school_id}/available_drivers',

		"start_transaction" => '/wallet/init_payment',

		"get_transaction_callback" => '/wallet/payment_success',

		"get_transaction_callback_trailing" => '/wallet/payment_success/',
		"init_external_payment" => '/wallet/payment/external/email',

		"verify_transaction" => '/wallet/verify',

		"balance" => '/wallet/balance/{id}',

		"support_email" => '/support/email',

		"update_profile" => '/update/profile',

		"update_driver_details" => '/update/driver_details',

		"update_profile_pic" => '/update/profile_pic/{user_id}',
		"update_profile_pic_ios" => '/update/profile_pic/ios/{user_id}',

		"update_email" => '/update/email',
		"update_bank_details" => '/update/bank',
		"view_bank_details" => '/view/bank/{id}',

		"update_password" => '/update/password',

		"otp" => '/update/phone/otp',

		"phone_update" => '/update/phone',

		"ride_pay" => '/rides/pay',

		//"ride_cancel" => '/rides/cancel/{id}',
		"ride_cancel" => '/rides/cancel/{id}/{type}',
		'check_phone' => '/wallet/check/{phone}',
		'wallet_user_transfer' => '/wallet/transfer/user',
		'wallet_bank_transfer' => '/wallet/transfer/bank',
		"wallet_banks" => '/wallet/banks',
		"account_number" => '/wallet/account_number/{number}/{bank_code}',
		'otp_disable' => '/otp',
		'otp_pin' => '/opt/{pin}',

	),
	"crons" => array(
		"check_upcoming_booking" => '/crons/check_upcoming',
	),

);

$r_user = $env['route']['user'];

$r_driver = $env['route']['driver'];

$r_global = $env['route']['global'];
$r_crons = $env['route']['crons'];

//user part

$app->post($r_user['login'], 'Auth:login');
$app->post($r_user['check_email'], 'Auth:check_email');

$app->post($r_user['social_registration'], 'Auth:register');

$app->post($r_user['social_login'], 'Auth:social_login');

$app->post($r_user['register'], 'Auth:register');

$app->post($r_user['forgot'], 'Auth:forgot_password');

$app->get($r_user['select_college'], 'Auth:get_edu_list');

$app->get($r_user['select_type'], 'Auth:get_usertype_list');

$app->post($r_user['ride_add_rating'], 'Ride:add_rating');


$app->get($r_user['view_user_details'], 'User:user_details');

$app->get($r_user['view_rides'], 'Ride:user_view_previous_rides');

$app->get($r_user['view_current_ride'], 'Ride:user_view_current_ride');

//booking

$app->get($r_user['ride_amount_search'], 'Booking:search_amount');

$app->get($r_user['ride_amount_from_distance'], 'Booking:calculate_fare');

$app->get($r_user['ride_list_edu'], 'Booking:get_edu');

$app->post($r_user['ride_book_now'], 'Booking:book_ride');

//future booking
$app->post($r_user['ride_book_future'], 'FutureBooking:book_ride');

// $app->delete('/user/{id}', 'Auth:delete_account');

$app->get('/users', 'User:getAllUsers')->add($amw);

$app->get('/users/{id}', "User:getUser")->add($amw);
$app->get('/users/email/{email}', "User:getUserByEmail");

//Driver part

$app->post($r_driver['login'], 'DriverAuth:login');

$app->post($r_driver['register'], 'DriverAuth:register');

$app->get($r_driver['select_college'], 'DriverAuth:get_edu_list');

$app->get($r_driver['select_type'], 'DriverAuth:get_usertype_list');

$app->get($r_driver['car_models'], 'DriverAuth:Car_models');

$app->post($r_driver['shift_change'], 'Ride:driver_shift');

$app->post($r_driver['update_last_location'], 'Ride:update_location');

$app->get($r_driver['view_driver_details'], 'User:driver_details');

$app->get($r_driver['view_previous_trips'], 'Ride:driver_view_trips');
$app->post($r_driver['driver_near_notification'], 'Ride:notifyRider');

$app->get($r_driver['view_trip'], 'Ride:driver_trip');

$app->get($r_driver['ride_stop'], 'Ride:stop_ride');

$app->get($r_driver['view_active_trip'], 'Ride:rider_view_current_trip');

$app->get($r_driver['ride_start'], 'Ride:start_ride');

$app->get($r_driver['get_drivers_by_user'], 'Ride:getDriver');

//global
$app->get($r_global['get_available_drivers'], 'Ride:getAvailableDrivers');
$app->post($r_global['init_external_payment'], 'Wallet:initExternalPayment');
$app->post($r_global['start_transaction'], 'Wallet:start_transaction');

$app->any($r_global['get_transaction_callback'], 'Wallet:call_back_url');

$app->any($r_global['get_transaction_callback_trailing'], 'Wallet:call_back_url');

$app->post($r_global['verify_transaction'], 'Wallet:verify_transaction');

$app->get($r_global['balance'], "Wallet:view_balance"); //->add($amw);

$app->post($r_global['support_email'], "Email:support_email"); //->add($amw);

$app->post($r_global['update_profile'], "User:update_profile");

$app->post($r_global['update_driver_details'], "User:update_driver_details");
$app->post($r_global['update_profile_pic_ios'], "User:update_profile_picture_ios");
$app->post($r_global['update_profile_pic'], "User:update_profile_picture");
$app->post($r_global['update_email'], "User:update_email");

$app->post($r_global['update_password'], "User:update_password");
$app->post($r_global['update_bank_details'], "User:update_bank_details");
$app->get($r_global['view_bank_details'], "User:getBankDetails");

$app->post($r_global['otp'], "User:otp");

$app->post($r_global['phone_update'], "User:update_phone_with_otp");

$app->post($r_global['ride_pay'], "Ride:pay");

$app->get($r_global['ride_cancel'], "Ride:cancel_ride");
// $app->get($r_global['ride_cancel_paid'], "Ride:cancel_ride_paid");

$app->get($r_global['check_phone'], "Wallet:check_phone_exists");
$app->post($r_global['wallet_user_transfer'], "Wallet:transfer");
//$app->post($r_global['wallet_bank_transfer'], "Wallet:transfer_to_bank");

//$app->post($r_global['payout_driver'], "Wallet:payoutDrivers");

$app->get($r_global['wallet_banks'], "Wallet:list_banks");
$app->get($r_global['account_number'], "Wallet:verify_account_number");

$app->get($r_global['otp_disable'], "Otp:otp");
$app->get($r_global['otp_pin'], "Otp:pin");

$app->get($r_crons['check_upcoming_booking'], "cronbooking:search_upcoming_bookings");

//tests

// $app->post('/test', 'Auth:test');

// $app->get('/image/{name}/{height}/{width}', 'Auth:resize');

// $app->get('/location', 'Booking:test');

$app->get('/test', 'Tests:test');

$app->post('/testios', 'Tests:testios');

$app->post('/testlog', 'Tests:log');

$app->post('/geo', 'Tests:geotest');

// $app->any('/log', 'User:log');
