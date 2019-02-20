<?php
namespace src\app\Controllers\Admin;
use src\app\Models\DriverDetails;
use src\app\Models\School;
use src\app\Models\User;

trait FilterTraits {
	public function filterUsers($req, $res, $args) {
		if (!$this->validateToken($req, $res) && (!$this->isSuperAdmin() || !$this->isAdmin())) {
			return $this->invalidSession($res);
		}
		$query = User::query();
		if ($this->isAdmin()) {
			$keyword = $req->getQueryParam('search');
			if ($keyword) {
				$query->where(function ($query) use ($keyword) {
					$query->orWhere('u_first_name', 'LIKE', "%$keyword%");
					$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
					$query->orWhere('u_email', 'LIKE', "%$keyword%");
				});
			}
			$users = $query->where('u_edu_institution', $this->user->u_edu_institution)->get();

			$result = [];
			foreach ($users as $user) {
				$result[] = [
					'id' => $user->u_id,
					'name' => $user->u_first_name . ' ' . $user->u_last_name,
				];
			}

			return $res->getBody()->write(\json_encode([
				'status' => 200,
				'users' => $result,
			]));
		}

		$search = $req->getQueryParam('search');
		if (\is_null($search) || $search == "") {
			$users = $query->all();
		} else {
			$keyword = $req->getQueryParam('search');
			$query->where(function ($query) use ($keyword) {
				$query->orWhere('u_first_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_email', 'LIKE', "%$keyword%");
			});
			$users = $query->get();
		}

		$result = [];
		foreach ($users as $user) {
			$result[] = [
				'id' => $user->u_id,
				'name' => $user->u_first_name . ' ' . $user->u_last_name,
			];
		}

		return $res->getBody()->write(\json_encode([
			'status' => 200,
			'users' => $result,
		]));
	}

	public function filterSchools($req, $res, $args) {
		if (!$this->validateToken($req, $res) && (!$this->isSuperAdmin() || !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		if ($this->isAdmin()) {
			$school = School::find($this->user->u_edu_institution);
			return $res->getBody()->write(json_encode([
				'status' => 200,
				'schools' => [['id' => $school->ei_id, 'name' => $school->ei_name]],
			]));
		}

		$search = $req->getQueryParam('search');
		if (\is_null($search) || $search == "") {
			$schools = School::all();
		} else {
			$schools = School::where('ei_name', 'like', $search)->get();
		}
		$result = [];
		foreach ($schools as $school) {
			$result[] = [
				'id' => $school->ei_id,
				'name' => $school->ei_name,
			];
		}

		return $res->getBody()->write(\json_encode([
			'status' => 200,
			'schools' => $result,
		]));
	}

	public function filterDrivers($req, $res, $args) {
		if (!$this->validateToken($req, $res) && !$this->isSuperAdmin()) {
			return $this->invalidSession($res);
		}

		$search = $req->getQueryParam('search');
		if (\is_null($search) || $search == "") {
			$query = DriverDetails::query();
			$query->join('users', 'driver_details.dd_driver_id', 'users.u_id');
		} else {
			$query = DriverDetails::query();
			$query->join('users', 'driver_details.dd_driver_id', 'users.u_id');

			$query->where('users.u_first_name', 'like', $req->getQueryParam('search'))
				->orWhere('users.u_last_name', 'like', $req->getQueryParam('search'));
		}

		$drivers = $query->get();

		$result = [];
		foreach ($drivers as $driver) {
			$result[] = [
				'id' => $driver->u_id,
				'name' => $driver->u_first_name . ' ' . $driver->u_last_name,
			];
		}

		return $res->getBody()->write(\json_encode([
			'status' => 200,
			'drivers' => $result,
		]));
	}
}

?>