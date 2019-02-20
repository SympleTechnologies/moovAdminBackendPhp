<?php

namespace src\app\Controllers;

use mukto90\Ncrypt;
use Slim\Http\UploadedFile;
use src\app\Helpers\Hwallet;

// use src\app\Middleware\JAuth;

use src\app\Models\User as Users;
use src\app\Models\UserLoginLog;
use src\app\Models\Wallet;
use src\config\Api_Controller;
use src\config\Mail_Controller;

class Auth extends Api_Controller
{

    public function __construct($app)
    {

        parent::__construct();

        $this->ncrypt = new Ncrypt();

        $this->ncrypt->set_secret_key($this->env['oauth_secret_key']);

        $this->ncrypt->set_secret_iv($this->env['oauth_secret_iv']);

        $this->ncrypt->set_cipher('AES-256-CBC'); //optional

    }

    public function login()
    {

        $links = array(

            "self" => $this->self,

            "forgot_password" => base_url($this->env['route']['user']['forgot']),

            "register" => base_url($this->env['route']['user']['register']),

        );

        $userdata = array(

            'u_email' => $this->input['email'],

            'u_password' => $this->input['password'],

        );

        $pushToken = $this->input['push_token'];

        $deviceId = $this->input['device_id'];

        $deviceType = $this->input['device_type'];

        $appVersion = $this->input['app_version'];

        $count = Users::where($userdata)->count();

        if ($count > 0) {

            $users = Users::select('u_id', 'u_first_name', 'u_image')->where('u_email', $this->input['email'])->first();

            $userid = $users['u_id'];

            $balance = Hwallet::balance($users['u_id']);

            if (!empty($balance)) {

                $users['wallet_balance'] = $balance;

            } else {

                $users['wallet_balance'] = 0;

            }

            /*  Working

            //  $token = bin2hex(random_bytes(12));

            // $token = bin2hex(openssl_random_pseudo_bytes(64)); //if server below php 7

            //

             */

            $tokenstring = $users['u_id'] . "," . time_now();

            $token = $this->ncrypt->encrypt(serialize($tokenstring));

            Users::where('u_email', $this->input['email'])

                ->update(['u_token' => $token, 'u_push_token' => $pushToken, "u_device_type" => $deviceType, "u_app_version" => $appVersion, "u_device_id" => $deviceId]);

            $userlogs = new UserLoginLog;

            $userlogs->ull_user_id = $users['u_id'];

            $userlogs->ull_device_id = $deviceId;

            $userlogs->ull_login_time = time_now();

            $userlogs->save();

            $dir = $this->app->get('profile_pic_upload_url');

            $dir100 = $this->app->get('profile_pic_upload_croped_100_url');

            $dir200 = $this->app->get('profile_pic_upload_croped_200_url');

            $output = array(

                "status" => true,

                "data" => array("user_details" => $users,

                    "access_token" => $token,

                    "user_pic_url" => $this->env['app_url_live'] . "" . $dir . "" . $users['u_image'],

                    "user_pic_url_100" => $this->env['app_url_live'] . "" . $dir100 . "" . $users['u_image'],

                    "user_pic_url_200" => $this->env['app_url_live'] . "" . $dir200 . "" . $users['u_image'],

                ),

                "message" => "login success",

                "links" => $links,

            );

        } else {

            // $links[]=array("forgot_password"=>"");

            $output = array(

                "status" => false,

                "message" => "login failed",

                //  "data" => array(),

                "links" => $links,

            );

        }

        return $this->response->withJson($output);

    }

