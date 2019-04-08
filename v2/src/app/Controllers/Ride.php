<?php

namespace src\app\Controllers;

use src\app\Helpers\HWallet;
use src\app\Models\DriverDetails;
use src\app\Models\PriceShare;
use src\app\Models\Rides;
use src\app\Models\SchoolWallet;
use src\app\Models\Trips;
use src\app\Models\User as Users;
use src\app\Models\Wallet;
use src\config\Api_Controller;
use Rakit\Validation\Validator;
use src\config\Mail_Controller;
use src\app\Models\BankDetails;

class Ride extends Api_Controller
{

	//pending accept ride

	public function is_valid_name($file)
	{
		$filename = basename($file) . PHP_EOL;
		return preg_match('/^([-\.\w]+)$/', $filename) > 0;
	}
	public function getAvailableDrivers($request, $response, $args)
	{
		$schoolId = $args['school_id'];
		$query = DriverDetails::query();
		$query->join('users', function ($join) {

			$join->on('driver_details.dd_driver_id', '=', 'users.u_id');
		});

		$drivers = $query
			->where("users.u_edu_institution", $schoolId)
			->whereIn('dd_curent_status', ['online', 'ontrip', 'onride'])
			->select('driver_details.*')
			->get();
		return $this->response->withJson($drivers);
	}
	public function getAllDrivers($request, $response, $args)
	{
		$schoolId = $args['school_id'];
		$query = DriverDetails::with('user');
		$query->join('users', function ($join) {

			$join->on('driver_details.dd_driver_id', '=', 'users.u_id');
		});

		$drivers = $query
			->where("users.u_edu_institution", $schoolId)
			//->whereIn('dd_curent_status', ['online', 'ontrip', 'onride'])
			->select('driver_details.*')
			->get();
		return $this->response->withJson($drivers);
	}
	public function getDriver($request, $response, $args)
	{
		$userId = $args['user_id'];

		/* $query->join('users', function ($join) {
			
			$join->on('driver_details.dd_driver_id', '=', 'users.u_id');
		}); */
		

		$driver = DriverDetails::with('user','bank_detail')->where('driver_details.dd_driver_id', $userId)
			/* ->join('users', function ($join) {
				$join->on('driver_details.dd_driver_id', '=', 'users.u_id');
			}) */
			//->select('driver_details.*','users.*')
			->first();
		$result=$driver?$driver->toArray():null;
		// $result['user']=Users::where('u_id',$driver->dd_driver_id)/* ->exclude('password','u_push_token','u_token','u_image_100','u_image_200','u_push_token','u_temp_pass','u_last_otp') *//* ->select('u_first_name','u_last_name','u_email','u_edu_institution','u_image') */->first();
		// $result['bank_detail']=BankDetails::where('bd_user_id',$driver->dd_driver_id)->first();
		/* $result = [
			"driver_id" => $users->u_id,

			"first_name" => $users->u_first_name,

			"last_name" => $users->u_last_name,

			"email" => $users->u_email,

			"institution_id" => $users->u_edu_institution,

			"institution_name" => $users->ei_name,

			"phone" => $users->u_phone,

			"phone_country" => $users->u_phone_country,

			"gender" => $users->u_gender,

			"vehicle_no" => $users->dd_car_number,

			"verified" => $users->dd_admin_approved,

			"u_device_id" => $users->u_device_id,

			"car_capacity" => $users->dd_car_capacity,

			"license_no" => $users->dd_license,

			"license_expiry" => $users->dd_expiery_date,

			"dob" => $users->dd_birth_day,

			"wallet_balance" => $users->w_amount,

			"image" => $users->u_image,
			//Car details
		]; */
		return $this->response->withJson($result);
	}
	public function driver_shift()
	{

		$types = array("online", "offline");

		$status = $this->input['status'];

		$userid = $this->input['userid'];

		$lat = $this->input['lat'];

		$long = $this->input['long'];

		$time = time_now();

		$date = date('Y-m-d', strtotime($time));

		$ctime = date('H:i:s', strtotime($time));

		if (in_array($status, $types)) {

			/*
$dd = DriverDetails::find($userid);

$dd->dd_curent_status = $status;

$dd->dd_last_status = $status;

$dd->dd_status_date = $date;

$dd->dd_status_time = $ctime;

$dd->dd_current_lat = $lat;

$dd->dd_current_long = $long;

$dd->save();*/
			$this->db->table('driver_details')->where('dd_driver_id', $userid)->update([
				'dd_curent_status' => $status,
				'dd_last_status' => $status,
				'dd_status_date' => $date,
				'dd_status_time' => $ctime,
				'dd_current_lat' => $lat,
				'dd_current_long' => $long,
			]);

			$this->db->table('driver_shift')->insert([

				'ds_status' => $status,

				'ds_driver_id' => $userid,

				'ds_time' => $time,

				'ds_lat' => $lat,

				'ds_long' => $long,

			]);

			$output = array(

				"status" => true,

				"message" => "Updated Successfully", //

			);
		} else {

			$output = array(

				"status" => false,

				"message" => "Please choose a valid parameter",

			);
		}

		return $this->response->withJson($output);
	}

