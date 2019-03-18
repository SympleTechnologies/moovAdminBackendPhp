<?php
namespace src\app\Controllers\Admin;

use src\app\Models\School;
use src\app\Models\User;
use src\config\Api_Controller;

class BaseAdmin extends Api_Controller {
	use Roles;

	const SUPERADMIN = 1;
	const ADMIN = 2;
	const SCHOOL = 3;
	const DRIVER = 4;
	const USER = 5;
	const TESTER = 6;

	public $user;
	public $school;
	public function __construct() {
		parent::__construct();
		$this->user = null;
	}

	public function login($req, $res) {
		$v = $this->validateRequired(array("username", 'password'), $this->input);
		if ($v !== true) {
			return $res->getBody()->write(json_encode([
				'status' => 403, 'message' => $v,
			]));
		}

		$user = User::where(['u_email' => $this->input['username'], 'u_password' => $this->input['password']])->first(); // \hash('sha256', $this->input['password'])
		if (\is_null($user)) {
			return $res->getBody()->write(
				\json_encode(['status' => 401, 'message' => 'Invalid username/password'])
			);
		} else {
//var_dump((array)$user);
			if ($user->u_role != self::SUPERADMIN && $user->u_role != self::ADMIN) {
				return $res->getBody()->write(
					\json_encode(['status' => 401, 'message' => 'You need to be an admin/superadmin to login'])
				);
			}
			// generate token
			$token = \strtolower(\hash('sha256', uniqid()));
			$user->u_token = $token;
			$user->save();

			$res->getBody()->write(
				\json_encode(['status' => 200, 'token' => $token])
			);
		}

	}
	public function validateToken($req, $res) {
		$token = @\trim(\str_replace("bearer", "", \strtolower($req->getHeader('Token')[0])));

		$user = User::where('u_token', $token)->first();
		if (\is_null($user)) {
			$school = School::where('ei_token', $token)->first();
			if ($school) {
				$this->school = $school;
				$this->user = new User();
				$this->user->u_first_name = $school->ei_name;
				$this->user->u_email = $school->ei_email;
				$this->user->u_role = self::SCHOOL;
				$this->user->u_edu_institution = $school->ei_id;
				return true;
			}
			return false;
		} else {

			$this->user = $user;
			return true;
		}
	}

	public function logout($req, $res) {
		if ($this->validateToken($req, $res)) {
			$this->user->u_token = \uniqid();
			$this->user->save();
		} else {

		}

		$res->getBody()->write(
			json_encode(['status' => 200, 'message' => 'session destroyed'])
		);
	}

	public function invalidSession($res) {
		$res->getBody()->write(\json_encode([
			'status' => 401, 'message' => 'Invalid Session',
		]));
	}

	public function notFound($res) {
		$res->getBody()->write(\json_encode([
			'status' => 404, 'message' => 'Invalid id. Object not found',
		]));
	}

	public function validateRequired($keys, $arr) {
		$res = [];
		foreach ($keys as $key) {
			if (!isset($arr[$key])) {
				$res[] = "$key is required for this route";
			}
		}

		if (count($res) == 0) {
			return true;
		} else {
			return $res;
		}

	}
}
?>