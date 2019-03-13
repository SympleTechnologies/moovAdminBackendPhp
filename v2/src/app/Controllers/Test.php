<?php
namespace src\app\Controllers;

use Intervention\Image\ImageManagerStatic as Image;
use Slim\Http\UploadedFile;
use src\app\Helpers\Helper;
use src\app\Models\User as Users;
use src\config\Api_Controller;

class Tests extends Api_Controller
{

    public function test(){
        echo "Testing";
        
    }
}

?>