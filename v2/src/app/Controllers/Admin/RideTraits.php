<?php
namespace src\app\Controllers\Admin;
use src\app\Models\Rides;
use src\app\Models\Trips;
use src\app\Models\User;

trait RideTraits {

	public function getRidesForSchool($req, $res, $args) {
		if (!$this->validateToken($req, $res) && !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}
		$schoolid = (int) $args['id'];

		$page = (\is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;

		$rides = $this->db->table('cab_rides')
			->join('cab_trip', 'cab_rides.cr_trip_id', 'cab_trip.ct_id')
			->join('users', 'cab_trip.ct_driver_id', 'users.u_id')
			->where('users.u_edu_institution', $schoolid);

		$total = $rides->count();
		$rides->skip($skip)->take($limit);
		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;

		$rds = $rides->get();

		$ridesResult = [];
		foreach ($rds as $rd) {
			$ride = [
				'id' => $rd->cr_id,
				'amount' => $rd->cr_amount,
				'status' => $rd->cr_cab_ride_status,
				'date' => $rd->ct_date,
				'payment' => $rd->ct_payment_status,
				'username' => $rd->u_first_name . " " . $rd->u_last_name,
			];

			$ridesResult[] = $ride;
		}

		$res->getBody()->write(\json_encode([
			'status' => 200,
			'rides' => $ridesResult,
			'total' => $total,
			'totalPages' => $totalPages,
			'page' => $page,
			'limit' => $limit,
		]));
	}

	public function getRidesForUser($req, $res, $args) {
		if (!$this->validateToken($req, $res) && !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}

		$page = (\is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;

		$userid = (int) $args['id'];
		$rides = Rides::where('cr_user_id', $userid)
			->join('cab_trip', 'cab_rides.cr_trip_id', 'cab_trip.ct_id')
			->join('users', 'cab_rides.cr_user_id', 'users.u_id');

		$total = $rides->count();
		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;
		$rds = $rides->skip($skip)->take($limit)->get();

		$ridesResult = [];
		foreach ($rds as $rd) {
			$ride = [
				'id' => $rd->cr_id,
				'amount' => $rd->cr_amount,
				'status' => $rd->cr_cab_ride_status,
				'date' => $rd->ct_date,
				'payment' => $rd->ct_payment_status,
				'username' => $rd->u_first_name . " " . $rd->u_last_name,
			];

			$ridesResult[] = $ride;
		}

		$res->getBody()->write(\json_encode([
			'status' => 200,
			'rides' => $ridesResult,
			'total' => $total,
			'totalPages' => $totalPages,
			'page' => $page,
			'limit' => $limit,
		]));
	}

	public function getRidesForDriver($req, $res, $args) {
		if (!$this->validateToken($req, $res) && !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}

		$page = (\is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;

		$userid = (int) $args['id'];
		$trips = Trips::where('ct_driver_id', $userid)
			->join('cab_rides', 'cab_rides.cr_trip_id', 'cab_trip.ct_id')
			->join('users', 'cab_trip.ct_driver_id', 'users.u_id');

		$total = $trips->count();
		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;
		$rides = $trips->skip($skip)->take($limit)->get();

		$ridesResult = [];
		foreach ($rides as $rd) {
			$ride = [
				'id' => $rd->cr_id,
				'amount' => $rd->cr_amount,
				'status' => $rd->cr_cab_ride_status,
				'date' => $rd->ct_date,
				'payment' => $rd->ct_payment_status,
				'username' => $rd->u_first_name . " " . $rd->u_last_name,
			];

			$ridesResult[] = $ride;
		}

		$res->getBody()->write(\json_encode([
			'status' => 200,
			'rides' => $ridesResult,
			'total' => $total,
			'totalPages' => $totalPages,
			'page' => $page,
			'limit' => $limit,
		]));
	}

	public function allRides($req, $res, $args) {
		if (!$this->validateToken($req, $res) && !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}

		$page = (\is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;

		$query = Rides::query();
		$query->orderBy('cr_id', 'desc')
			->join('cab_trip', 'cab_rides.cr_trip_id', 'cab_trip.ct_id')
			->join('users', 'cab_rides.cr_user_id', 'users.u_id');

		if (!empty($req->getQueryParam('keyword'))) {
			$keyword = $req->getQueryParam('keyword');
			$query->where(function ($query) use ($keyword) {
				$query->orWhere('u_first_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_email', 'LIKE', "%$keyword%");
			});
		}
		if (!empty($req->getQueryParam('date'))) {
			$query->where('cab_trip.ct_date', "{$req->getQueryParam('date')}");
		}
		//print($query->toSql());

		$total = $query->count();
		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;
		$rds = $query->skip($skip)->take($limit)->get();

		$ridesResult = [];
		foreach ($rds as $rd) {
			$ride = [
				'id' => $rd->cr_id,
				'amount' => $rd->cr_amount,
				'status' => $rd->cr_cab_ride_status,
				'date' => $rd->ct_date,
				'payment' => $rd->ct_payment_status,
				'username' => $rd->u_first_name . " " . $rd->u_last_name,
			];

			$ridesResult[] = $ride;
		}

		$res->getBody()->write(\json_encode([
			'status' => 200,
			'rides' => $ridesResult,
			'total' => $total,
			'totalPages' => $totalPages,
			'page' => $page,
			'limit' => $limit,
		]));
	}

	public function rideDetail($req, $res, $args) {
		if (!$this->validateToken($req, $res) && (!$this->isSuperAdmin() || !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$rideid = $args['id'];

		$ride = Rides::where('cr_id', $rideid)
			->join('cab_trip', 'cab_rides.cr_trip_id', 'cab_trip.ct_id')
			->join('users', 'cab_rides.cr_user_id', 'users.u_id')
		//->join('edu_institution', 'users.u_edu_institution', 'edu_institution.ei_id')
			->leftJoin('driver_details', 'cab_trip.ct_driver_id', 'driver_details.dd_driver_id')
			->first();
		//var_dump($ride);

		if ($this->isAdmin()) {
			// ensure ride is from the school I'm assigned to
			if ($ride->ei_id != $this->user->u_edu_institution) {
				return $res->getBody()->write(\json_encode([
					'status' => 404,
					'message' => 'Ride With Specified Id Not found',
				]));
			}
		}

		if (\is_null($ride)) {
			return $res->getBody()->write(\json_encode([
				'status' => 404,
				'message' => 'Ride Not found',
			]));
		}
		$r = [
			'status' => 200,
			'ride' => [
				'book_date' => $ride->cr_booked_on,
				'start_time' => $ride->cr_ride_start_time,
				'end_time' => $ride->cr_ride_end_time,
				'from' => $ride->cr_start_name,
				'to' => $ride->cr_stop_name,
				'trip_id' => $ride->cr_trip_id,
				//'school' => $ride->ei_name,
				'user' => [
					'name' => $ride->u_first_name . ' ' . $ride->u_last_name,
					'phone' => $ride->u_phone,
					'email' => $ride->u_email,
				],
				'amount' => $ride->cr_amount,
				'payment_status' => $ride->cr_payment_status,
			],
		];

		$driver = User::find($ride->dd_driver_id);
		if ($driver) {
			$r['ride']['driver'] = [
				'name' => $driver->u_first_name . ' ' . $driver->u_last_name,
				'phone' => $driver->u_phone,
				'email' => $driver->u_email,
			];
		}

		return $res->getBody()->write(\json_encode($r));

	}
}
