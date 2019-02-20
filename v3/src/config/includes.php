<?php
/*
spl_autoload_register(function ($class) {

    $sources = array("src/app/Models/$class.php", "src/app/Helpers/$class.php ", "src/config/$class.php","src/app/Controllers/$class.php","src/app/Middleware/$class.php");

    foreach ($sources as $source) {
        if (file_exists($source)) {
            require $source;

        }else{
          
        }
    }
});
*/
/*
spl_autoload_register( function ($className) {
    $className = ltrim($className, '\\');
    $fileName  = '';
    $namespace = '';
    if ($lastNsPos = strrpos($className, '\\')) {
        $namespace = substr($className, 0, $lastNsPos);
        $className = substr($className, $lastNsPos + 1);
        $fileName  = str_replace('\\', DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;
    }
    $fileName .= str_replace('_', DIRECTORY_SEPARATOR, $className) . '.php';

    require $fileName;
});
*/


//Models

require 'src/app/Models/User.php';

require 'src/app/Models/UserLoginLog.php';

require 'src/app/Models/Wallet.php';

require 'src/app/Models/DriverDetails.php';

require 'src/app/Models/Rides.php';

require 'src/app/Models/Trips.php';



//Helpers

require 'src/app/Helpers/HWallet.php';

require 'src/app/Helpers/Helper.php';



//Controllers

require 'src/config/Api_Controller.php';

require 'src/config/Mail_Controller.php';

require 'src/config/Connection.php';



//user Controllers

require 'src/app/Controllers/User.php';

require 'src/app/Controllers/Auth.php';

require 'src/app/Controllers/DriverAuth.php';

require 'src/app/Controllers/Booking.php';
require 'src/app/Controllers/FutureBooking.php';
require 'src/app/Controllers/cronbooking.php';

require 'src/app/Controllers/Wallet.php';

require 'src/app/Controllers/Ride.php';

require 'src/app/Controllers/Email.php';

require 'src/app/Controllers/Tests.php';
require 'src/app/Controllers/Otp.php';



//spl_autoload will trigger error

//middle

require 'src/app/Middleware/JAuth.php'; //