	public function update_location()
	{

		$userid = $this->input['userid'];

		$lat = $this->input['lat'];

		$long = $this->input['long'];

		$tripid = $this->input['tripid'];

		$status = DriverDetails::where('dd_driver_id', $userid)->update(['dd_current_lat' => $lat, 'dd_current_long' => $long]);

		if ($status) {

			$output = array(

				"status" => true,

				"message" => "Updated Successfully", //

			);
		} else {

			$output = array(

				"status" => false,

				"message" => "An error occured", //

			);
		}

		return $this->response->withJson($output);
	}
	public function notifyRider($request, $response, $args)
	{

		$rideId = $args['id'];

		$ride = Rides::find($rideId);
		if (!$ride) {
			return $this->response->withJson([
				'status' => false,
				'message' => "Ride not found!"
			])
				->withStatus(400);
		}
		$user = Users::find($ride->cr_user_id);
		$user_device_type = $user->u_device_type;
		$message = array(

			"ride_id" => $rideId,

			"trip_id" => $ride->cr_trip_id,

			"title" => "Ride notification",

			"message" => "Your driver is near!",

			'alert' => "Your driver is near!",

			'sound' => 'default',

		);
		if ($user_device_type == 'android') {

			AndroidPush_rider($ride->cr_user_id, $message);
		} elseif ($user_device_type == 'iOS') {

			iOSPush_rider($ride->cr_user_id, $message);
		}
		$output = [
			'status' => true,
			'message' => "Notification has been sent!"
		];
		return $this->response->withJson($output);
	}
	public function add_rating()
	{

		$id = $this->db->table('driver_ratings')->insertGetId([

			"dr_driver_id" => $this->input['driver_id'],

			"dr_trip_id" => $this->input['trip_id'],

			"dr_user_id" => $this->input['user_id'],

			"dr_rating_score" => $this->input['rating_score'],

			"dr_review" => $this->input['review'],

		]);

		if (empty($id)) {

			$output = array(

				"status" => false,

				"message" => "An error occured, please try again!",

			);
		} else {

			$output = array(

				"status" => true,

				"message" => "Rating added successfully",

			);
		}

		return $this->response->withJson($output);
	}

	public function driver_view_trips($request, $response, $args)
	{

		$driverid = $args['id'];

		$details = array(

			'ct_driver_id' => $driverid,

		);

		$details_data = array();

		$rides = array();

		$trips_data = array();

		$details_data[] = $this->db->table('cab_trip')

			// ->select('*')

			->where($details)

			->orderBy('cab_trip.ct_id', 'desc')

			//->limit(1)

			->get()->toArray();

		//  print_r($details_data);

		foreach ($details_data as $trips) {

			foreach ($trips as $trip) {

				// print_r($trip);

				$details = array(

					'cr_trip_id' => $trip->ct_id,

				);
				$image_url = $users['u_image'];

				$rides = Rides::select('cr_start_name as start', 'cr_stop_name as stop', 'cr_amount as amount', 'cr_payment_status as payment_status', 'cr_booked_on as booked_on', 'cr_ride_end_time as booked_closed_on', 'cr_no_passengers as seats', 'u_first_name')
					->selectRaw("CONCAT('" . $image_url . "',`u_image`)  AS image")
					->where($details)
					->leftJoin('users', 'cab_rides.cr_user_id', '=', 'users.u_id')

					->orderBy('cab_rides.cr_id', 'desc')

					->get()->toArray();

				// for ($i=0; $i < count($rides); $i++) {
				//    $image=$rides['image'];
				//    if(!$this->is_valid_name($image)){
				//     $rides[$i]['image']="";
				//    }
				// }

				$trips_data[] = array(

					"from" => $trip->ct_trip_start_from,

					'trip_id' => $trip->ct_id,

					'trip_start_time' => $trip->ct_trip_start,

					'pooling' => $trip->ct_is_pooling,

					"to" => $trip->ct_trip_start_to,

					"paid" => $trip->ct_payment_status,

					"rides" => $rides,

				);
			}
		}

		if (!empty($trips_data)) {

			$output = array(

				"status" => true,

				"message" => "Trips Lists", //

				"data" => $trips_data,

				"online_status" => $this->driver_status($driverid), //

			);
		} else {

			$output = array(

				"status" => false,

				"message" => "No trips found", //

				"online_status" => $this->driver_status($driverid), //

			);
		}

		return $this->response->withJson($output);
	}

	public function driver_status($id)
	{

		$status = DriverDetails::where('dd_driver_id', $id)->pluck('dd_curent_status')->toArray();

		return $status[0];
	}

	public function driver_trip($request, $response, $args)
	{

		$tripid = $args['id'];

		$details = array(

			'cr_trip_id' => $tripid,

		);

		$trip_details = array(

			'ct_id' => $tripid,

		);

		$details_data = array();

		$tripdata = $this->db->table('cab_trip')

			->where($trip_details)

			->first();

		// print_r($tripdata);

		$trips_data = array();
		$image_url = $users['u_image'];

		$rides = Rides::select('cr_id as ride_id', 'cr_start_name as start', 'cr_stop_name as stop', 'cr_amount as amount', 'cr_payment_status as payment_status', 'cr_booked_on as booked_on', "cr_cab_ride_status as status", 'u_first_name')
			->selectRaw("CONCAT('" . $image_url . "',`u_image`)  AS image")

			->where($details)
			->leftJoin('users', 'cab_rides.cr_user_id', '=', 'users.u_id')
			->orderBy('cab_rides.cr_id', 'desc')

			->get()->toArray();

		$trips_data[] = array(

			// "from" => $trip->ct_trip_start_from,

			// "to" => $trip->ct_trip_start_to,

			"rides" => $rides,

		);

		// for ($i=0; $i < count($rides); $i++) {
		//                $image=$rides['image'];
		//                if(!$this->is_valid_name($image)){
		//                 $rides[$i]['image']="";
		//                }
		//             }

		if (!empty($trips_data)) {

			$output = array(

				"status" => true,

				"message" => "Trips Lists", //

				'trip_id' => $tripdata->ct_id,

				'trip_start_time' => $tripdata->ct_trip_start,

				'pooling' => $tripdata->ct_is_pooling,

				'trip_status' => $tripdata->ct_trip_status,

				"data" => $trips_data,

				"online_status" => $this->driver_status($tripdata->ct_driver_id), //

			);
		} else {

			$output = array(

				"status" => false,

				"message" => "No trips found", //

				"online_status" => $this->driver_status($tripdata->ct_driver_id), //

			);
		}

		return $this->response->withJson($output);
	}