    public function social_login()
    {

        $links = array(

            "self" => $this->self,

            "forgot_password" => base_url($this->env['route']['user']['forgot']),

            "register" => base_url($this->env['route']['user']['register']),

        );

        $method = $this->input['provider'];

        $socailid = $this->input['uid'];

        $deviceid = $this->input['device_id'];

        $deviceType = $this->input['device_type'];

        $appVersion = $this->input['app_version'];

        $userdata = array(

            'u_auth_provider' => $method,

            'u_auth_uid' => $socailid,

        );

        $count = Users::where($userdata)->count();

        if ($count > 0) {

            $users = Users::select('u_id', 'u_first_name', 'u_image')->where('u_auth_uid', $socailid)->first();

            $userid = $users['u_id'];

            $balance = Hwallet::balance($users['u_id']);

            if (!empty($balance)) {

                $users['wallet_balance'] = $balance;

            } else {

                $users['wallet_balance'] = 0;

            }

            /*  Working

            //  $token = bin2hex(random_bytes(12));

            // $token = bin2hex(openssl_random_pseudo_bytes(64)); //if server below php 7

            //

             */

            $tokenstring = $users['u_id'] . "," . time_now();

            $token = $this->ncrypt->encrypt(serialize($tokenstring));

            // Users::where('u_id', $userid)
            //     ->update(['u_token' => $token, 'u_push_token' => $deviceid, "u_device_type" => $deviceType, "u_app_version" => $appVersion, "u_device_id" => $deviceid]);

            $this->db->table('users')
                ->where('u_id', $userid)
                ->update([
                    'u_token' => $token,
                    'u_push_token' => $deviceid,
                    "u_device_type" => $deviceType,
                    "u_app_version" => $appVersion,
                    "u_device_id" => $deviceid,

                ]);

            // $userlogs = new UserLoginLog;

            // $userlogs->ull_user_id = $users['u_id'];

            // $userlogs->ull_device_id = $deviceid;

            // $userlogs->ull_login_time = time_now();

            // $userlogs->ull_logout_time = time_now();

            // $userlogs->save();

            $dir = $this->app->get('profile_pic_upload_url');

            $dir100 = $this->app->get('profile_pic_upload_croped_100_url');

            $dir200 = $this->app->get('profile_pic_upload_croped_200_url');

            $output = array(

                "status" => true,

                "data" => array("user_details" => $users,

                    "access_token" => $token,

                    "user_pic_url" => $this->env['app_url_live'] . "" . $dir . "" . $users['u_image'],

                    "user_pic_url_100" => $this->env['app_url_live'] . "" . $dir100 . "" . $users['u_image'],

                    "user_pic_url_200" => $this->env['app_url_live'] . "" . $dir200 . "" . $users['u_image'],

                ),

                "message" => "login success",

                "links" => $links,

            );

        } else {

            // $links[]=array("forgot_password"=>"");

            $output = array(

                "status" => false,

                "message" => "login failed, please use registration",

                //  "data" => array(),

                "links" => $links,

            );

        }

        return $this->response->withJson($output);

    }

    public function save_url_img($img_url)
    {

        $dir = $this->app->get('profile_pic_upload');

        $filename = randomPassword(10);

        $url = $img_url;

        $data = file_get_contents($url);

        $fp = fopen($dir . "" . $filename . ".png", "wb");

        if (!$fp) {

            exit;

        }

        fwrite($fp, $data);

        fclose($fp);

        return $filename.".png";

    }

