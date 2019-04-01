<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class BankDetails extends Model
{
    protected $table = 'bank_details';
    protected $_fillable = [];
    protected $primaryKey = 'bd_id';
    public $incrementing = false;

    protected $_casts = [
        'options' => 'array',
    ];
//     const CREATED_AT = 'u_created_at';
    // const UPDATED_AT = 'u_last_modified';
    public $timestamps = false;

}
