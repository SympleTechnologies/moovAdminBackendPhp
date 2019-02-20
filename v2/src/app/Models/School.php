<?php
namespace src\app\Models;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
	protected $table = "edu_institution";
	protected $_fillable = ['ei_id'];
    protected $primaryKey = 'ei_id';
    public $incrementing = false;
    public $timestamps = false;
}
?>