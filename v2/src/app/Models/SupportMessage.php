<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class SupportMessage extends Model {
	protected $table = 'support_messages';
	protected $fillable = ['subject', 'message', 'user_id', 'message_type', 'school_id'];
	protected $primaryKey = 'id';
	// public $incrementing = false;

	/*protected $casts = [
		'options' => 'array',
	];*/
	public function school() {
		return $this->belongsTo('src\app\Models\School', 'school_id');
	}
	public function user() {
		return $this->belongsTo('src\app\Models\User', 'user_id');
	}

	public $timestamps = false;

}
