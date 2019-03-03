<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $_table = 'users';
    protected $_fillable = ['u_phone', 'u_email', 'u_password'];
    protected $_primaryKey = 'u_id';
     // public $incrementing = false;

    // protected $_casts = [
    //     'options' => 'array',
    // ];
    const CREATED_AT = 'u_created_at';
    const UPDATED_AT = 'u_last_modified';
//public $timestamps = false;

}