	public function pay()
	{

		$userid = $this->input['userid'];

		$rideid = $this->input['ride_id'];

		$amount = $this->input['amount'];

		$ride_details = $this->db->table('cab_rides')->where('cr_id', $rideid)->first();

		/* NEW BLOCK */
		if (\is_null($ride_details)) {
			return $this->response->withJson(array('status' => false, 'message' => 'Ride was not found'));
		}
		if ($ride_details->cr_payment_status == 'paid') {
			return $this->response->withJson(array('status' => false, 'message' => 'This ride has already been paid for'));
		}
		/* [NEW BLOCK ] */

		if ($ride_details->cr_amount > $amount) {

			$output = array(

				"status" => false,

				"message" => "Amount failed", //

			);
		} else {

			// $this->db->table('cab_rides')

			//     ->where('cr_id', $rideid)

			//     ->update([

			//         "cr_payment_status" => 'paid',

			//         "cr_payement_time" => time_now(),

			//     ]);

			/* NEW BLOCK */
			$user_details = Users::find($userid);
			$trip = Trips::find($ride_details->cr_trip_id);
			$driverid = $trip->ct_driver_id;
			$schoolid = $user_details->u_edu_institution;
			$priceshare = PriceShare::find($schoolid);
			/* [NEW BLOCK] */

			$w_balance = HWallet::balance($userid);

			$b = (float)$w_balance->balance;

			$new_wallet_balance = $b - $amount;

			if ($b >= $amount) {

				$this->db->table('wallet')

					->where('w_user_id', $userid)

					->update([

						"w_amount" => $new_wallet_balance,

						"w_last_updated" => time_now(),

					]);

				$time = time_now();

				$date = date('Y-m-d', strtotime($time));

				//

				$this->db->table('cab_rides')

					->where('cr_id', $rideid)

					->update([

						"cr_payment_status" => 'paid',

						"cr_payement_time" => time_now(),

					]);

				$where_rides = array(

					'cr_trip_id' => $ride_details->cr_trip_id,

					'cr_payment_status' => 'unpaid',

				);

				$ride_details_count = $this->db->table('cab_rides')->where($where_rides)->get()->count();

				if ($ride_details_count <= 0) {
					// SET CAB TRIP TO PAID ONLY WHEN ALL RELATED RIDES HAVE BEEN PAID FOR
					$this->db->table('cab_trip')

						->where('ct_id', $rideid)

						->update([

							"ct_payment_status" => 'paid',

							// "cr_payement_time" => time_now(),

						]);
				}

				/* NEW BLOCK*/
				// calculate portions based on priceshare formula
				$moov_portion = ($priceshare->moov / 100) * $amount;
				$driver_portion = ($priceshare->driver / 100) * $amount;
				$school_portion = ($priceshare->institution / 100) * $amount;
				/* [NEW BLOCK] */

				$this->db->table('moov_wallet')->insert([

					'mw_user_id' => $userid,

					'mw_transaction_type' => "ride",

					'mw_amount' => $moov_portion, // put only moov's portion in their wallet

					'mw_time' => $time,

					'mw_date' => $date,

				]);
				/* NEW BLOCK */
				// put drivers portion in drivers wallet
				$driver_wallet = Wallet::where('w_user_id', $driverid)->first();
				$driver_wallet->w_amount += $driver_portion;
				$driver_wallet->save();

				// put school portion in school wallet
				$school_wallet = SchoolWallet::where('w_edu_id', $schoolid)->first();
				if (\is_null($school_wallet)) {
					// the school wallet table is new so some schools might not have a wallet
					$school_wallet = new SchoolWallet();
					$school_wallet->w_edu_id = $schoolid;
					$school_wallet->w_amount = $school_portion;
					$school_wallet->save();
				} else {
					$school_wallet->w_amount += $school_portion;
					$school_wallet->save();
				}

				// RECORD transactions for both rewarding driver and school
				$this->db->table('transactions')->insert([
					't_user_id' => $driverid,
					't_reference' => '00_' . $rideid,
					't_access_code' => '000000',
					't_amount' => $driver_portion,
					't_currency' => 'NGN',
					't_status' => 'completed',
					't_started' => time_now(),
					't_date' => time_now(),
					't_type' => 'driver_pay',
					't_response' => 'done',
				]);
				$this->db->table('transactions')->insert([
					't_user_id' => $schoolid,
					't_reference' => '00_' . $rideid,
					't_access_code' => '000000',
					't_amount' => $school_portion,
					't_currency' => 'NGN',
					't_status' => 'completed',
					't_started' => time_now(),
					't_date' => time_now(),
					't_type' => 'school_pay',
					't_response' => 'done',
				]);

				/* [NEW BLOCK] */

				$this->db->table('transactions')->insert([

					't_user_id' => $userid,

					't_reference' => '00_' . $rideid,

					't_access_code' => '000000',

					't_amount' => $amount,

					't_currency' => 'NGN',

					't_status' => 'completed',

					't_started' => time_now(),

					't_date' => time_now(),

					't_type' => 'ride_pay',

					't_response' => 'done',

				]);

				$output = array(

					"status" => true,

					"message" => "paid successfully", //

				);
			} else {

				$output = array(

					"status" => false,

					"message" => "Insufficient balance, Please recharge wallet,", //

				);
			}
		}

		return $this->response->withJson($output);
	}