    public function register()
    {

        $links = array(

            "self" => $this->self,

            "login" => base_url($this->env['route']['user']['login']),

            "forgot_password" => base_url($this->env['route']['user']['forgot']),

        );

        $required = array('f_name', 'l_name', 'email', 'password', 'college', 'phone');

        $missing = array_diff_key(array_flip($required), $this->input);

        if (empty($missing)) {

            $email = $this->input['email'];

            $count = Users::where('u_email', $email)->count();

            if ($count <= 0) {

                if (empty($this->input['password'])) {

                    $userpassword = randomPassword();

                } else {

                    $userpassword = $this->input['password'];

                }

                $dir = $this->app->get('profile_pic_upload');

                $crop_dir_200 = $this->app->get('profile_pic_upload_croped_200');

                $crop_dir_100 = $this->app->get('profile_pic_upload_croped_100');

                $uploadedFiles = $this->request->getUploadedFiles();

                $gender = strtolower($this->input['gender']);

                /*

                // if (isset($uploadedFiles['image'])) {

                $uploadedFile = $uploadedFiles['image'];

                if ($uploadedFile->getError() === UPLOAD_ERR_OK) {

                $filename = $this->moveUploadedFile($dir, $uploadedFile);

                // $img = Image::make($dir . "" . $filename);

                // $img->resize(200, 200);

                // $img->save($crop_dir_200 . "" . $filename);

                // $img->resize(100, 100);

                // $img->save($crop_dir_100 . "" . $filename);

                } else {

                $filename = $gender.'.png';

                }

                // } else {

                //     $filename = $gender. '.png';

                // }

                 */

                $filename = $gender . '.png';

                if (is_string($this->input['image']) && isset($this->input['image'])) {

                    $filename = $this->save_url_img($this->input['image']);

                    // $img = Image::make($dir . "" . $filename);

                    // $img->resize(200, 200);

                    // $img->save($crop_dir_200 . "" . $filename);

                    // $img->resize(100, 100);

                    // $img->save($crop_dir_100 . "" . $filename);

                }
               //  $filename = $gender . '.png';
                $links = array(
                    "self" => $this->self,
                    "forgot_password" => base_url($this->env['route']['user']['forgot']),
                    "register" => base_url($this->env['route']['user']['register']),

                );

                $method = $this->input['provider'];
                $socailid = $this->input['uid'];
                $deviceid = $this->input['device_id'];
                $tokenstring = time_now();
                $token = $this->ncrypt->encrypt(serialize($tokenstring));

                $users = new Users;

                $users->u_first_name = $this->input['f_name'];

                $users->u_last_name = $this->input['l_name'];

                $users->u_email = $this->input['email'];

                $users->u_password = $userpassword;

                $users->u_edu_institution = $this->input['college'];

                $users->u_phone = $this->input['phone'];

                $users->u_gender = $gender;

                $users->u_auth_mode = $this->input['auth_mode'];

                $users->u_auth_provider = $this->input['auth_provider'];

                $users->u_auth_uid = $this->input['auth_uid'];

                $users->u_type = $this->input['user_type'];

                $users->u_image = $filename;

                $users->u_phone_country = $this->input['phone_country'];
                $users->u_token = $token;
                $users->u_push_token = $pushToken;
                $users->u_device_type = $deviceType;
                $users->u_app_version = $appVersion;
                $users->u_device_id = $deviceId;

                $users->save();

                $wallet = new Wallet;

                $wallet->w_user_id = $users->id;

                $wallet->w_amount = 0;

                $wallet->save();

                /* $output = array(

                "status" => true,

                "data" => array("user_details" => array(

                'user_id' => $users->id,

                )),

                "message" => "Registration success",

                "links" => $links,

                );*/

                $dir = $this->app->get('profile_pic_upload_url');
                $dir100 = $this->app->get('profile_pic_upload_croped_100_url');
                $dir200 = $this->app->get('profile_pic_upload_croped_200_url');
                $users = Users::select('u_id', 'u_first_name', 'u_image')->where('u_id', $users->id)->first();
                $users['wallet_balance'] = array("balance"=>"0");

                $output = array(
                    "status" => true,
                    "data" => array("user_details" => $users,
                        "access_token" => $token,
                        "user_pic_url" => $this->env['app_url_live'] . "" . $dir . "" . $users['u_image'],
                        "user_pic_url_100" => $this->env['app_url_live'] . "" . $dir100 . "" . $users['u_image'],
                        "user_pic_url_200" => $this->env['app_url_live'] . "" . $dir200 . "" . $users['u_image'],
                    ),
                    "message" => "login success",
                    "links" => $links,

                );

            } else {

                $output = array(

                    "status" => false,

                    "message" => "Email already Exists",

                    "errors" => array("message" => array("already exist")),

                    "links" => $links,

                );

            }

        } else {

            $error = array();

            foreach ($missing as $key => $val) {

                $error[] = array("data" => $key . " is missing");

            }

            $output = array(

                "status" => false,

                "message" => "Please fill all the fields",

                "errors" => array("message" => $error),

                "data" => array("reg_details" => array()),

            );

        }

        return $this->response->withJson($output);

    }

