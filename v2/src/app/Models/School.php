<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class School extends Model {
	protected $table = "edu_institution";
	protected $_fillable = ['ei_id'];
	protected $primaryKey = 'ei_id';
	public $incrementing = false;
	public $timestamps = false;
	public static function generateUserFromSchoolID($id) {
		$school = School::where('ei_id', $id)->first();
		$user = new User();
		$user->u_first_name = $school->ei_name;
		$user->u_email = $school->ei_email;
		$user->u_role = 3;
		$user->u_edu_institution = $school->ei_id;
		return $user;
	}

}
?>