	public function start_ride($request, $response, $args)
	{

		$rideid = $args['id'];
		$lat = $args['lat'];
		$long = $args['long'];

		$trip = Rides::select('*')->where('cr_id', $rideid)->first();

		// $userdata = array(

		//     'cr_trip_id' => $trip['trip_id'],

		// );

		$userid = $trip['cr_user_id'];

		$users = Users::select('u_device_id', 'u_device_type')->where('u_id', $userid)->first();

		$user_device_type = $users['u_device_type'];

		$user_device_id = $users['u_device_id'];

		if (isset($user_device_id)) {

			$message = array(

				"ride_id" => $rideid,

				"title" => "Ride Started",

				"message" => "Your ride has been started",

				'alert' => "Your ride has been started",

				'sound' => 'default',

			);

			if ($user_device_type == 'android') {

				AndroidPush_rider($user_device_id, $message);
			} elseif ($user_device_type == 'iOS') {

				iOSPush_rider($user_device_id, $message);
			}
		}

		$status = $this->db->table('cab_rides')

			->where('cr_id', $rideid)

			->update([

				"cr_cab_ride_status" => 'onride',
				"cr_start_lat" => $lat,
				"cr_start_long" => $long,

				'cr_ride_start_time' => time_now(),

			]);

		if ($status) {

			$output = array(

				"status" => true,

				"message" => "Ride Started", //

			);
		} else {

			$output = array(

				"status" => false,

				"message" => "An error occured", //

			);
		}

		return $this->response->withJson($output);
	}

	public function pay_at_stop($rideid)
	{

		$ride_details = $this->db->table('cab_rides')->where('cr_id', $rideid)->first();

		$userid = $ride_details->cr_user_id;

		$amount = $ride_details->cr_amount;

		$w_balance = HWallet::balance($userid);

		$b = (float)$w_balance->balance;

		$new_wallet_balance = $b - $amount;

		/* NEW BLOCK */
		$user_details = Users::find($userid);
		$trip = Trips::find($ride_details->cr_trip_id);
		$driverid = $trip->ct_driver_id;
		$schoolid = $user_details->u_edu_institution;
		$priceshare = PriceShare::find($schoolid);
		/* [NEW BLOCK] */

		if ($b >= $amount) {

			$this->db->table('wallet')

				->where('w_user_id', $userid)

				->update([

					"w_amount" => $new_wallet_balance,

					"w_last_updated" => time_now(),

				]);

			$time = time_now();

			$date = date('Y-m-d', strtotime($time));

			//

			$this->db->table('cab_rides')

				->where('cr_id', $rideid)

				->update([

					"cr_payment_status" => 'paid',

					"cr_payement_time" => time_now(),

				]);

			$where_rides = array(

				'cr_trip_id' => $ride_details->cr_trip_id,

				'cr_payment_status' => 'unpaid',

			);

			$ride_details_count = $this->db->table('cab_rides')->where($where_rides)->get()->count();

			if ($ride_details_count <= 0) {

				$this->db->table('cab_trip')

					->where('ct_id', $rideid)

					->update([

						"ct_payment_status" => 'paid',

						// "cr_payement_time" => time_now(),

					]);
			}

			/* NEW BLOCK*/
			// calculate portions based on priceshare formula
			$moov_portion = ($priceshare->moov / 100) * $amount;
			$driver_portion = ($priceshare->driver / 100) * $amount;
			$school_portion = ($priceshare->institution / 100) * $amount;
			/* [NEW BLOCK] */

			$this->db->table('moov_wallet')->insert([

				'mw_user_id' => $userid,

				'mw_transaction_type' => "ride",

				'mw_amount' => $moov_portion,

				'mw_time' => $time,

				'mw_date' => $date,

			]);

			/* NEW BLOCK */
			// put drivers portion in drivers wallet
			$driver_wallet = Wallet::where('w_user_id', $driverid)->first();
			$driver_wallet->w_amount += $driver_portion;
			$driver_wallet->save();

			// put school portion in school wallet
			$school_wallet = SchoolWallet::where('w_edu_id', $schoolid)->first();
			if (\is_null($school_wallet)) {
				// the school wallet table is new so some schools might not have a wallet
				$school_wallet = new SchoolWallet();
				$school_wallet->w_edu_id = $schoolid;
				$school_wallet->w_amount = $school_portion;
				$school_wallet->save();
			} else {
				$school_wallet->w_amount += $school_portion;
				$school_wallet->save();
			}

			// RECORD transactions for both rewarding driver and school
			$this->db->table('transactions')->insert([
				't_user_id' => $driverid,
				't_reference' => '00_' . $rideid,
				't_access_code' => '000000',
				't_amount' => $driver_portion,
				't_currency' => 'NGN',
				't_status' => 'completed',
				't_started' => time_now(),
				't_date' => time_now(),
				't_type' => 'driver_pay',
				't_response' => 'done',
			]);
			$this->db->table('transactions')->insert([
				't_user_id' => $schoolid,
				't_reference' => '00_' . $rideid,
				't_access_code' => '000000',
				't_amount' => $school_portion,
				't_currency' => 'NGN',
				't_status' => 'completed',
				't_started' => time_now(),
				't_date' => time_now(),
				't_type' => 'school_pay',
				't_response' => 'done',
			]);

			/* [NEW BLOCK] */

			$this->db->table('transactions')->insert([

				't_user_id' => $userid,

				't_reference' => '00_' . $rideid,

				't_access_code' => '000000',

				't_amount' => $amount,

				't_currency' => 'NGN',

				't_status' => 'completed',

				't_started' => time_now(),

				't_date' => time_now(),

				't_type' => 'ride_pay',

				't_response' => 'done',

			]);

			return true;
		} else {

			return false;
		}
	}

