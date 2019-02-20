<?php
namespace src\app\Controllers\Admin;
use src\app\Models\User;
trait Roles {

	public function isSuperAdmin() {
		if (\is_null($this->user)) {
			return false;
		}

		if ($this->user->u_role == self::SUPERADMIN) {
			return true;
		}

		return false;
	}

	public function isAdmin() {
		if (\is_null($this->user)) {
			return false;
		}

		if ($this->user->u_role == self::ADMIN) {
			return true;
		}

		return false;
	}

	public function isSchool() {
		/*if ($this->school) {
			return true;
		}*/
		if (\is_null($this->user)) {
			return false;
		}

		if ($this->user->u_role == self::SCHOOL) {
			return true;
		}

		return false;
	}

	public function isDriver() {
		if (\is_null($this->user)) {
			return false;
		}

		if ($this->user->u_role == self::DRIVER) {
			return true;
		}

		return false;
	}

	public function isUser() {
		if (\is_null($this->user)) {
			return false;
		}

		if ($this->user->u_role == self::USER) {
			return true;
		}

		return false;
	}

	public function isTester() {
		if (\is_null($this->user)) {
			return false;
		}

		if ($this->user->u_role == self::TESTER) {
			return true;
		}

		return false;
	}

}
?>