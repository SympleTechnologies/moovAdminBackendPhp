<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class CarModel extends Model
{
    protected $table = 'car_model';
    protected $primaryKey = 'cm_id';
    protected $fillable = ['cm_model_name','cm_model_description','cm_model_image'];

//     const CREATED_AT = 'u_created_at';
    // const UPDATED_AT = 'u_last_modified';
    public $timestamps = false;

}