	public function stop_ride($request, $response, $args)
	{
		\set_time_limit(0);
		$rideid = $args['id'];
		$lat = $args['lat'];
		$long = $args['long'];

		$trip = Rides::select('*')->where('cr_id', $rideid)->first();

		$userdata = array(

			'cr_trip_id' => $trip['cr_trip_id'],

		);

		$userid = $trip['cr_user_id'];

		$users = Users::select('u_device_id', 'u_device_type')->where('u_id', $userid)->first();

		$user_device_type = $users['u_device_type'];

		$user_device_id = $users['u_device_id'];

		if (isset($user_device_id)) {

			$message = array(
				"ride_id" => $rideid,

				"title" => "Ride Completed",

				"message" => "Your ride has been completed",

				'alert' => "Your ride has been completed",

				'sound' => 'default',

			);

			if ($user_device_type == 'android') {

				AndroidPush_rider($user_device_id, $message);
			} elseif ($user_device_type == 'iOS') {

				iOSPush_rider($user_device_id, $message);
			}
		}

		$status = $this->db->table('cab_rides')

			->where('cr_id', $rideid)

			->update([

				"cr_cab_ride_status" => 'completed',
				"cr_stop_lat" => $lat,
				"cr_stop_long" => $long,

				'cr_ride_end_time' => time_now(),

			]);

		$count = Rides::where($userdata)->whereNotIn('cr_cab_ride_status', ['completed', 'cancelled'])->count();

		if ($count <= 0) {

			Trips::where('ct_id', $trip['cr_trip_id'])

				->update(['ct_trip_status' => 'completed', 'ct_trip_end' => time_now()]);
		} else {

			Trips::where('ct_id', $trip['cr_trip_id'])

				->update(['ct_trip_status' => 'ontrip']);
		}

		if ($status) {

			$payment = $this->pay_at_stop($rideid);
			$this->send_ride_receipt($rideid);
			$output = array(

				"status" => true,

				"message" => "Ride stopped", //

				"payment" => $payment,

			);
		} else {

			$output = array(

				"status" => false,

				"message" => "An error occured", //

				"payment" => false,

			);
		}

		$output['udata'] = $userdata;

		return $this->response->withJson($output);
	}
	private function send_ride_receipt($rideId)
	{
		$ride = Rides::find($rideId);
		$trip = Trips::find($ride->cr_trip_id);
		$driver_details = $this->driver_details($trip->ct_driver_id);

		$user_details = Users::find($ride->cr_user_id);
		$mailer = new Mail_Controller();

		$driverloc = $this->driver_location($trip->ct_driver_id);
		$drive_details = $this->GetDrivingDistance($ride->cr_start_lat, $driverloc->dd_current_lat, $ride->cr_start_long, $driverloc->dd_current_long);
		$pickUpAddress = $trip->ct_trip_start_from;
		$pickupTitle = explode(',', $pickUpAddress)[0];
		$destinationAddress = $trip->ct_trip_start_to;
		$destinationTitle = explode(',', $destinationAddress)[0];
		$maildata = [
			"to" => $user_details->u_email,
			'subject' => "Moov ride receipt",
			'view_page' => 'emails/ride_receipt.html',
			'view_data' => [
				'user' => [
					'first_name' => $user_details->u_first_name
				],
				'driver' => [
					'display_name' => $driver_details['first_name'] . " " . $driver_details['last_name'],
					'profile_picture' => $driver_details['image'],
					'car_plate_number' => $driver_details['vehicle_no']
				],
				'trip' => [
					'amount' => $trip->ct_amount,
					'pickup_title' => $pickupTitle,
					'pickup_description' => $pickUpAddress,
					'destination_title' => $destinationTitle,
					'destination_description' => $destinationAddress,
					'distance' => @$drive_details['distance'] ? $drive_details['distance'] : "1 M",
					'time' => @$drive_details['time'] ? $drive_details['time'] : "1 M",
				]

			]
		];
		$mailer->send_mail($maildata);
	}

	public function cancel_ride($request, $response, $args)
	{

		// 'booked'

		$rideid = $args['id'];
		$type = $args['type'];

		$status = $this->db->table('cab_rides')

			->where('cr_id', $rideid)

			->update([

				"cr_cab_ride_status" => 'cancelled',

				'cr_ride_end_time' => time_now(),

			]);

		$trip = Rides::select('*')->where('cr_id', $rideid)->first();

		$userdata = array(

			'cr_trip_id' => $trip['cr_trip_id'],

		);

		$tripid = $trip['cr_trip_id'];
		$userid = $trip['cr_user_id'];

		$balance = HWallet::balance($userid);
		$amount = ($trip['cr_amount'] / 2);

		$balance = ($balance->balance - $amount);

		if ($type == 'paid') {
			$this->db->table('wallet')
				->where('w_user_id', $userid)
				->update([
					"w_amount" => $balance,
				]);
		}

		//////////////
		/*

	        $userid = $trip['cr_user_id'];

	        $users = Users::select('u_device_id', 'u_device_type')->where('u_id', $userid)->first();

*/

		///////////////

		$count = Rides::where($userdata)->whereNotIn('cr_cab_ride_status', ['completed', 'cancelled'])->count();

		if ($count <= 0) {

			Trips::where('ct_id', $trip['cr_trip_id'])

				->update(['ct_trip_status' => 'completed', 'ct_trip_end' => time_now()]);
		} else {

			Trips::where('ct_id', $trip['cr_trip_id'])

				->update(['ct_trip_status' => 'ontrip']);
		}

		if ($status) {

			$driverdata = $this->db->table('cab_trip')
				->select('u_device_id', 'u_device_type')
				->join('users', 'users.u_id', '=', 'cab_trip.ct_driver_id')
				->where('ct_id', $tripid)->first();

			$user_device_type = $driverdata->u_device_type;

			$user_device_id = $driverdata->u_device_id;

			if (isset($user_device_id)) {

				$message = array(

					"ride_id" => $rideid,

					"title" => "Ride Cancelled",

					"message" => "Ride has been cancelled by user",

					'alert' => "Ride has been cancelled by user",

					'sound' => 'default',

				);

				if ($user_device_type == 'android') {

					AndroidPush($user_device_id, $message);
				} elseif ($user_device_type == 'iOS') {

					iOSPush($user_device_id, $message);
				}
			}

			$output = array(

				"status" => true,

				"message" => "Ride cancelled", //
				// "dd"=>$driverdata

			);
		} else {

			$output = array(

				"status" => false,

				"message" => "An error occured", //

			);
		}

		return $this->response->withJson($output);
	}

