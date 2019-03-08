<?php
namespace src\app\Controllers\Admin;
use src\app\Models\BankDetails;
use src\app\Models\DriverDetails;
use src\app\Models\Rides;
use src\app\Models\School;
use src\app\Models\User;
use src\app\Models\Wallet;
trait AdminTraits {
	public function createUser($req, $res) {

		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$v = $this->validateRequired(['firstname', 'lastname', 'email', 'role', 'password'], $this->input);
		if ($v != true) {
			$str = \json_encode([
				'status' => 403, 'message' => $v,
			]);

			return $res->getBody()->write($str);
		}

		switch ($this->input['role']) {
		case 'SUPERADMIN':
			$this->input['role'] = self::SUPERADMIN;
			break;
		case 'ADMIN':
			$this->input['role'] = self::ADMIN;
			break;
		case 'SCHOOL':
			$this->input['role'] = self::SCHOOL;
			break;
		case 'DRIVER':
			$this->input['role'] = self::DRIVER;
			break;
		case 'USER':
			$this->input['role'] = self::USER;
			break;
		case 'TESTER':
			$this->input['role'] = self::TESTER;
			break;
		}

		if ($this->input['role'] == self::ADMIN || $this->input['role'] == self::USER || $this->input['role'] == self::DRIVER || $this->input['role'] == self::TESTER) {
			if (empty($this->input['school'])) {return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'You need to provide a school for this role type']));}
		}

		// verify role I'm assigning to user, it can't be equal to mine except for super admin
		if ((int) $this->input['role'] >= $this->user->u_role && $this->user->u_role != self::SUPERADMIN) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'Error. You cannot create a user with this role']));
		}
		if (User::where('u_email', $this->input['email'])->count() > 0) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'Email already exists!']));
		};

		try {
			$this->beginTransaction();
			$user = new User();
			$user->u_first_name = $this->input['firstname'];
			$user->u_last_name = $this->input['lastname'];
			$user->u_email = $this->input['email'];
			$user->u_phone_country = $this->input['phone_country'];
			$user->u_phone = $this->input['phone_number'];
			$user->u_gender = $this->input['gender'];
			//Temporarily using this defualt user image for now.
			$user->u_image_200=$user->u_image_100=$user->u_image="https://res.cloudinary.com/moov-api/image/upload/v1552051608/public/uploads/userpic/User.png";
			$user->u_role = (int) $this->input['role'];
			$user->u_password = $this->input['password'];
			if ($this->input['role'] === self::DRIVER) {
				$user->u_type = 4;
			}
			if (!empty($this->input['school'])) {
				$user->u_edu_institution = $this->input['school'];
			}

			$user->save();

			$wallet = new Wallet();
			$wallet->w_user_id = $user->u_id;
			$wallet->w_amount = 0;
			$wallet->save();

			if ($this->input['role'] === self::DRIVER) {
				// also add driver to driver details
				$dd = new DriverDetails();
				$dd->dd_driver_id = $user->u_id;
				$dd->car_colour = $this->input['car_colour'];
				$dd->dd_birth_day = $this->input['dob'];

				$dd->dd_expiery_date = $this->input['expiry_date'];
				$dd->dd_license = $this->input['licence_number'];
				$dd->dd_car_number = $this->input['plate_number'];
				$dd->dd_car_model_id = $this->input['car_model'];
				$dd->dd_car_capacity = $this->input['car_capacity'];
				$dd->dd_admin_approved = 0;
				$dd->dd_car_active = 1;
				$dd->save();

				$bd = new BankDetails;
				$bd->bd_user_id = $user->u_id;
				$bd->bd_bank_code = $this->input['bank_code'];
				$bd->bd_bank_name = $this->input['bank_name'];
				$bd->bd_account_number = $this->input['account_number'];
				$bd->bd_account_name = $this->input['account_name'];
				$bd->save();

			}
			$this->commitTransaction();
			$res->getBody()->write(json_encode([
				'status' => 200, 'message' => 'User Has been created',
			]));
		} catch (\Exception $e) {
			$res->getBody()->write(json_encode([
				'status' => 400, 'message' => "There was a problem adding user. Please ensure email doesn't already exist.",
				'debug' => $e->getMessage(),
			]));
		}

	}

	public function allUsers($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin() && !$this->isSchool())) {
			return $this->invalidSession($res);
		}

		$page = (\is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;

		$query = User::query();
		if (!empty($req->getQueryParam('filter_role'))) {
			$roles = [
				'user' => self::USER,
				'driver' => self::DRIVER,
				'admin' => self::ADMIN,
			];
			$roleName = $req->getQueryParam('filter_role');
			$selectedRole = @$roles[$roleName];
			$query->where('u_role', $selectedRole);
		}

		if (!empty($req->getQueryParam('active'))) {
			$query->where('u_status', 'ACTIVE');
		}

		if (!empty($req->getQueryParam('suspended'))) {
			$query->where('u_status', 'SUSPENDED');
		}

		if (!empty($req->getQueryParam('deactivated'))) {
			$query->where('u_status', 'DEACTIVATED');
		}

		if (!empty($req->getQueryParam('keyword'))) {
			$keyword = $req->getQueryParam('keyword');
			$query->where(function ($query) use ($keyword) {
				$query->orWhere('u_first_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_email', 'LIKE', "%$keyword%");
			});

		}

		// if admin or school, limit users to the users in admins school
		if ($this->isAdmin() || $this->isSchool()) {
			$query->where('u_edu_institution', $this->user->u_edu_institution);
		}

		$users = $query->orderBy('u_id', 'desc')->skip($skip)->take($limit)->get();
		$total = $query->count();

		$userResult = array();
		foreach ($users as $user) {
			$us = array(
				'id' => $user->u_id,
				'firstname' => $user->u_first_name,
				'lastname' => $user->u_last_name,
				'email' => $user->u_email,
			);
			$userResult[] = $us;
		}

		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;

		$res->getBody()->write(json_encode([
			'status' => 200,
			'users' => $userResult,
			'page' => $page,
			'limit' => $limit,
			'total' => $total,
			'totalPages' => $totalPages,
			'query' => $query->toSql(),
		]));

	}

	public function usersPerSchool($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$schoolid = (int) $args['id'];

		// if admin, override schoolid with schoolid of admin
		if ($this->isAdmin()) {$schoolid = $this->user->u_edu_institution;}

		$page = (\is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;
		$query = User::where('u_edu_institution', $schoolid);
		if (!empty($req->getQueryParam('keyword'))) {
			$keyword = $req->getQueryParam('keyword');
			$query->where(function ($query) use ($keyword) {
				$query->orWhere('u_first_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_email', 'LIKE', "%$keyword%");
			});
		}
		$total = $query->count();
		$users = $query->orderBy('u_id', 'desc')->skip($skip)->take($limit)->get();
		$query = User::where('u_edu_institution', $schoolid);
		$userResult = array();
		foreach ($users as $user) {
			$us = array(
				'id' => $user->u_id,
				'firstname' => $user->u_first_name,
				'lastname' => $user->u_last_name,
				'email' => $user->u_email,
			);
			$userResult[] = $us;
		}

		// calculate total pages based on pagination params
		//echo $total; echo "-"; echo $limit; die();
		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;

		$res->getBody()->write(json_encode([
			'status' => 200,
			'users' => $userResult,
			'page' => $page,
			'limit' => $limit,
			'total' => $total,
			'totalPages' => $totalPages,
		]));
	}

	public function driversPerSchool($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin() && !$this->isDriver())) {
			return $this->invalidSession($res);
		}
		$schoolid = (int) $args['id'];
		// if admin, override schoolid with schoolid of admin
		if ($this->isAdmin() || $this->isSchool()) {$schoolid = $this->user->u_edu_institution;}

		$page = (\is_null(@$args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null(@$args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;
		//User::where('u_edu_institution', $schoolid)->
		$query = $this->db->table('users');
		if (!\is_null($req->getQueryParam('search'))) {

			$keyword = $req->getQueryParam('search');
			$query->where(function ($query) use ($keyword) {
				$query->orWhere('u_first_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_email', 'LIKE', "%$keyword%");
			});
		}
		$drivers_cursor = $query->join('driver_details', 'users.u_id', '=', 'driver_details.dd_driver_id')
			->where('u_edu_institution', $schoolid)
			->skip($skip)->take($limit);

		$total = $drivers_cursor->count();
		$drivers = $drivers_cursor->get();

		$userResult = array();
		foreach ($drivers as $user) {
			$us = array(
				'id' => $user->u_id,
				'firstname' => $user->u_first_name,
				'lastname' => $user->u_last_name,
				'email' => $user->u_email,
				'approved' => $user->dd_admin_approved == 0 ? 'NO' : 'YES',
			);
			$userResult[] = $us;
		}

		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;

		$res->getBody()->write(json_encode([
			'status' => 200,
			'drivers' => $userResult,
			'page' => $page,
			'limit' => $limit,
			'total' => $total,
			'totalPages' => $totalPages,
		]));
	}

	//

	public function userDetails($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$userid = $args['id'];
		$query = User::query();
		$query->join('wallet', 'users.u_id', 'wallet.w_user_id')
			->join('edu_institution', 'users.u_edu_institution', 'edu_institution.ei_id')
			->where('u_id', $userid);

		$user = $query->first();

		if (\is_null($user)) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'User not found or no wallet exists for user.']));
		}

		// if admin, verify user is in the same school with admin
		if ($this->isAdmin()) {
			if ($user->u_edu_institution != $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'User not found.']));
			}
		}

		$res->getBody()->write(json_encode([
			'status' => 200,
			'user' => [
				'name' => $user->u_first_name . " " . $user->u_last_name,
				'email' => $user->u_email,
				'wallet_balance' => $user->w_amount,
				'school' => $user->ei_name,
				'type' => 'USER',
			],
		]));

	}

	public function driverDetails($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$driverid = $args['id'];
		$query = DriverDetails::query();
		$query->join('wallet', 'driver_details.dd_driver_id', 'wallet.w_user_id')
			->join('users', 'driver_details.dd_driver_id', 'users.u_id')
			->join('edu_institution', 'users.u_edu_institution', 'edu_institution.ei_id')
			->where('dd_driver_id', $driverid);

		$user = $query->first();
		if (\is_null($user)) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'Driver not found or no wallet exists for Driver.']));
		}

		// if admin, verify driver is in the same school with admin
		if ($this->isAdmin()) {
			if ($user->u_edu_institution != $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'Driver not found.']));
			}
		}

		$res->getBody()->write(json_encode([
			'status' => 200,
			'driver' => [
				'name' => $user->u_first_name . " " . $user->u_last_name,
				'email' => $user->u_email,
				'wallet_balance' => $user->w_amount,
				'school' => $user->ei_name,
				'type' => 'DRIVER',
			],
		]));
	}

	public function schoolDetails($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$schoolid = $args['id'];
		// if admin, override school id with id of admin's school
		if ($this->isAdmin()) {
			$schoolid = $this->user->u_edu_institution;
		}

		$query = School::query();
		$query->join('edu_wallet', 'edu_institution.ei_id', 'edu_wallet.w_edu_id')
			->where('ei_id', $schoolid);

		$school = $query->first();

		if (\is_null($school)) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'School not found or no wallet exists for School.']));
		}

		$res->getBody()->write(json_encode([
			'status' => 200,
			'school' => [
				'name' => $school->ei_name,
				'email' => $school->ei_email,
				'address' => $school->ei_address,
				'location' => $school->ei_location,
				'phone' => $school->ei_phone,
				'wallet_balance' => $this->isSuperAdmin() ? $school->w_amount : 'NA',
				'type' => 'SCHOOL',
			],
		]));
	}

	public function resetSchoolPassword($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$schoolid = $args['id'];
		// if admin, override school id with id of admin's school
		if ($this->isAdmin()) {
			$schoolid = $this->user->u_edu_institution;
		}

		$school = School::find($schoolid);
		if (\is_null($school)) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'School not found.']));
		}

		$chars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'x', 'y', 'z'];
		$p = "";
		for ($x = 0; $x <= 7; $x++) {
			$p .= $chars[mt_rand(0, count($chars) - 1)];
		}
		$school->ei_password = $p;
		$school->save();

		$res->getBody()->write(json_encode(['status' => 200, 'message' => 'School Password has been reset.', 'password' => $p]));

	}

	public function browseSchoolAdmins($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$schoolid = $args['id'];
		// if admin, restrict to admins school
		if ($this->isAdmin()) {
			$schoolid = $this->user->u_edu_institution;
		}
		$users = User::where('u_edu_institution', $schoolid)
			->where('u_role', self::ADMIN)->get();

		$userResult = array();
		foreach ($users as $user) {
			$us = array(
				'id' => $user->u_id,
				'firstname' => $user->u_first_name,
				'lastname' => $user->u_last_name,
				'email' => $user->u_email,
			);
			$userResult[] = $us;
		}

		$res->getBody()->write(json_encode(['status' => 200, 'admins' => $userResult]));
	}

	public function adminstats($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}
		$schools = School::query()->count();
		$uq = User::query();
		$dq = DriverDetails::query();
		$rq = Rides::query();

		if ($this->isAdmin()) {
			$uq->where('u_edu_institution', $this->user->u_edu_institution);

			$dq->join('users', 'driver_details.dd_driver_id', 'users.u_id')
				->where('u_edu_institution', $this->user->u_edu_institution);

			$rq->join('users', 'cab_rides.cr_user_id', 'users.u_id')
				->where('u_edu_institution', $this->user->u_edu_institution);
		}

		$users = $uq->count();
		$drivers = $dq->count();
		$rides = $rq->count();

		$res->getBody()->write(json_encode(['status' => 200, 'users' => $users, 'schools' => $schools, 'drivers' => $drivers, 'rides' => $rides]));
	}

	public function inituser($req, $res, $args) {

		/*var_dump($this->isSuperAdmin());
		var_dump($this->isAdmin());*/
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin() && !$this->isSchool())) {
			return $this->invalidSession($res);
		}
		$res->getBody()->write(json_encode(['status' => 200, 'role' => $this->user->u_role, 'institution_id' => $this->user->u_edu_institution]));

		/*if ($this->isSuperAdmin() && $this->isAdmin()) {

			} else {
				$res->getBody()->write(json_encode(['status' => 400]));
		*/
	}
}
?>