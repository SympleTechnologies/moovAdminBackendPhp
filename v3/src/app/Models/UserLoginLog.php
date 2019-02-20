<?php
namespace src\app\Models;

use Slim\Http\Request;
use Slim\Http\Response;
use Illuminate\Database\Eloquent\Model;

class UserLoginLog extends Model{
   protected $table = 'user_login_logs';
   protected $fillable = ['ull_user_id'];
protected $_primaryKey = 'ull_id';
 public $incrementing = false;
   protected $casts = [
        'options' => 'array',
    ];
    public $timestamps = false;

}
 