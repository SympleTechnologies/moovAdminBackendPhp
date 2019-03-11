<?php

namespace src\app\Controllers;

use src\app\Helpers\Helper;
use src\app\Models\DriverDetails;
use src\app\Models\Rides;
use src\app\Models\User as Users;
use src\config\Api_Controller;

class cronbooking extends Api_Controller {

	public function search_upcoming_bookings() {

//  $this->logger->Notice('Crone Run', ['time' => time_now()]);

		$time = time_now();
		$date = date('Y-m-d', strtotime($time));
		$ctime = date('H:i:s', strtotime($time . '-2 minutes'));
		// // $time="11:00:00";
		$longtime = date('H:i:s', strtotime($time . '+10 minutes'));

		// echo "Data $ctime long $longtime date $date";
		//  echo $ctime. " ".$longtime;
		$where = array(
			'ct_trip_type' => 'upcoming',
			'ct_date' => $date,
			'ct_trip_status' => 'reserved',
		);
		$details_data = $this->db->table('cab_trip')->where($where)
			->whereBetween('ct_time', [$ctime, $longtime])
			->orderBy('cab_trip.ct_id', 'desc')->get()->toArray();
		if (!empty($details_data)) {
			foreach ($details_data as $tripdata) {
				$pooling = $tripdata->ct_is_pooling;
				$tripid = $tripdata->ct_id;
				$details = array(
					'cr_trip_id' => $tripdata->ct_id,
				);
				$rides = Rides::select('*')->where($details)
					->whereNotIn('cr_cab_ride_status', ['completed', 'cancelled'])

				// ->orderBy('cab_rides.cr_id', 'desc')

				// ->get()->toArray();
					->first();

				$from_lat = $rides->cr_start_lat;
				$from_long = $rides->cr_start_long;
				$rideid = $rides->cr_id;
				$tripid = $rides->cr_trip_id;
				$seats = $rides->cr_no_passengers;
				$userid = $rides->cr_user_id;

				if ($drivers_distance = $this->getClosestCars($from_lat, $from_long, $groupby = "", $distance = $this->env['booking_distance'], $limit = 15)) {
					//find drivers near 15 km

					// print_r($drivers_distance);

					//get driver id

					$trips_details_data = array();

					//find trip details

					$di = 0;

					$drivers = $drivers_distance;

					foreach ($drivers_distance as $Drivers) {

						$distance = $Drivers['distance'];

						$driver_id = $Drivers['dd_driver_id'];

						$driver_college = $Drivers['dd_colleg_id'];

						$car_details = $Drivers['dd_car_number'];

						$car_capacity = $Drivers['dd_car_capacity'];

						$statement = $this->pdo->prepare("SELECT * FROM cab_trip where `ct_driver_id`=$driver_id and ct_date = '$date' and ct_trip_status NOT IN ('completed','cancelled' 'any other array valuess'  )  ORDER BY `cab_trip`.`ct_id` DESC LIMIT 1");

						// and ct_is_pooling='yes'

						$statement->execute();

						$trips_details_data = $statement->fetch(); //  All($this->pdo::FETCH_ASSOC);

						if (is_array($trips_details_data) && !empty($trips_details_data)) {

							$trips_data = $this->b_get_trips_data($trips_details_data['ct_id']);

							if ($trips_details_data['ct_is_pooling'] == 'yes') {

								$drivers[$di]['ontrip'] = 'yes';
								$drivers[$di]['ontrip_pooling'] = 'yes';

							} else {

								if (is_array($trips_data) && !empty($trips_data)) {

									$drivers[$di]['ontrip'] = 'yes';

									$drivers[$di]['ontrip_pooling'] = 'no';

								} else {

									$drivers[$di]['ontrip'] = 'no';

									$drivers[$di]['ontrip_pooling'] = 'no';

								}

							}

							if (isset($trips_data[0]['total_used_seats'])) {

								$drivers[$di]['used_seats'] = $trips_data[0]['total_used_seats'];

							} else {

								$drivers[$di]['used_seats'] = 0;

							}

							// $drivers[$di]['used_seats'] = $trips_data[0]['total_used_seats'] ;

							$drivers[$di]['trips'] = $trips_details_data;

							$drivers[$di]['trips_data'] = $trips_data;

						} else {

							$drivers[$di]['ontrip'] = 'no';

							$drivers[$di]['used_seats'] = 0;

						}

						$di++;

					}

					//ppoling starts

					if ($pooling == 'yes') {

						$pool_drivers_data = $this->get_driver_on_road_by_status($drivers, $ontrip = 'yes', $onpooling = 'yes', $seats);

						if (is_array($pool_drivers_data) && !empty($pool_drivers_data)) {

							$assigned_driver_id = $pool_drivers_data[0]['data']['dd_driver_id'];

							$driver_details = $this->driver_details($assigned_driver_id);

							$assigned_driver_device_id = $driver_details['u_device_id'];

							$assigned_driver_device_type = $driver_details['device_type'];

							$assigned_tripid = $pool_drivers_data[0]['data']['trips']['ct_id'];

							$is_pooling_available = 'yes';

							$is_booking_available = 'yes';

						} else {

							$fresh_drivers_data = $this->get_driver_on_road_by_status_fresh($drivers, $ontrip = 'no', $onpooling = 'no', $seats);

							if (is_array($fresh_drivers_data) && !empty($fresh_drivers_data)) {

								$is_pooling_available = 'no';

								$is_booking_available = 'yes';

								$assigned_driver_id = $fresh_drivers_data[0]['data']['dd_driver_id'];

								$driver_details = $this->driver_details($assigned_driver_id);

								$assigned_driver_device_id = $driver_details['u_device_id'];

								$assigned_driver_device_type = $driver_details['device_type'];

							} else {

								$is_pooling_available = 'no';

								$is_booking_available = 'no';

							}

						}

						if ($is_pooling_available == 'yes' && $is_booking_available == 'yes') {

							//add to ride ith old trip id

							$trip_data = array(

								"ct_driver_id" => $assigned_driver_id,
								"ct_trip_status" => 'booked',
								"ct_trip_type" => 'live',

							);

							$assigned_tripid = $this->update_trip($tripid, $trip_data);

						} elseif ($is_pooling_available == 'no' && $is_booking_available == 'yes') {

							//add as new trip

							$trip_data = array(

								"ct_driver_id" => $assigned_driver_id,
								"ct_trip_status" => 'booked',
								"ct_trip_type" => 'live',

							);

							$assigned_tripid = $this->update_trip($tripid, $trip_data);

//                 $ride_data = array(
							//                         // cr_start_lat
							// // cr_start_long
							// // cr_stop_lat
							// // cr_stop_long
							// // // cr_amount

//                 );

//                 $assigned_ride_id = $this->update_ride($ride_data);

							$booking_response = array(

								"status" => true,

								"data" => array(

									"driver_details" => $driver_details,

									"distance_to_drive_details" => $drive_details,

									"trip_id" => $assigned_tripid,

									"ride_id" => $assigned_ride_id,

								),

								"message" => "Ride booked",

								"links" => array(

									"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

								),

							);

						} elseif ($is_pooling_available == 'no' && $is_booking_available == 'no') {

							$booking_response = array(

								"status" => false,

								"message" => "No drivers found near you, please try again",

								"links" => array(

									"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

								),

							);

						} else {

							//critical errors

							$booking_response = array(

								"status" => false,

								"message" => "No seats available in pooling, please use un-pooled cars",

								"links" => array(

									"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

								),

							);

						}

					} else {

						//no pooling

						$fresh_drivers_data = $this->get_driver_on_road_by_status_fresh($drivers, $ontrip = 'no', $pooling = 'no', $seats);

						if (is_array($fresh_drivers_data) && !empty($fresh_drivers_data)) {

							$assigned_driver_id = $fresh_drivers_data[0]['data']['dd_driver_id'];

							// $assigned_driver_device_type = $driver_details['device_type'];

							$driver_details = $this->driver_details($assigned_driver_id);

							$assigned_driver_device_id = $driver_details['u_device_id'];

							$assigned_driver_device_type = $driver_details['device_type'];

							$trip_data = array(

								"ct_driver_id" => $assigned_driver_id,
								"ct_trip_status" => 'booked',
								"ct_trip_type" => 'live',

							);

							$assigned_tripid = $this->update_trip($tripid, $trip_data);

							// $ride_data = array(

							//          // cr_start_lat
							//         // cr_start_long
							//         // cr_stop_lat
							//         // cr_stop_long

							// );

							// $assigned_ride_id = $this->update_ride($ride_data);

							$booking_response = array(

								"status" => true,

								"data" => array(

									"driver_details" => $driver_details,

									"distance_to_drive_details" => $drive_details,

									"trip_id" => $assigned_tripid,

									"ride_id" => $assigned_ride_id,

								),

								"message" => "Ride booked",

								"links" => array(

									"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

								),

							);

						} else {

							$booking_response = array(

								"status" => false,

								"message" => "No seats available, you can try pooled cars ",

								"links" => array(

									"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

								),

							);

						}

					}

					if (isset($assigned_driver_device_id)) {

						// $assigned_driver_device_type = $driver_details['device_type'];

						$message = array(

							"ride_id" => $assigned_ride_id,

							"trip_id" => $assigned_tripid,

							"title" => "New booking",

							"message" => "A new ride has been booked",

							'alert' => "A new ride has been booked",

							'sound' => 'default',

						);

						if ($assigned_driver_device_type == 'android') {

							AndroidPush($assigned_driver_device_id, $message);

						} elseif ($assigned_driver_device_type == 'iOS') {

							iOSPush($assigned_driver_device_id, $message);

						}

						$message = array(

							"ride_id" => $assigned_ride_id,

							"trip_id" => $assigned_tripid,

							"title" => "Ride booked",

							"message" => "A new ride has been booked",

							'alert' => "A new ride has been booked",

							'sound' => 'default',

						);

						$users = Users::select('u_device_id', 'u_device_type')->where('u_id', $userid)->first();

						$user_device_type = $users['u_device_type'];

						$user_device_id = $users['u_device_id'];

						if ($user_device_type == 'android') {

							AndroidPush_rider($user_device_id, $message);

						} elseif ($user_device_type == 'iOS') {

							iOSPush_rider($user_device_id, $message);

						}

					}
				}

			} //loop close

		}

		$ridelog = "
     user -  $user_device_type '------, '  $user_device_id , $message <br>

        ";

		// $details_data=$this->input['songs_array'];
		// $n=json_encode($details_data,true);
		// print_r($n);
		echo date('m/d/Y h:i:s a', time());
		$this->logger->Notice('Crone Run', ['time' => $ridelog]);

// iOSPush_rider('262c8f0d486c18e73f91a88bf8df36e850c5a98b5fed41053b1e532bb11dc162', $message);

		return $this->response->withJson($details_data);
	}

