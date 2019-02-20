<?php
namespace src\app\Helpers;

use src\app\Models\User as Users;

class Helper
{

    public function __construct($app)
    {
        // parent::__construct();

    }

    public static function get_email($userid)
    {

        $walletBalance = Users::select('w_amount')->where('w_user_id', $userid)->first();

        return $walletBalance;

    }

    public static function get_user($userid)
    {

        $users = Users::select("*")->where('u_id', $userid)->first();

        return $users;

    }

}
