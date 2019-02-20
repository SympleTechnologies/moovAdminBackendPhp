<?php
namespace src\app\Controllers\Admin;
use src\app\Models\SupportMessage;
use src\app\Models\User;
trait SupportTraits {
	public function searchSupportMessages($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}
		$message_type = $req->getQueryParam('message_type');
		$page = (\is_null($args['page']) || $args['page'] == 0) ? 1 : $args['page'];
		$limit = (\is_null($args['limit']) || $args['limit'] == 0) ? 20 : $args['limit'];
		$skip = ($page - 1) * $limit;

		$query = SupportMessage::with(array('user' => function ($query) {
			$query->select('u_id', 'u_first_name as first_name', 'u_last_name as last_name', 'u_email as email');
		}));
		$query->where('message_type', $message_type);
		if ($message_type === 'school') {
			$query->with(array('school' => function ($query) {
				$query->select('ei_id', 'ei_name as name', 'ei_email as email');
			}));
		}
		if (!empty($req->getQueryParam('keyword'))) {
			$keyword = $req->getQueryParam('keyword');
			$query->whereHas('user', function ($query) use ($keyword) {
				$query->where('u_first_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_last_name', 'LIKE', "%$keyword%");
				$query->orWhere('u_email', 'LIKE', "%$keyword%");
			});
		}

		if ($this->isAdmin() || !empty($req->getQueryParam('school'))) {

			if ($this->isAdmin()) {
				$school_id = $this->user->u_edu_institution;
			} else {
				$school_id = $req->getQueryParam('school');
			}

			$query->whereHas('user', function ($q) use ($school_id) {
				$q->where('u_edu_institution', '=', $school_id);
			});
		}

		$total = $query->count();
		$query->skip($skip)->take($limit)->orderBy('id', 'desc');
		$totalPages = $total % $limit == 0 ? floor($total / $limit) : floor($total / $limit) + 1;

		$messages = $query->get();

		return $res->getBody()->write(json_encode([
			'status' => 200,
			'messages' => $messages,
			'total' => $total,
			'totalPages' => $totalPages,
			'page' => $page,
			'limit' => $limit,
		]));
	}
	public function deactivateUser($req, $res, $args) {
		// TAKE users password, store it in temp column, set password to random string, set status to deactivated
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		if ($args['id'] == $this->user->u_id) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'Invalid Operation on Your own Account']));
		}

		$user = User::find($args['id']);
		if (\is_null($user)) {return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'User not found']));}

		// if school admin, restrict to user's school
		if ($this->isAdmin()) {
			if ($user->u_edu_institution != $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'User not found']));
			}
		}

		if ($user->u_status === 'DEACTIVATED') {return $res->getBody()->write(json_encode(['status' => 200, 'message' => 'User already deactivated']));}
		if ($user->u_status === 'SUSPENDED') {return $res->getBody()->write(json_encode(['status' => 200, 'message' => 'User already suspended']));}

		$user->u_temp_pass = $user->u_password;
		$user->u_password = \uniqid() . '_' . \mt_rand(1000, 9000);
		$user->u_status = 'DEACTIVATED';

		$user->save();

		$res->getBody()->write(json_encode(['status' => 200, 'message' => 'User deactivated']));

	}

	public function reactivateUser($req, $res, $args) {
		// restore password from temp column, set status back to ACTIVE
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		if ($args['id'] == $this->user->u_id) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'Invalid Operation on Your own Account']));
		}

		$user = User::find($args['id']);
		if (\is_null($user)) {return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'User not found']));}

		// if school admin, restrict to user's school
		if ($this->isAdmin()) {
			if ($user->u_edu_institution !== $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'User not found']));
			}
		}
		if ($user->u_status === 'ACTIVE') {return $res->getBody()->write(json_encode(['status' => 200, 'message' => 'User already active']));}

		$user->u_password = $user->u_temp_pass;
		$user->u_temp_pass = "";
		$user->u_status = 'ACTIVE';

		$user->save();

		$res->getBody()->write(json_encode(['status' => 200, 'message' => 'User reactivated']));
	}

	public function suspendUser($req, $res, $args) {
		//
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		if ($args['id'] == $this->user->u_id) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'Invalid Operation on Your own Account']));
		}

		$user = User::find($args['id']);
		if (\is_null($user)) {return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'User not found']));}

		// if school admin, restrict to user's school
		if ($this->isAdmin()) {
			if ($user->u_edu_institution !== $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'User not found']));
			}
		}

		if ($user->u_status === 'SUSPENDED') {return $res->getBody()->write(json_encode(['status' => 200, 'message' => 'User already suspended']));}
		if ($user->u_status === 'DEACTIVATED') {return $res->getBody()->write(json_encode(['status' => 200, 'message' => 'User already deactivated']));}

		$user->u_temp_pass = $user->u_password;
		$user->u_password = \uniqid() . '_' . \mt_rand(1000, 9000);
		$user->u_status = 'SUSPENDED';

		$user->save();

		$res->getBody()->write(json_encode(['status' => 200, 'message' => 'User suspended']));
	}

	public function resetUserPassword($req, $res, $args) {
		//
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

		if ($args['id'] == $this->user->u_id) {
			return $res->getBody()->write(json_encode(['status' => 400, 'message' => 'Invalid Operation on Your own Account']));
		}

		$user = User::find($args['id']);
		if (\is_null($user)) {return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'User not found']));}

		// if school admin, restrict to user's school
		if ($this->isAdmin()) {
			if ($user->u_edu_institution !== $this->user->u_edu_institution) {
				return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'User not found']));
			}
			// if user is also an admin or a super admin, restrict
			if ($user->u_role == self::SUPERADMIN || $user->u_role == self::ADMIN) {
				return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'This user is an admin. Only a superadmin can reset their password']));
			}
		}

		if ($user->u_status == 'SUSPENDED' || $user->u_status === 'DEACTIVATED') {
			return $res->getBody()->write(json_encode(['status' => 404, 'message' => 'This user is currently suspended or deactivated. reactivate them before you can reset their password.']));
		}

		$chars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'x', 'y', 'z'];
		$p = "";
		for ($x = 0; $x <= 9; $x++) {
			$p .= $chars[mt_rand(0, count($chars) - 1)];
		}
		$user->u_password = $p;
		$user->save();

		$this->sendPasswordEmail($user->u_first_name, $user->u_email, $p);

		$res->getBody()->write(json_encode(['status' => 200, 'message' => 'User password reset', 'new_password' => $p]));
	}

	public function sendEmail($req, $res, $args) {
		//
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}

	}
}