	public function driver_location($userid)
	{
		$user = $this->db->table('driver_details')
			->select('dd_current_lat', 'dd_current_long')
			->where('driver_details.dd_driver_id', '=', $userid)

			->first();
		return $user;
	}

	public function driver_details($userid)
	{
		\set_time_limit(100);

		$users = $this->db->table('users')

			->leftJoin('driver_details', 'driver_details.dd_driver_id', '=', 'users.u_id')
			->leftJoin('edu_institution', 'edu_institution.ei_id', '=', 'users.u_edu_institution')
			->leftJoin('car_model', 'driver_details.dd_car_model_id', '=', 'car_model.cm_id')
			->leftJoin('wallet', 'wallet.w_user_id', '=', 'users.u_id')
			->where('users.u_id', '=', $userid)

			->first();

		$ratings = $this->db->table('driver_ratings')

			->where('dr_driver_id', $userid)

			->avg('dr_rating_score');

		$details = array(

			"driver_id" => $users->u_id,

			"first_name" => $users->u_first_name,

			"last_name" => $users->u_last_name,

			"email" => $users->u_email,

			"institution_id" => $users->u_edu_institution,

			"institution_name" => $users->ei_name,

			"phone" => $users->u_phone,

			"phone_country" => $users->u_phone_country,

			"gender" => $users->u_gender,

			"vehicle_no" => $users->dd_car_number,

			"verified" => $users->dd_admin_approved,

			"u_device_id" => $users->u_device_id,

			"car_capacity" => $users->dd_car_capacity,

			"license_no" => $users->dd_license,

			"license_expiry" => $users->dd_expiery_date,

			"dob" => $users->dd_birth_day,

			"ratings" => round($ratings, 2),

			"wallet_balance" => $users->w_amount,

			"image" => $users->u_image,
			//Car details
			"car_colour" => $users->car_colour,
			"car_image" => @$users->cm_model_image,
			"car_model" => @$users->cm_model_name,
			"car_make" => @$users->cm_make_name,
		);

		$dd_array = array_map(function ($val) {
			return is_null($val) ? "" : $val;
		}, $details);

		return $dd_array;
	}

	public function user_view_previous_rides($request, $response, $args)
	{

		$userid = $args['id'];

		$details = array(

			'cr_user_id' => $userid,

		);

		$rides_data = array();

		$rides = Rides::select('*')

			->where($details)

			->whereIn('cr_cab_ride_status', ['completed', 'cancelled'])

			->orderBy('cab_rides.cr_id', 'desc')

			->get()->toArray();

		foreach ($rides as $ride) {

			$trip_id = $ride['cr_trip_id'];

			$statement = $this->pdo->prepare("SELECT ct_driver_id FROM cab_trip where `ct_id`=$trip_id  LIMIT 1");

			$statement->execute();

			$trips_details_data = $statement->fetch(); //  All($this->pdo::FETCH_ASSOC);
			$driverDetails = $this->driver_details($trips_details_data['ct_driver_id']);

			$time = $ride['cr_booked_on'];

			$date = date('Y-m-d', strtotime($time));

			$ctime = date('H:i:s', strtotime($time));

			if (!empty($ride['cr_payement_time'])) {

				$payment_time = $ride['cr_payement_time'];
			} else {

				$payment_time = "";
			}

			$rides_data[] = array(

				'ride_id' => $ride['cr_id'],

				'ride_trip_id' => $ride['cr_trip_id'],

				'ride_driver_id' => $trips_details_data['ct_driver_id'],

				'ride_booked_on' => $ride['cr_booked_on'],

				'ride_booked_on_date' => $date,

				'ride_booked_on_time' => $ctime,

				'ride_amount' => $ride['cr_amount'],

				'ride_status' => $ride['cr_cab_ride_status'],

				'ride_payment_status' => $ride['cr_payment_status'],

				'ride_payment_time' => $payment_time,

				'ride_seats' => $ride['cr_no_passengers'],

				'ride_seats' => $ride['cr_no_passengers'],

				'ride_from' => $ride['cr_start_name'],

				'ride_to' => $ride['cr_stop_name'],

				'driver_data' => $driverDetails,

			);
		}

		if (!empty($rides_data)) {

			$output = array(

				"status" => true,

				"message" => "Rides Lists", //

				"count" => count($rides_data),

				"data" => $rides_data,

			);
		} else {

			$output = array(

				"status" => false,

				"count" => 0,

				"message" => "No rides found", //

			);
		}

		return $this->response->withJson($output);
	}

