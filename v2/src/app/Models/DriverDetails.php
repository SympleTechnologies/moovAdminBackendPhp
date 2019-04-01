<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class DriverDetails extends Model
{
    protected $table = 'driver_details';
    protected $_fillable = ['dd_driver_id'];
    protected $primaryKey = 'dd_driver_id';
    public $incrementing = false;

    protected $_casts = [
        'options' => 'array',
    ];
//     const CREATED_AT = 'u_created_at';
    // const UPDATED_AT = 'u_last_modified';
    public $timestamps = false;

    public function user() {
		return $this->belongsTo('src\app\Models\User', 'dd_driver_id');
    }
    public function bank_detail() {
		return $this->hasOne('src\app\Models\BankDetails', 'bd_user_id');
	}

}
