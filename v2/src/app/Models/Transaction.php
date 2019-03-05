<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model {
	protected $primaryKey = 't_id';
	protected $table = 'transactions';
	//protected $fillable = [];
	//mark id this as non fillable
	protected $guarded = ['id'];
	const CREATED_AT = 't_started';
	const UPDATED_AT = 't_date';
	public $timestamps = true;

	public function user() {
		return $this->belongsTo('src\app\Models\User', 't_user_id');
	}

}