	public function user_view_current_ride($request, $response, $args)
	{

		$userid = $args['id'];

		$details = array(

			'cr_user_id' => $userid,

		);

		$rides_data = array();

		$rides = Rides::select('*')

			->where($details)

			->whereNotIn('cr_cab_ride_status', ['completed', 'cancelled'])

			->orderBy('cab_rides.cr_id', 'desc')
			->get()->toArray();

		// ->limit(1)

		//->first();

		if (!empty($rides)) {
			foreach ($rides as $ride) {

				$trip_id = $ride['cr_trip_id'];

				$statement = $this->pdo->prepare("SELECT ct_driver_id,ct_trip_type,ct_date,ct_time FROM cab_trip where ct_id=$trip_id ");

				$statement->execute();

				$trips_details_data = $statement->fetch(); //  All($this->pdo::FETCH_ASSOC);

				$time = $ride['cr_booked_on'];

				$date = date('Y-m-d', strtotime($time));

				$ctime = date('H:i:s', strtotime($time));

				if (!empty($ride['cr_payement_time'])) {

					$payment_time = $ride['cr_payement_time'];
				} else {

					$payment_time = "";
				}
				$driverDetails = $this->driver_details($trips_details_data['ct_driver_id']);
				$driverloc = $this->driver_location($trips_details_data['ct_driver_id']);

				$drive_details = $this->GetDrivingDistance($ride['cr_start_lat'], $driverloc->dd_current_lat, $ride['cr_start_long'], $driverloc->dd_current_long);
				$locations_poly = \GeometryLibrary\PolyUtil::decode($ride['cr_polyline']);

				$rides_data[] = array(

					'ride_id' => $ride['cr_id'],

					'ride_trip_id' => $ride['cr_trip_id'],

					'ride_type' => $trips_details_data['ct_trip_type'],
					'future_date' => $trips_details_data['ct_date'],
					'future_time' => $trips_details_data['ct_time'],

					'ride_driver_id' => $trips_details_data['ct_driver_id'],

					'ride_booked_on' => $ride['cr_booked_on'],

					'ride_booked_on_date' => $date,

					'ride_booked_on_time' => $ctime,

					'ride_amount' => $ride['cr_amount'],

					'ride_status' => $ride['cr_cab_ride_status'],

					'ride_payment_status' => $ride['cr_payment_status'],

					'ride_payment_time' => $payment_time,

					'ride_seats' => $ride['cr_no_passengers'],

					'ride_seats' => $ride['cr_no_passengers'],

					'ride_from' => $ride['cr_start_name'],

					'ride_to' => $ride['cr_stop_name'],

					"driver_details" => $driverDetails,
					"drive_detais" => $drive_details,
					"poly_lines" => array('start' => reset($locations_poly) ? reset($locations_poly) : null, 'end' => end($locations_poly) ? end($locations_poly) : null),
					"poly_line" => ($ride['cr_polyline']),

				);
			}

			if (!empty($rides_data)) {

				$output = array(

					"status" => true,

					"message" => "Rides Lists", //

					"count" => count($rides_data),

					"data" => $rides_data,

				);
			} else {

				$output = array(

					"status" => false,

					"count" => 0,

					"message" => "No rides found", //

				);
			}
		} else {

			$output = array(

				"status" => false,

				"count" => 0,
				//  "cc" => $rides,

				"message" => "No rides found", //

			);
		}

		return $this->response->withJson($output);
	}

	public function get_polyline($origin, $destination)
	{

		$googleApiKey = $this->env['google_map_api'];

		$url = 'https://maps.googleapis.com/maps/api/directions/json?origin=' . ($origin) . '&destination=' . ($destination) . '&travelMode=driving&key=' . $googleApiKey . "&libraries=geometry,places&sensor=false&waypoints";

		$curl = curl_init();

		curl_setopt_array($curl, [

			CURLOPT_URL => $url,

			CURLOPT_RETURNTRANSFER => true,

			CURLOPT_ENCODING => "",

			CURLOPT_MAXREDIRS => 10,

			CURLOPT_TIMEOUT => 30,

			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,

			CURLOPT_CUSTOMREQUEST => "GET",

			CURLOPT_HTTPHEADER => [

				"cache-control: no-cache",

			],

		]);

		$response = curl_exec($curl);

		$response_array = json_decode($response, true);
		$legs = $response_array['routes'][0]['legs'];

		$steps = $legs[0]['steps'];

		$poly = array();

		foreach ($steps as $locations) {

			$points = \Polyline::decode($locations['polyline']['points']);

			$poly[] = \Polyline::pair($points);
		}

		$new = array_reduce($poly, 'array_merge', array());

		$encoded = \Polyline::encode($new); // complete polyline

		$data = array(
			"distance" => $legs[0]['distance']['text'],
			"duration" => $legs[0]['duration']['text'],
			"line_to_driver" => $encoded,

		);

		return $data;
	}

