<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class Rides extends Model
{
    protected $table = 'cab_rides';
    protected $_fillable = [];
    protected $primaryKey = 'cr_id';
    public $incrementing = false;

    protected $casts = [
        'options' => 'array',
    ];
    // const CREATED_AT = 'cr_booked_on';
    // const UPDATED_AT = 'cr_ride_end_time';
    public $timestamps = false;

}
