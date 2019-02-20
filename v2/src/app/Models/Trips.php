<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class Trips extends Model
{
    protected $table = 'cab_trip';
    protected $_fillable = [];
    protected $primaryKey = 'ct_id';
   // public $incrementing = false;

    protected $casts = [
        'options' => 'array',
    ];

    public $timestamps = false;

}