	public function rider_view_current_trip($request, $response, $args)
	{

		$userid = $args['id'];
		// $u_lat = $args['lat'];
		// $u_long = $args['long'];
		$driver_locations = $this->driver_location($userid);
		$trip_details = array(

			'ct_driver_id' => $userid,

		);

		$details_data = array();

		$tripdata = $this->db->table('cab_trip')

			->where($trip_details)

			->whereNotIn('ct_trip_status', ['completed', 'cancelled'])

			->orderBy('cab_trip.ct_id', 'desc')

			->first();

		$details = array(

			'cr_trip_id' => $tripdata->ct_id,

		);

		$trips_data = array();
		$image_url = $users['u_image'];

		$rides = Rides::select(
			'cr_id as ride_id',
			'cr_user_id as u_id',
			'cr_start_name as start',
			'cr_stop_name as stop',
			'cr_amount as amount',
			'cr_payment_status as payment_status',
			'cr_booked_on as booked_on',
			"cr_cab_ride_status as status",
			'u_first_name',
			'cr_start_lat',
			'cr_start_long',
			'cr_polyline'
		)
			->selectRaw("CONCAT('" . $image_url . "',`u_image`)  AS image")

			->where($details)

			->orderBy('cab_rides.cr_id', 'desc')
			->leftJoin('users', 'cab_rides.cr_user_id', '=', 'users.u_id')
			->get()->toArray();
		// for ($i = 0; $i < count($rides); $i++) {
		//     $image = $rides['image'];
		//     if (!$this->is_valid_name($image)) {
		//         $rides[$i]['image'] = "";
		//     }
		// }

		$rides_with_distance = array();
		foreach ($rides as $ride) {
			// $userdetails[] = Users::select('u_id', 'u_first_name', 'u_image')->where('u_id', $ride['u_id'])->first();

			$start_lat = $ride['cr_start_lat'];
			$start_long = $ride['cr_start_long'];

			// $response =  \GeometryLibrary\PolyUtil::distanceToLine(
			//             ['lat' => $driver_locations->dd_current_lat, 'lng' => $driver_locations->dd_current_long], // point array [lat, lng]
			//               ['lat' =>$driver_locations->dd_current_lat, 'lng' => $driver_locations->dd_current_long], // line startpoint array [lat, lng]
			//               ['lat' => $start_lat, 'lng' =>$start_long] // line endpoint array [lat, lng]
			//              );
			$origin = $driver_locations->dd_current_lat . "," . $driver_locations->dd_current_long;
			$destination = $start_lat . ',' . $start_long;
			$drive_poly = $this->get_polyline($origin, $destination);
			$drive_locs = array(
				"start" => array(
					"lat" => $driver_locations->dd_current_lat,
					"lng" => $driver_locations->dd_current_long,
				),
				"stop" => array(
					"lat" => $start_lat,
					"lng" => $start_long,
				),
			);

			$locations_poly = \GeometryLibrary\PolyUtil::decode($ride['cr_polyline']);

			$rides_with_distance[] = array(
				'ride_id' => $ride['ride_id'],
				'u_id' => $ride['u_id'],
				'start' => $ride['start'],
				'stop' => $ride['stop'],
				'amount' => $ride['amount'],
				'payment_status' => $ride['payment_status'],
				'booked_on' => $ride['booked_on'],
				'status' => $ride['status'],
				'u_first_name' => $ride['u_first_name'],
				'image' => $ride['image'],
				// 'distance_to_user'=>number_format($response, 2, '.', ''), // 12325.124046196 in meters
				'distance_to_user' => $drive_poly['distance'], // 12325.124046196 in meters
				'path_to_user' => $drive_poly['line_to_driver'], // 12325.124046196 in meters
				'path_to_user_cordinates' => $drive_locs, // 12325.124046196 in meters
				"poly_lines" => array('start' => reset($locations_poly), 'end' => end($locations_poly)),
				// "poly_lines"=> \GeometryLibrary\PolyUtil::decode($ride['cr_polyline']),
				"poly_line" => ($ride['cr_polyline']),
			);
			// $rides_with_distanc1e[]=$response; // 12325.124046196 in meters
		}
		usort($rides_with_distance, function ($a, $b) {
			return $a['distance_to_user'] <=> $b['distance_to_user'];
		});

		$trips_data[] = array(

			//  "from" => $trip->ct_trip_start_from,

			// "to" => $trip->ct_trip_start_to,

			"rides" => $rides_with_distance,

		);

		//  $users = Users::select('u_id', 'u_first_name', 'u_image')->where('u_id', $users->id)->first();

		if (!empty($tripdata->ct_id)) {

			if (!empty($trips_data)) {

				$output = array(

					"status" => true,

					"message" => "Trips Lists", //

					'trip_id' => $tripdata->ct_id,

					'trip_start_time' => $tripdata->ct_trip_start,

					'pooling' => $tripdata->ct_is_pooling,

					'trip_status' => $tripdata->ct_trip_status,

					"data" => $trips_data,
					"online_status" => $this->driver_status($userid), //

				);
			} else {

				$output = array(

					"status" => false,

					"message" => "No trips found", //

					"online_status" => $this->driver_status($userid), //

				);
			}
		} else {

			$output = array(

				"status" => false,

				"message" => "No trips found", //

				"online_status" => $this->driver_status($userid), //

			);
		}

		// $output['tests']=$rides_with_distance ;

		return $this->response->withJson($output);
	}

	public function GetDrivingDistance($lat1, $lat2, $long1, $long2)
	{

		$key = get_env('google_map_api');
		$url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=" . $lat1 . "," . $long1 . "&destinations=" . $lat2 . "," . $long2 . "&mode=driving&language=pl-PL&key={$key}";
		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL, $url);

		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

		curl_setopt($ch, CURLOPT_PROXYPORT, 3128);

		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);

		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);

		$response = curl_exec($ch);

		curl_close($ch);

		$response_a = json_decode($response, true);
		/* if(empty($response_a['rows'])){
			return null;
		} */
		$dist = @$response_a['rows'][0]['elements'][0]['distance']['text'];

		$time = @$response_a['rows'][0]['elements'][0]['duration']['text'];

		return array('distance' => $dist, 'time' => $time);
	}
}
