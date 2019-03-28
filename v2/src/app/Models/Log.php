<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    protected $table = 'logs';
    protected $fillable = ['type','message','context','user_agent'];
    public $timestamps = false;


}
