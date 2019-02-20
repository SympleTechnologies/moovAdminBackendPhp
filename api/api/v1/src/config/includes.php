<?php

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
require 'src/app/Controllers/Wallet.php';
require 'src/app/Controllers/Ride.php';
require 'src/app/Controllers/Email.php';
require 'src/app/Controllers/Tests.php';

//spl_autoload will trigger error
//middle
require 'src/app/Middleware/JAuth.php'; //
