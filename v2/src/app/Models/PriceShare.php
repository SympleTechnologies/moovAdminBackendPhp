<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class PriceShare extends Model
{
    protected $table = 'price_share';
    protected $primaryKey = 'school_id';
    public $incrementing = false;

//     const CREATED_AT = 'u_created_at';
    // const UPDATED_AT = 'u_last_modified';
    public $timestamps = false;

}
