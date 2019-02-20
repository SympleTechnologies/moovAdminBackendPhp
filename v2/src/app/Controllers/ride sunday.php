<?php
namespace src\app\Controllers;

use src\app\Models\DriverDetails;
use src\app\Models\Rides;
use src\config\Api_Controller;

class Ride extends Api_Controller {

	public function driver_shift() {
		$types = array("online", "offline");

		$status = $this->input['status'];
		$userid = $this->input['userid'];
		$lat = $this->input['lat'];
		$long = $this->input['long'];

		$time = time_now();
		$date = date('Y-m-d', strtotime($time));
		$ctime = date('H:i:s', strtotime($time));

		if (in_array($status, $types)) {

			// Devices::find($userid)->update(['deleted' => 1]);
			$dd = DriverDetails::find($userid);
			$dd->dd_curent_status = $status;
			$dd->dd_last_status = $status;
			$dd->dd_status_date = $date;
			$dd->dd_status_time = $ctime;
			$dd->dd_current_lat = $lat;
			$dd->dd_current_long = $long;
			$dd->save();

// $data=array(
			//     'dd_curent_status' => $status,
			// 'dd_last_status' => $status,
			// 'dd_status_date' => $date,
			// 'dd_status_time' => $ctime,
			// 'dd_current_lat' => $lat,
			// 'dd_current_long' => $long
			// );

//             $count=$this->db->table('driver_details')->where('dd_driver_id', 17)->update([
			//                 'dd_curent_status' => $status,
			//                 ]);
			//                 echo $count;

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

	public function update_location() {

		$userid = $this->input['userid'];
		$lat = $this->input['lat'];
		$long = $this->input['long'];
		$tripid = $this->input['tripid'];

		DriverDetails::where('dd_driver_id', $userid)->update(['dd_current_lat' => $lat, 'dd_current_long' => $long]);

		$output = array(
			"status" => true,
			"message" => "Updated Successfully", //
		);
		return $this->response->withJson($output);

	}

	public function add_rating() {

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
				"message" => "An error occured, please tr again",
			);
		} else {
			$output = array(
				"status" => true,
				"message" => "Rating added successfully",
			);

		}
		return $this->response->withJson($output);

	}

	public function driver_view_trips($request, $response, $args) {

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

				$rides = Rides::select('cr_start_name as start', 'cr_stop_name as stop', 'cr_payment_status as payment_status')
					->where($details)
					->orderBy('cab_rides.cr_id', 'desc')
					->get()->toArray();
				$trips_data[] = array(
					"from" => $trip->ct_trip_start_from,
					"to" => $trip->ct_trip_start_to,
					"rides" => $rides,
				);

			}

		}

		if (!empty($trips_data)) {
			$output = array(
				"status" => true,
				"message" => "Trips Lists", //
				"data" => $trips_data,
			);

		} else {
			$output = array(
				"status" => false,
				"message" => "No trips found", //
			);

		}
		return $this->response->withJson($output);

	}

}