	public function update_trip($id, $array) {
// ct_driver_id
		// ct_trip_status

		$this->db->table('cab_trip')

			->where('ct_id', $id)

			->update($array);
	}

	public function update_ride($id, $array) {
// cr_start_lat
		// cr_start_long
		// cr_stop_lat
		// cr_stop_long
		// // cr_amount
	}

	public function search_amount($request, $response, $args) {

		$origin = $args['from'];

		$destination = $args['to'];

		$seats = $args['seats'];

		$pooling = $args['pooling'];

		$googleApiKey = $this->env['google_map_api'];

		$url = 'https://maps.googleapis.com/maps/api/directions/json?origin=' . urlencode($origin) . '&destination=' . urlencode($destination) . '&travelMode=driving&key=' . $googleApiKey . "&libraries=geometry,places&sensor=false&waypoints";

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

		$distance = $legs[0]['distance']['text'];

		$distance_value = $legs[0]['distance']['value'];

		$duration = $legs[0]['duration']['text'];

		$total_distance = $distance_value / 1000;

		$ride_rates = $this->db->table('ride_rates')

			->select("*")

			->orderBy('ride_rates.rr_id', 'desc')

			->first();

		$peekHours = $this->db->table('ride_peak_hours')

			->select("rph_from as start", "rph_to as to")->get()->toArray();

// print_r(collect($peekHours)->toArray());

		$data = in_array("yes", array_map(array($this, 'check_peek_hours'), $peekHours));

		if ($data) {

			//Peek Hour

			$rate = $ride_rates->rr_normal_rate;

		} else {

//Normal hour

			$rate = $ride_rates->rr_peak_hour_rate;

		}

		$per_km = $ride_rates->rr_per_kilometer;

		$amount = ($total_distance * $per_km) + $rate;

		$finalamount = $amount * $seats;

		if ($pooling == "no" && $seats < 4) {

			$n = 4 - $seats;

			$newseats = $n + $seats;

			$amount = ($total_distance * $per_km) + $rate;

			$finalamount = $amount * $newseats;

		}

		$result = array(

			"status" => true,

			"data" => array("amount" => round($finalamount, 2)),

			"message" => "Amount calculated",

			"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

		);

		return $this->response->withJson($result);

	}