    public function forgot_password()
    {

        $mail = new Mail_Controller();

        if (isset($this->input['email'])) {

            $useremail = $this->input['email'];

            $userdata = array(

                'u_email' => $this->input['email'],

            );

            $count = Users::where($userdata)->count();

            $randomPassword = randomPassword();

            if ($count > 0) {

                $maildata = array(

                    "to" => $useremail,

                    'subject' => 'Forgot password',

                    'view_page' => 'emails/forgot_password.html',

                    'view_data' => array(

                        'email' => $useremail,

                        'password' => $randomPassword,

                    ),

                );

                if ($mail->send_mail($maildata)) {

                    Users::where('u_email', $useremail)

                        ->update(['u_password' => $randomPassword]);

                    $output = array(

                        "status" => true,

                        "message" => "A new password will be send to you if mail exist in our server",

                    );

                } else {

                    $output = array(

                        "status" => false,

                        "message" => "An error occured while sending the email",

                    );

                }

            } else {

                $output = array(

                    "status" => true,

                    "message" => "A new password will be send to you if mail exist in our server!", //

                );

            }} else {

            $output = array(

                "status" => false,

                "message" => "Please fill email!", //

            );

        }

        return $this->response->withJson($output);

    }

    public function get_edu_list()
    {

        $links = array(

            "self" => $this->self,

            "login" => base_url($this->env['route']['user']['login']),

            "forgot_password" => base_url($this->env['route']['user']['forgot']),

            "register" => base_url($this->env['route']['user']['register']),

        );

        $eduInst = $this->db->table('edu_institution')

            ->select("ei_name as name", "ei_id as id")->get();

        $result = array(

            "status" => true,

            "data" => array("details" => $eduInst),

            "message" => "College List",

            "links" => $links,

        );

        return $this->response->withJson($result);

    }

    public function get_usertype_list()
    {

        $links = array(

            "self" => $this->self,

            "login" => base_url($this->env['route']['user']['login']),

            "forgot_password" => base_url($this->env['route']['user']['forgot']),

            "register" => base_url($this->env['route']['user']['register']),

        );

        $eduInst = $this->db->table('user_type')

            ->select("ut_type_name as name", "ut_id as id")->whereNotIn('ut_id', ['1', '2', '4'])->get();

        $result = array(

            "status" => true,

            "data" => array("details" => $eduInst),

            "message" => "User type List",

            "links" => $links,

        );

        return $this->response->withJson($result);

    }

    public function activation_resend()
    {

    }

    public function delete_account()
    {

    }

    public function moveUploadedFile($directory, UploadedFile $uploadedFile)
    {

        $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);

        $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php

        $filename = sprintf('%s.%0.8s', $basename, $extension);

        $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);

        return $filename;

    }


    public function check_email(){

        if (isset($this->input['email'])) {

            $useremail = $this->input['email'];

            $userdata = array(

                'u_email' => $this->input['email'],

            );

            $count = Users::where($userdata)->count();

            if ($count > 0) {

               

                    $output = array(

                        "status" => true,

                        "message" => "An email exist",

                    );

    

            } else {

                $output = array(

                    "status" => false,

                    "message" => "No emails found", //

                );

            }
        } else {

            $output = array(

                "status" => false,

                "message" => "Please fill email!", //

            );

        }

        return $this->response->withJson($output);

    }

}
