<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class Wallet extends Model {
	protected $primaryKey = 'w_id';
	protected $table = 'wallet';
	protected $fillable = ['w_user_id', 'w_amount'];

	protected $casts = [
		'options' => 'array',
	];
	const CREATED_AT = 'w_created';
	const UPDATED_AT = 'w_last_updated';
//public $timestamps = false;

}
