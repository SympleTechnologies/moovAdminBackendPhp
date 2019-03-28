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

spl_autoload_register(function ($className) {
    $className = ltrim($className, '\\');
    $fileName  = '';
    $namespace = '';
    if ($lastNsPos = strrpos($className, '\\')) {
        $namespace = substr($className, 0, $lastNsPos);
        $className = substr($className, $lastNsPos + 1);
        $fileName  = str_replace('\\', DIRECTORY_SEPARATOR, $namespace) . DIRECTORY_SEPARATOR;
    }
    $fileName .= str_replace('_', DIRECTORY_SEPARATOR, $className) . '.php';
    
   if(file_exists( $fileName)){
        require $fileName;
   };
});


//Models

require 'src/app/Models/User.php';
require 'src/app/Models/SupportMessage.php';
require 'src/app/Models/UserLoginLog.php';

require 'src/app/Models/Wallet.php';

require 'src/app/Models/DriverDetails.php';

require 'src/app/Models/Rides.php';

require 'src/app/Models/Trips.php';

require 'src/app/Models/Bank_details.php';

require 'src/app/Models/UserType.php';
require 'src/app/Models/CarModel.php';
require 'src/app/Models/School.php';

require 'src/app/Models/PriceShare.php';

require 'src/app/Models/SchoolWallet.php';

require 'src/app/Models/MoovWallet.php';
require 'src/app/Models/Transaction.php';

//Helpers

require 'src/app/Helpers/HWallet.php';

require 'src/app/Helpers/Helper.php';
require 'src/app/Helpers/FileUpload.php';
require 'src/app/Helpers/RecordExistsValidatorRule.php';
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

require 'src/app/Controllers/Admin/AdminTraits.php';
require 'src/app/Controllers/Admin/SchoolTraits.php';
require 'src/app/Controllers/Admin/DriverTraits.php';
require 'src/app/Controllers/Admin/RideTraits.php';
require 'src/app/Controllers/Admin/SupportTraits.php';
require 'src/app/Controllers/Admin/PaymentTraits.php';
require 'src/app/Controllers/Admin/FilterTraits.php';
require 'src/app/Controllers/Admin/EmailTraits.php';
require 'src/app/Controllers/Admin/Roles.php';
require 'src/app/Controllers/Admin/BaseAdmin.php';
require 'src/app/Controllers/Admin/Admin.php';
require 'src/app/Controllers/Admin/SuperAdmin.php';
require 'src/app/Controllers/Admin/School.php';

//spl_autoload will trigger error

//middle

require 'src/app/Middleware/JAuth.php'; //
