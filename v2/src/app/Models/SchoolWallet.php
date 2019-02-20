<?php
namespace src\app\Models;

use Slim\Http\Request;
use Slim\Http\Response;
use Illuminate\Database\Eloquent\Model;

class SchoolWallet extends Model{
   protected $table = 'edu_wallet';
   protected $fillable = ['w_edu_id','w_amount'];
   protected $primaryKey = 'w_edu_id';

   protected $casts = [
        'options' => 'array',
    ];
const CREATED_AT = 'w_created';
const UPDATED_AT = 'w_last_updated';
//public $timestamps = false;

}
 