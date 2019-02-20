<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class DriverDetails extends Model
{
    protected $table = 'driver_details';
    protected $_fillable = [];
    protected $primaryKey = 'dd_driver_id';
    public $incrementing = false;

    protected $_casts = [
        'options' => 'array',
    ];
//     const CREATED_AT = 'u_created_at';
    // const UPDATED_AT = 'u_last_modified';
    public $timestamps = false;

}