	/* calculate fare by distance

		    public function calculate_fare($request, $response, $args)

		    {

		    $distance = $args['distance'];

		    $pooling = $args['pooling'];

		    $seats = $args['seats'];

		    //$college = $args['college'];

		    $total_distance = $distance / 1000;

		    $amount = $total_distance * 2;

		    $result = array(

		    "status" => true,

		    "data" => array("amount" => $amount),

		    "message" => "Amount calculated",

		    "links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

		    );

		    return $this->response->withJson($result);

		    }

	*/

	public function check_peek_hours($data) {

		$now = new \Datetime();

		$start = new \DateTime($data->start);

		$end = new \DateTime($data->to);

		if ($now >= $start && $now <= $end) {

			return "yes";

		} else {

			return "no";

		}

	}

	public static function getClosestCars($lat, $lng, $city, $distance = 20, $limit = 20) {

		$time = time_now();

		$date = date('Y-m-d', strtotime($time));

		$ctime = date('H:i:s', strtotime($time));

		$coordinates = ['latitude' => $lat, 'longitude' => $lng];

		$where = array(

			"dd_status_date" => $date,

		);

		$cares = self::scopeIsWithinMaxDistance(DriverDetails::raw('select *'), $coordinates, $distance)

			->where($where)

			->whereIn('dd_curent_status', ['online', 'ontrip', 'onride'])

			->limit($limit)->get();

		return $cares ? $cares->toArray() : null;

	}

