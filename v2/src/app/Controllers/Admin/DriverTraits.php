<?php
namespace src\app\Controllers\Admin;

use src\app\Models\DriverDetails;
use src\app\Models\User;

trait DriverTraits
{
	public function searchDrivers($req, $res, $args)
	{
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin() && !$this->isSchool())) {
			return $this->invalidSession($res);
		}
		$args['page']=$req->getQueryParam('search');
		$page = $req->getQueryParam('page')>=1?$req->getQueryParam('page'):1;
		$limit = \is_int($req->getQueryParam('limit'))?$req->getQueryParam('limit'):20;
		$skip = ($page - 1) * $limit;

		$query = DriverDetails::query();
		$query->join('users', 'driver_details.dd_driver_id', 'users.u_id');

		if (!\is_null($req->getQueryParam('search'))) {
			$keyword = $req->getQueryParam('search');
			$query->where(function ($query) use ($keyword) {
				$query->orWhere('u_first_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_email', 'LIKE', "%$keyword%");
			});
		}
		if (!\is_null($req->getQueryParam('school')) && $this->isSuperAdmin()) {
			$query->where(function ($q) use ($req) {
				$q->where('users.u_edu_institution', $req->getQueryParam('school'));
			});
		}

		// if an admin or school is logged in here
		if ($this->isAdmin() || $this->isSchool()) {
			$sid = $this->user->u_edu_institution;
			$query->where(function ($q) use ($sid) {
				$q->where('users.u_edu_institution', $sid);
			});
		}

		$total = $query->count();
		$query
			->skip($skip)
			->take($limit)
			->orderBy('dc_id', 'desc');

		$drivers = $query->get();

		$driverResult = [];
		foreach ($drivers as $driver) {
			$d = [
				'id' => $driver['u_id'],
				'firstname' => $driver->u_first_name,
				'lastname' => $driver->u_last_name,
				'email' => $driver->u_email,
				'approved' => $driver->dd_admin_approved == 0 ? 'NO' : 'YES',
			];

			$driverResult[] = $d;
		}
		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;
		$res->getBody()->write(json_encode([
			'status' => 200,
			'drivers' => $driverResult,
			'total' => $total,
			'totalPages' => $totalPages,
			'page' => $page,
			'limit' => $limit,
		]));
	}

	public function getDriver($req, $res, $args = null)
	{
		throw new \Exception("Action not yet implemented");
	}

	public function addDriver($req, $res, $args = null)
	{
		throw new \Exception("Action not yet implemented");
	}

	public function updateDriverDetails($req, $res, $args = null)
	{
		throw new \Exception("Action not yet implemented");
	}

	public function activateDriver($req, $res, $args = null)
	{
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$id = $args['id'];
		$driver = DriverDetails::find($id);
		if (\is_null($driver)) {
			return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'No Driver Entry Found']));
		}

		// If school admin, restrict to admins school
		$driveruser = User::find($id);
		if ($this->isAdmin()) {
			if ($driveruser->u_edu_institution != $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'No Driver Entry Found']));
			}
		}

		$driver->dd_admin_approved = 1;
		$driver->save();

		return $res->getBody()->write(json_encode(['status' => 200, 'message' => 'Driver has been activated for taking rides']));
	}

	public function deactivateDriver($req, $res, $args = null)
	{
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$id = $args['id'];
		$driver = DriverDetails::find($id);
		if (\is_null($driver)) {
			return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'No Driver Entry Found']));
		}

		// If school admin, restrict to admins school
		$driveruser = User::find($id);
		if ($this->isAdmin()) {
			if ($driveruser->u_edu_institution != $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'No Driver Entry Found']));
			}
		}

		$driver->dd_admin_approved = 0;
		$driver->save();

		return $res->getBody()->write(json_encode(['status' => 200, 'message' => 'Driver has been deactivated from taking rides']));
	}

	public function deleteDriver()
	{
		throw new \Exception("Action not yet implemented");
	}
}
 