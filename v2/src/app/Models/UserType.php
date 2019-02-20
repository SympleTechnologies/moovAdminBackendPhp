<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class userType extends Model
{
    protected $_table = 'user_type';
    protected $primaryKey = 'ut_id';
    public $incrementing = false;

//     const CREATED_AT = 'u_created_at';
    // const UPDATED_AT = 'u_last_modified';
    public $timestamps = false;

}
