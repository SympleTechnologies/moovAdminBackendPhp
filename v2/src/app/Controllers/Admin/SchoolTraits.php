<?php
namespace src\app\Controllers\Admin;
use src\app\Models\BankDetails;
use src\app\Models\School;
use src\app\Models\SchoolWallet;
use src\app\Models\User;

trait SchoolTraits {
	public function allSchools($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		if (!\is_null($args)) {
			$page = (!isset($args['page']) || is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
			$limit = (!isset($args['limit']) || is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		} else {
			$page = 1;
			$limit = 20;
		}
		$skip = ($page - 1) * $limit;

		// if admin user, return only admin's school
		if ($this->isAdmin()) {
			$school = School::find($this->user->u_edu_institution);
			return $res->getBody()->write(json_encode([
				'status' => 200,
				'schools' => [['id' => $school->ei_id, 'name' => $school->ei_name, 'address' => $school->ei_address]],
			]));
		}

		$query = School::query();
		if (!\is_null($req->getQueryParam('search'))) {
			$query->where('ei_name', 'like', $req->getQueryParam('search'));
		}

		if (!\is_null($req->getQueryParam('all'))) {
			$schools = $query->orderBy('ei_id', 'desc')->get();

			$schoolResult = [];
			foreach ($schools as $school) {
				$s = [
					'id' => $school->ei_id,
					'name' => $school->ei_name,
					'address' => $school->ei_address,
				];
				$schoolResult[] = $s;
			}

			return $res->getBody()->write(json_encode([
				'status' => 200,
				'schools' => $schoolResult,
			]));

		} else {
			$total = $query->count();
			$schools = $query->skip($skip)->take($limit)->orderBy('ei_id', 'desc')->get();
			$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;

			$schoolResult = [];
			foreach ($schools as $school) {
				$s = [
					'id' => $school->ei_id,
					'name' => $school->ei_name,
					'address' => $school->ei_address,
				];
				$schoolResult[] = $s;
			}

			return $res->getBody()->write(json_encode([
				'status' => 200,
				'schools' => $schoolResult,
				'page' => $page,
				'limit' => $limit,
				'total' => $total,
				'totalPages' => $totalPages,
			]));
		}
	}

	public function getSchool($req, $res, $args = null) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$id = $args['id'];
		// if school admin, restrict to admin's school
		if ($this->isAdmin()) {
			$id = $this->user->u_edu_institution;
		}
		$school = School::find($id);

		if (\is_null($school)) {
			return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'School not found']));
		}

		$res->getBody()->write(json_encode([
			'status' => 200,
			'school' => [
				'name' => $school->ei_name,
				'address' => $school->ei_address,
				'location' => $school->ei_location,
				'phone' => $school->ei_phone,
				'email' => $school->ei_email,
			],
		]));
	}

	public function addSchool($req, $res, $args = null) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$v = $this->validateRequired(['name', 'address', 'location', 'phone', 'email', 'password'], $this->input);
		if ($v !== true) {
			return $res->getBody()->write(json_encode(['status' => 403, 'message' => $v]));
		}

		/*$school = new School();
			$school->ei_name = $this->input['name'];
			$school->ei_address = $this->input['address'];
			$school->ei_location = $this->input['location'];
			$school->ei_phone = $this->input['phone'];
			$school->ei_email = $this->input['email'];
			$school->ei_password = $this->input['password'];
			$school->save();
		*/

		try {

			$eid = $this->db->table('edu_institution')->insertGetId([
				'ei_name' => $this->input['name'],
				'ei_address' => $this->input['address'],
				'ei_location' => $this->input['location'],
				'ei_phone' => $this->input['phone'],
				'ei_email' => $this->input['email'],
				'ei_password' => $this->input['password'],
				'ei_lat' => '',
				'ei_long' => '',
				'ei_plae_id' => '',
				'ei_phone' => '',
			]);

			$schoolwallet = new SchoolWallet();
			$schoolwallet->w_edu_id = $eid;
			$schoolwallet->w_amount = 0;
			$schoolwallet->save();

			$res->getBody()->write(json_encode(['status' => 200, 'message' => 'School Added']));
		} catch (\Exception $e) {
			$res->getBody()->write(json_encode(['status' => 400, 'message' => 'There was an error adding the school. Note that school email must be unique', 'e' => $e->getMessage()]));
		}
	}

	public function updateSchool($req, $res, $args = null) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$id = $args['id'];
		// if school admin, restrict to admin's school
		if ($this->isAdmin()) {
			$id = $this->user->u_edu_institution;
		}
		$school = School::find($id);

		if (\is_null($school)) {
			return $req->getBody()->write(json_encode(['status' => 404, 'message' => 'School Not found']));
		}

		if (isset($this->input['name'])) {
			$school->ei_name = $this->input['name'];
		}

		if (isset($this->input['address'])) {
			$school->ei_address = $this->input['address'];
		}

		if (isset($this->input['location'])) {
			$school->ei_location = $this->input['location'];
		}

		if (isset($this->input['phone'])) {
			$school->ei_phone = $this->input['phone'];
		}

		if (isset($this->input['email'])) {
			$school->ei_email = $this->input['email'];
		}

		$school->save();

		$res->getBody()->write(json_encode(['status' => 200, 'message' => 'School Updated']));
	}
	public function saveSchoolPaymentDetails($req, $res, $args = null) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		$id = $args['id'];

		$bank_detail = BankDetails::where('institution_id', $id)->first();
		if (!$bank_detail) {
			$bank_detail = new BankDetails();
		}

		$bank_detail->bd_bank_code = $this->input['bank_code'];
		$bank_detail->bd_bank_name = $this->input['bank_name'];
		$bank_detail->bd_account_number = $this->input['account_number'];
		$bank_detail->bd_account_name = $this->input['account_name'];
		$bank_detail->institution_id = $this->input['institution_id'];
		$bank_detail->save();

		$res->getBody()->write(json_encode(['status' => 200, 'message' => 'School account details updated']));

	}

	public function deleteSchool() {
		throw new \Exception("Action not yet implemented");
	}
}

?>