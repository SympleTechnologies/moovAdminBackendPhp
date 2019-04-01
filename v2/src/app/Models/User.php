<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model {
	protected $_table = 'users';
	protected $_fillable = ['u_phone', 'u_email', 'u_password'];
	protected $hidden = ['password','u_push_token','u_image_100','u_image_200','u_push_token','u_device_id','u_temp_pass','u_token'];
	protected $primaryKey = 'u_id';
	// public $incrementing = false;

	// protected $_casts = [
	//     'options' => 'array',
	// ];
	const CREATED_AT = 'u_created_at';
	const UPDATED_AT = 'u_last_modified';
//public $timestamps = false;
	public function school() {
		return $this->belongsTo('src\app\Models\School', 'u_edu_institution');
	}

}