	public static function scopeIsWithinMaxDistance($query, $coordinates, $radius = 50) {

		$haversine = "(3961 * acos(cos(radians(" . $coordinates['latitude'] . "))



                * cos(radians(`dd_current_lat`))



                * cos(radians(`dd_current_long`)



                - radians(" . $coordinates['longitude'] . "))



                + sin(radians(" . $coordinates['latitude'] . "))



                * sin(radians(`dd_current_lat`))))";

		return $query->select('*')

			->selectRaw("{$haversine} AS distance")

			->orderByRaw("{$haversine} asc")

			->whereRaw("{$haversine} < ?", [$radius]);

		// ->groupBy("city");

	}

	public function distance_jj_best() {

		$radius = 50;

		$drivers_distance = DriverDetails::select('driver_details.*')

			->join('users', function ($join) {

				$join->on('driver_details.dd_driver_id', '=', 'users.u_id');

			})

			->selectRaw('( 6371 * acos( cos( radians(?) ) *



                               cos( radians( dd_current_lat ) )



                               * cos( radians( dd_current_long ) - radians(?)



                               ) + sin( radians(?) ) *



                               sin( radians( dd_current_lat ) ) )



                             ) AS distance', [$start_cordinate['lat'], $start_cordinate['lng'], $start_cordinate['lat']])

			->havingRaw("distance < ?", [$radius])

			->get();

		print_r($drivers_distance);

	}

	public function book_ride() {

		$parsedBody = $this->request->getParsedBody();

		$this->logger->Info('Book Request', $parsedBody);

		$time = time_now();

		$date = date('Y-m-d', strtotime($time));

		$ctime = date('H:i:s', strtotime($time));

		$drivercat = $this->env['driver_id'];

		$uid = $this->input['userid'];

		$from = $this->input['from'];

		$to = $this->input['to'];

		$pooling = $this->input['pooling'];

		$seats = $this->input['seats'];

		$amount = $this->input['amount'];

		$current_lat = $this->input['current_lat'];

		$current_long = $this->input['current_long'];

		$from_lat = $this->input['from_lat'];

		$from_long = $this->input['from_long'];

		$to_lat = $this->input['to_lat'];

		$to_long = $this->input['to_long'];

		$mapData = $this->get_map_data($from, $to);

		//echo json_encode($mapData);

		$start = $mapData['start'];

		$ends = $mapData['ends'];

		$distance = $mapData['distance'];

		$calculated_distance = $mapData['calculated_distance'];

		$distance_value = $mapData['distance_value'];

		$duration = $mapData['duration'];

		$duration_value = $mapData['duration_value'];

		$polyline = $mapData['polyline'];

		$fullCordinates = $mapData['fullCordinates'];

		$fullCordinates_latlng = $mapData['fullCordinates_latlng'];

		//  $start_cordinate = $mapData['start_cordinate'];

		//get drivers near user

		$drive_details = $this->GetDrivingDistance($from_lat, $current_lat, $from_long, $current_long);

		if ($drivers_distance = $this->getClosestCars($from_lat, $from_long, $groupby = "", $distance = $this->env['booking_distance'], $limit = 15)) {
			//find drivers near 15 km

			// print_r($drivers_distance);

			//get driver id

			$trips_details_data = array();

			//find trip details

			$di = 0;

			$drivers = $drivers_distance;

			foreach ($drivers_distance as $Drivers) {

				$distance = $Drivers['distance'];

				$driver_id = $Drivers['dd_driver_id'];

				$driver_college = $Drivers['dd_colleg_id'];

				$car_details = $Drivers['dd_car_number'];

				$car_capacity = $Drivers['dd_car_capacity'];

				$statement = $this->pdo->prepare("SELECT * FROM cab_trip where `ct_driver_id`=$driver_id and ct_date = '$date' and ct_trip_status NOT IN ('completed','cancelled' 'any other array valuess'  )  ORDER BY `cab_trip`.`ct_id` DESC LIMIT 1");

				// and ct_is_pooling='yes'

				$statement->execute();

				$trips_details_data = $statement->fetch(); //  All($this->pdo::FETCH_ASSOC);

				if (is_array($trips_details_data) && !empty($trips_details_data)) {

					$trips_data = $this->b_get_trips_data($trips_details_data['ct_id']);

					if ($trips_details_data['ct_is_pooling'] == 'yes') {

						$drivers[$di]['ontrip'] = 'yes';

						$drivers[$di]['ontrip_pooling'] = 'yes';

					} else {

						if (is_array($trips_data) && !empty($trips_data)) {

							$drivers[$di]['ontrip'] = 'yes';

							$drivers[$di]['ontrip_pooling'] = 'no';

						} else {

							$drivers[$di]['ontrip'] = 'no';

							$drivers[$di]['ontrip_pooling'] = 'no';

						}

					}

					if (isset($trips_data[0]['total_used_seats'])) {

						$drivers[$di]['used_seats'] = $trips_data[0]['total_used_seats'];

					} else {

						$drivers[$di]['used_seats'] = 0;

					}

					// $drivers[$di]['used_seats'] = $trips_data[0]['total_used_seats'] ;

					$drivers[$di]['trips'] = $trips_details_data;

					$drivers[$di]['trips_data'] = $trips_data;

				} else {

					$drivers[$di]['ontrip'] = 'no';

					$drivers[$di]['used_seats'] = 0;

				}

				$di++;

			}

			//ppoling starts

			if ($pooling == 'yes') {

				$pool_drivers_data = $this->get_driver_on_road_by_status($drivers, $ontrip = 'yes', $onpooling = 'yes', $seats);

				if (is_array($pool_drivers_data) && !empty($pool_drivers_data)) {

					$assigned_driver_id = $pool_drivers_data[0]['data']['dd_driver_id'];

					$driver_details = $this->driver_details($assigned_driver_id);

					$assigned_driver_device_id = $driver_details['u_device_id'];

					$assigned_driver_device_type = $driver_details['device_type'];

					$assigned_tripid = $pool_drivers_data[0]['data']['trips']['ct_id'];

					$is_pooling_available = 'yes';

					$is_booking_available = 'yes';

				} else {

					$fresh_drivers_data = $this->get_driver_on_road_by_status_fresh($drivers, $ontrip = 'no', $onpooling = 'no', $seats);

					if (is_array($fresh_drivers_data) && !empty($fresh_drivers_data)) {

						$is_pooling_available = 'no';

						$is_booking_available = 'yes';

						$assigned_driver_id = $fresh_drivers_data[0]['data']['dd_driver_id'];

						$driver_details = $this->driver_details($assigned_driver_id);

						$assigned_driver_device_id = $driver_details['u_device_id'];

						$assigned_driver_device_type = $driver_details['device_type'];

					} else {

						$is_pooling_available = 'no';

						$is_booking_available = 'no';

					}

				}

				if ($is_pooling_available == 'yes' && $is_booking_available == 'yes') {

					//add to ride ith old trip id

					$ride_data = array(

						"trip_id" => $assigned_tripid,

						"uid" => $uid,

						"from_lat" => $from_lat,

						"from_long" => $from_long,

						"to_lat" => $to_lat,

						"to_long" => $to_long,

						"seats" => $seats,

						"amount" => $amount,

						"polyline" => $polyline,

						"from" => $from,

						"to" => $to,

					);

					$assigned_ride_id = $this->add_new_ride($ride_data);

					$booking_response = array(

						"status" => true,

						"data" => array(

							"driver_details" => $driver_details,

							"distance_to_drive_details" => $drive_details,

							"trip_id" => $assigned_tripid,

							"ride_id" => $assigned_ride_id,

						),

						"message" => "Ride booked",

						"links" => array(

							"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

						),

					);

				} elseif ($is_pooling_available == 'no' && $is_booking_available == 'yes') {

					//add as new trip

					$trip_data = array(

						"driver_id" => $assigned_driver_id,

						"date" => $date,

						"from" => $from,

						"to" => $to,

						"pooling" => $pooling,

						"amount" => $amount,

					);

					$assigned_tripid = $this->add_new_trip($trip_data);

					$ride_data = array(

						"trip_id" => $assigned_tripid,

						"uid" => $uid,

						"from_lat" => $from_lat,

						"from_long" => $from_long,

						"to_lat" => $to_lat,

						"to_long" => $to_long,

						"seats" => $seats,

						"amount" => $amount,

						"polyline" => $polyline,

						"from" => $from,

						"to" => $to,

					);

					$assigned_ride_id = $this->add_new_ride($ride_data);

					$booking_response = array(

						"status" => true,

						"data" => array(

							"driver_details" => $driver_details,

							"distance_to_drive_details" => $drive_details,

							"trip_id" => $assigned_tripid,

							"ride_id" => $assigned_ride_id,

						),

						"message" => "Ride booked",

						"links" => array(

							"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

						),

					);

				} elseif ($is_pooling_available == 'no' && $is_booking_available == 'no') {

					$booking_response = array(

						"status" => false,

						"message" => "No drivers found near you, please try again",

						"links" => array(

							"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

						),

					);

				} else {

					//critical errors

					$booking_response = array(

						"status" => false,

						"message" => "No seats available in pooling, please use un-pooled cars",

						"links" => array(

							"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

						),

					);

				}

			} else {

				//no pooling

				$fresh_drivers_data = $this->get_driver_on_road_by_status_fresh($drivers, $ontrip = 'no', $pooling = 'no', $seats);

				if (is_array($fresh_drivers_data) && !empty($fresh_drivers_data)) {

					$assigned_driver_id = $fresh_drivers_data[0]['data']['dd_driver_id'];

					// $assigned_driver_device_type = $driver_details['device_type'];

					$driver_details = $this->driver_details($assigned_driver_id);

					$assigned_driver_device_id = $driver_details['u_device_id'];

					$assigned_driver_device_type = $driver_details['device_type'];

					$trip_data = array(

						"driver_id" => $assigned_driver_id,

						"date" => $date,

						"from" => $from,

						"to" => $to,

						"pooling" => $pooling,

						"amount" => $amount,

					);

					$assigned_tripid = $this->add_new_trip($trip_data);

					$ride_data = array(

						"trip_id" => $assigned_tripid,

						"uid" => $uid,

						"from_lat" => $from_lat,

						"from_long" => $from_long,

						"to_lat" => $to_lat,

						"to_long" => $to_long,

						"seats" => $seats,

						"amount" => $amount,

						"polyline" => $polyline,

						"from" => $from,

						"to" => $to,

					);

					$assigned_ride_id = $this->add_new_ride($ride_data);

					$booking_response = array(

						"status" => true,

						"data" => array(

							"driver_details" => $driver_details,

							"distance_to_drive_details" => $drive_details,

							"trip_id" => $assigned_tripid,

							"ride_id" => $assigned_ride_id,

						),

						"message" => "Ride booked",

						"links" => array(

							"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

						),

					);

				} else {

					$booking_response = array(

						"status" => false,

						"message" => "No seats available, you can try pooled cars ",

						"links" => array(

							"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

						),

					);

				}

			}

			if (isset($assigned_driver_device_id)) {

				// $assigned_driver_device_type = $driver_details['device_type'];

				$message = array(

					"ride_id" => $assigned_ride_id,

					"trip_id" => $assigned_tripid,

					"title" => "New booking",

					"message" => "A new ride has been booked",

					'alert' => "A new ride has been booked",

					'sound' => 'default',

				);

				if ($assigned_driver_device_type == 'android') {

					AndroidPush($assigned_driver_device_id, $message);

				} elseif ($assigned_driver_device_type == 'iOS') {

					iOSPush($assigned_driver_device_id, $message);

				}

			}

			//         $dd=$this->get_driver_on_road_by_status($drivers,$ontrip='no',$pooling='no',$seats);

			//  print_r($dd);

			// //  $ddc = $dd[0]['data']['trips']['ct_id'];

			//       print_r($ddc);

		} else {

			$booking_response = array(

				"status" => false,

				"message" => "No drivers near your location, please try again ",

				"links" => array(

					"self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath(),

				),

			);

		}

		$booking_response['push_tests'] = array(
			"assigned_driver_device_type" => $assigned_driver_device_type,
			"assigned_driver_device_id" => $assigned_driver_device_id,
		);

		return $this->response->withJson($booking_response);

	}

	public function add_new_trip($data) {

		$assigned_tripid = $this->db->table('cab_trip')->insertGetId([

			"ct_driver_id" => $data['driver_id'],

			"ct_date" => $data['date'],

			"ct_trip_start" => time_now(),

// "ct_trip_end" => $s,

			"ct_trip_start_from" => utf8_decode(urldecode($data['from'])),

			"ct_trip_start_to" => utf8_decode(urldecode($data['to'])),

			"ct_trip_status" => 'booked',

			"ct_remarks" => '',

			"ct_is_pooling" => $data['pooling'],

			"ct_payment_status" => 'pending',

			"ct_amount" => $data['amount'],

		]);

		return $assigned_tripid;

	}

	public function add_new_ride($data) {

		$assigned_ride_id = $this->db->table('cab_rides')->insertGetId([

			"cr_trip_id" => $data['trip_id'],

			"cr_user_id" => $data['uid'],

			"cr_booked_on" => time_now(),

			"cr_ride_start_time" => time_now(),

// "cr_ride_end_time" => '',

			"cr_start_lat" => $data['from_lat'],

			"cr_start_long" => $data['from_long'],

			"cr_stop_lat" => $data['to_lat'],

			"cr_stop_long" => $data['to_long'],

			"cr_no_passengers" => $data['seats'],

			"cr_amount" => $data['amount'],

			"cr_payment_status" => 'unpaid',

			"cr_cab_ride_status" => 'booked',

			"cr_polyline" => $data['polyline'],

			"cr_all_locations" => "",

			"cr_start_name" => utf8_decode(urldecode($data['from'])),

			"cr_stop_name" => utf8_decode(urldecode($data['to'])),

		]);

		return $assigned_ride_id;

	}

	public function get_driver_on_road_by_status($data, $ontrip = 'yes', $pooling = 'yes', $seats_required) {

		//  print_r($data);

		$poolingdrivers_availabe = array();

		foreach ($data as $driver_data) {

			$remaining_seats = $driver_data['dd_car_capacity'] - $driver_data['used_seats'];

			if ($driver_data['ontrip_pooling'] == $pooling && $driver_data['ontrip'] == $ontrip) {

				if ($remaining_seats >= $seats_required) {

					$poolingdrivers_availabe[] = array(

						"rides_found" => 'yes',

						"pooling_available" => $pooling,

						"seats_available" => 'yes', //.$remaining_seats." ".$seats_required,

						"data" => $driver_data);

				} else {

					//  $poolingdrivers_availabe[]= array(

					//     "rides_found"=>'yes',

					//     "pooling_available"=>$pooling,

					//      "seats_available"=>'no',

					//     "data"=>$driver_data);

					$poolingdrivers_availabe;

				}

			} else {

				$poolingdrivers_availabe;

			}

		}

		return $poolingdrivers_availabe;

	}

	public function get_driver_on_road_by_status_fresh($data, $ontrip = 'yes', $pooling = 'yes', $seats_required) {

		// print_r($data);

		$poolingdrivers_availabe = array();

		foreach ($data as $driver_data) {

			$remaining_seats = $driver_data['dd_car_capacity'] - $driver_data['used_seats'];

			if (empty($driver_data['ontrip_pooling'])) {

				$ontrip_pooling = $pooling;

			} else {

				$ontrip_pooling = $driver_data['ontrip_pooling'];

			}

			if ($ontrip_pooling == $pooling && $driver_data['ontrip'] == $ontrip) {

				if ($remaining_seats >= $seats_required) {

					$poolingdrivers_availabe[] = array(

						"rides_found" => 'yes',

						"pooling_available" => $pooling,

						"seats_available" => 'yes', //.$remaining_seats." ".$seats_required,

						"data" => $driver_data);

				} else {

					//  $poolingdrivers_availabe[]= array(

					//     "rides_found"=>'yes',

					//     "pooling_available"=>$pooling,

					//      "seats_available"=>'no',

					//     "data"=>$driver_data);

					$poolingdrivers_availabe;

				}

			} else {

				$poolingdrivers_availabe;

			}

		}

		return $poolingdrivers_availabe;

	}

	public function b_get_trips_data($id = 0) {

		$tripid = $id;

		$statement = $this->pdo->prepare("SELECT cr_id,cr_user_id,cr_booked_on,cr_cab_ride_status,cr_no_passengers,cr_polyline, ( SELECT SUM(`cr_no_passengers`) as total FROM `cab_rides` WHERE `cr_trip_id` = $tripid and  cr_cab_ride_status NOT IN ('completed','cancelled' 'any other array valuess'  )  GROUP BY `cr_trip_id`) as total_used_seats FROM `cab_rides` WHERE `cr_trip_id` = $tripid and cr_cab_ride_status != 'completed' "); //ORDER BY `cab_rides`.`cr_id` DESC limit 1

		$statement->execute();

		return $statement->fetchAll($this->pdo::FETCH_ASSOC);

	}

	public function GetDrivingDistance($lat1, $lat2, $long1, $long2) {

		$url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=" . $lat1 . "," . $long1 . "&destinations=" . $lat2 . "," . $long2 . "&mode=driving&language=pl-PL";

		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL, $url);

		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

		curl_setopt($ch, CURLOPT_PROXYPORT, 3128);

		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);

		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);

		$response = curl_exec($ch);

		curl_close($ch);

		$response_a = json_decode($response, true);

		$dist = $response_a['rows'][0]['elements'][0]['distance']['text'];

		$time = $response_a['rows'][0]['elements'][0]['duration']['text'];

		return array('distance' => $dist, 'time' => $time);

	}

	public function driver_details($userid) {

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

		$total_rides = $this->db->table('cab_trip')
			->where('ct_driver_id', $userid)->count();


		$details = array(

			"driver_id" => $users->u_id,

			// "first_name" => $users->u_first_name,

			// "last_name" => $users->u_last_name,

			// "email" => $users->u_email,

			// "institution_id" => $users->u_edu_institution,

			// "institution_name" => $users->ei_name,

			// "phone" => $users->u_phone,

			// "phone_country" => $users->u_phone_country,

			// "gender" => $users->u_gender,

			// "vehicle_no" => $users->dd_car_number,

			// "verified" => $users->dd_admin_approved,

			// "car_model" => "abc",

			// "car_capacity" => "abc",

			// "license_no" => "abc",

			// "license_expiry" => "abc",

			// "dob" => "abc",

			// "ratings" => round($ratings, 2),

			// "wallet_balance" => $users->w_amount,

			// "image" => $users->u_image,

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

			"car_model" => $users->cm_model_name,

			"car_capacity" => $users->dd_car_capacity,

			"license_no" => $users->dd_license,

			"license_expiry" => $users->dd_expiery_date,

			"dob" => $users->dd_birth_day,

			'device_type' => $users->u_device_type,

			"ratings" => round($ratings, 2),

			"wallet_balance" => $users->w_amount,
			"total_rides" => $total_rides,

			"image" =>$users->u_image,

		);

		$array = array_map(function ($val) {return is_null($val) ? "" : $val;}, $details);

		return $array;

	}

	public function get_map_data($start, $end) {

		$googleApiKey = $this->env['google_map_api'];

		$url = 'https://maps.googleapis.com/maps/api/directions/json?origin=' . urlencode($start) . '&destination=' . urlencode($end) . '&travelMode=driving&key=' . $googleApiKey . "&libraries=geometry,places&sensor=false&waypoints";

		$curl = curl_init();

		curl_setopt_array($curl, [

			CURLOPT_URL => $url,

			CURLOPT_RETURNTRANSFER => true,

			CURLOPT_ENCODING => "",

			CURLOPT_MAXREDIRS => 10,

			CURLOPT_TIMEOUT => 30,

			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,

			CURLOPT_CUSTOMREQUEST => "GET",

			// CURLOPT_HTTPHEADER => [

			//     "cache-control: no-cache",

			// ],

		]);

		$response = curl_exec($curl);

// echo $response;

		// die();

		$array = json_decode($response, true);

		// $Geocoder = new \GoogleMapsGeocoder($start);

		// $response = $Geocoder->geocode();

		// $start_location_cordinates = $response['results'][0]["geometry"]['location'];

		$legs = $array['routes'][0]['legs'];

		$bounds = $array['routes'][0]['bounds'];

		$starts = $bounds['northeast'];

		$ends = $bounds['southwest'];

		$steps = $legs[0]['steps'];

		$distance = $legs[0]['distance']['text'];

		$distance_value = $legs[0]['distance']['value'];

		$duration = $legs[0]['duration']['text'];

		$duration_value = $legs[0]['duration']['value'];

		$total_distance = $distance_value / 1000;

		$poly = array();

		foreach ($steps as $locations) {

			$points = \Polyline::decode($locations['polyline']['points']);

			$poly[] = \Polyline::pair($points);

		}

		$new = array_reduce($poly, 'array_merge', array());

		$encoded = \Polyline::encode($new); // complete polyline

		// $ckm = $this->cwGetDistanceOpt($starts['lat'], $starts['lng'],$ends['lat'], $ends['lng']);

		$myarray = array();

		$myarray = array_map(function ($new) {

			return array(

				'lat' => $new['0'],

				'lng' => $new['1'],

			);}, $new);

		$data = array(

			//  "start_cordinate" => $start_location_cordinates,

			"start" => $starts,

			'ends' => $ends,

			"distance" => $distance,

			"calculated_distance" => $total_distance,

			"distance_value" => $distance_value,

			"duration" => $duration,

			"duration_value" => $duration_value,

			// "km"=>$ckm,

			"polyline" => $encoded,

			"fullCordinates" => $new,

			"fullCordinates_latlng" => $myarray,

		);

		return $data;

	}

	public function get_edu($request, $response, $args) {

		$userid = $args['id'];

		$userdetails = Helper::get_user($userid);

		$userdinst = $userdetails['u_edu_institution'];

		$eduInst = $this->db->table('edu_institution')

			->select("ei_name as name", "ei_id as id ")->get();

		$result = array(

			"status" => true,

			"data" => array("details" => $eduInst, "user_institute" => $userdinst),

			"message" => "Amount calculated",

			"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

		);

		return $this->response->withJson($result);

	}

	public function search($request, $response, $args) {

		// $origin = $this->input['origin'];

		// $destination = $this->input['destination'];

		// $seats=$this->input['seats'];

		$origin = $args['from'];

		$destination = $args['to'];

		$seats = $args['seats'];

		$googleApiKey = $this->env['google_map_api'];

		$url = 'https://maps.googleapis.com/maps/api/directions/json?origin=' . urlencode($origin) . '&destination=' . urlencode($destination) . '&travelMode=driving&key=' . $googleApiKey . "&libraries=geometry,places&sensor=false&waypoints";

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

		$array = json_decode($response, true);

		$legs = $array['routes'][0]['legs'];

		$steps = $legs[0]['steps'];

		$poly = array();

		foreach ($steps as $locations) {

			$points = \Polyline::decode($locations['polyline']['points']);

			$poly[] = \Polyline::pair($points);

		}

		$new = array_reduce($poly, 'array_merge', array());

//print_r($new);

		$encoded = \Polyline::encode($new); // complete polyline

	}

	public function cwGetDistanceOpt($latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo) {

		$rad = M_PI / 180;

		//Calculate distance from latitude and longitude

		$theta = $longitudeFrom - $longitudeTo;

		$dist = sin($latitudeFrom * $rad) * sin($latitudeTo * $rad) + cos($latitudeFrom * $rad) * cos($latitudeTo * $rad) * cos($theta * $rad);

		$Result = acos($dist) / $rad * 60 * 1.853;

		return round($Result, 2);

	}

	public function distanceCalculation($point1_lat, $point1_long, $point2_lat, $point2_long, $unit = 'km', $decimals = 2) {

		// Calculate the distance in degrees

		$degrees = rad2deg(acos((sin(deg2rad($point1_lat)) * sin(deg2rad($point2_lat))) + (cos(deg2rad($point1_lat)) * cos(deg2rad($point2_lat)) * cos(deg2rad($point1_long - $point2_long)))));

		// Convert the distance in degrees to the chosen unit (kilometres, miles or nautical miles)

		switch ($unit) {

		case 'km':

			$distance = $degrees * 111.13384; // 1 degree = 111.13384 km, based on the average diameter of the Earth (12,735 km)

			break;

		case 'mi':

			$distance = $degrees * 69.05482; // 1 degree = 69.05482 miles, based on the average diameter of the Earth (7,913.1 miles)

			break;

		case 'nmi':

			$distance = $degrees * 59.97662; // 1 degree = 59.97662 nautic miles, based on the average diameter of the Earth (6,876.3 nautical miles)

		}

		return round($distance, $decimals);

	}

}
