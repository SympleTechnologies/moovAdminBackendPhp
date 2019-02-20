<?php
namespace src\app\Controllers\Admin;
use src\app\Controllers\Admin\BaseAdmin;
use src\app\Models\PriceShare;
use src\app\Models\School;
use src\app\Models\SchoolWallet;
use src\app\Models\User;

class SchoolController extends BaseAdmin {

	public function __construct() {
		parent::__construct();
	}

	public function login($req, $res) {
		$v = $this->validateRequired(array("username", 'password'), $this->input);
		if ($v !== true) {
			return $res->getBody()->write(json_encode([
				'status' => 403, 'message' => $v,
			]));
		}

		$school = School::where(['ei_email' => $this->input['username'], 'ei_password' => $this->input['password']])->first();

		if (\is_null($school)) {
			return $res->getBody()->write(
				\json_encode(['status' => 401, 'message' => 'Invalid username/password'])
			);
		} else {

			// generate token
			$token = \strtolower(\hash('sha256', uniqid()));
			$school->ei_token = $token;
			$school->save();

			$res->getBody()->write(
				\json_encode(['status' => 200, 'token' => $token])
			);
		}
	}

	public function logout($req, $res) {
		if ($this->validateSchoolToken($req)) {
			$this->school->ei_token = \uniqid();
			$this->school->save();
		} else {

		}

		$res->getBody()->write(
			json_encode(['status' => 200, 'message' => 'session destroyed'])
		);
	}

	private function validateSchoolToken($req) {
		$token = \trim(\str_replace("bearer", "", \strtolower($req->getHeader('Token')[0])));
		$user = School::where('ei_token', $token)->first();
		if (\is_null($user)) {
			return false;
		} else {
			$this->school = $user;
			return true;
		}
	}

	public function stats($req, $res) {
		if (!$this->validateSchoolToken($req)) {
			return $this->invalidSession($res);
		}

		$totalUsers = User::where('u_edu_institution', $this->school->ei_id)->count();
		$drivers_cursor = $this->db->table('users')->join('driver_details', 'users.u_id', '=', 'driver_details.dd_driver_id')
			->where('u_edu_institution', $this->school->ei_id);
		$totalDrivers = $drivers_cursor->count();

		$wallet = SchoolWallet::where('w_edu_id', $this->school->ei_id)->first();
		if (!\is_null($wallet)) {
			$balance = $wallet->w_amount;
		} else {
			$balance = 0;
		}

		$share = PriceShare::where('school_id', $this->school->ei_id)->first();
		if (!\is_null($share)) {
			$moov = $share->moov;
			$driver = $share->driver;
			$school = $share->institution;
		} else {
			$moov = 0;
			$driver = 0;
			$school = 0;
		}

		$res->getBody()->write(json_encode([
			'status' => 200,
			'totalUsers' => $totalUsers,
			'totalDrivers' => $totalDrivers,
			'wallet_balance' => $balance,
			'price_share' => [
				'moov' => $moov,
				'school' => $school,
				'driver' => $driver,
			],
			'name' => $this->school->ei_name,
		]));

	}
}
?>