<?php
namespace src\app\Models;

use Slim\Http\Request;
use Slim\Http\Response;
use Illuminate\Database\Eloquent\Model;

class MoovWallet extends Model{
   protected $table = 'moov_wallet';
   protected $fillable = ['mw_user_id', 'mw_transaction_type', 'mw_amount', 'mw_date'];

   protected $casts = [
        'options' => 'array',
    ];
//const CREATED_AT = 'w_created';
//const UPDATED_AT = 'w_last_updated';
public $timestamps = false;

}
 