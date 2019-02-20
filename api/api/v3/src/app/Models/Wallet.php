<?php
namespace src\app\Models;

use Slim\Http\Request;
use Slim\Http\Response;
use Illuminate\Database\Eloquent\Model;

class Wallet extends Model{
   protected $table = 'wallet';
   protected $fillable = ['w_user_id','w_amount'];

   protected $casts = [
        'options' => 'array',
    ];
const CREATED_AT = 'w_created';
const UPDATED_AT = 'w_last_updated';
//public $timestamps = false;


}
 