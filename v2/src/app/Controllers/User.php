<?php

namespace src\app\Controllers;

use Intervention\Image\ImageManagerStatic as Image;
use Slim\Http\UploadedFile;
use src\app\Helpers\Helper;
use src\app\Helpers\Hwallet;
use src\app\Models\BankDetails;
use src\app\Models\User as Users;
use src\config\Api_Controller;
use src\app\Helpers\FileUpload;
use src\app\Helpers\RecordExistsValidatorRule;
use Rakit\Validation\Validator;

class User extends Api_Controller
{
	/* public function __construct($app)
	{
		parent::__construct();
	} */

	public function update_setting()
	{ }

	public function update_driver_details()
	{
		$userid = $this->input['userid'];

		$result = $this->db->table('driver_details')

			->where('dd_driver_id', $userid)

			->update([

				// "dd_birth_day"=> $this->input['dob'];

				"dd_expiery_date" => $this->input['license_expiry'],

				"dd_license" => $this->input['license_expiry'],

				"dd_car_number" => $this->input['plate_no'],

				"dd_car_model_id" => $this->input['car_model'],

				"dd_car_capacity" => $this->input['car_capacity'],

			]);

		if ($result) {
			$u_details = $this->get_user_details($userid);
			$u_type = $u_details['u_type'];
			if ($u_type == "3") {
				$user_details = $u_details;
			} else {
				$user_details = $this->get_driver_details($userid);
			}

			$result = array(

				"status" => true,

				"message" => "Update successfull",
				"data" => $user_details,

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		} else {
			$result = array(

				"status" => false,

				"message" => "Updated failed",

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		}

		return $this->response->withJson($result);
	}

	public function update_profile()
	{
		$userid = $this->input['userid'];

		$userdetails = Helper::get_user($userid);

		/* $uimage = $userdetails['u_image']; */

		/* $dir = $this->app->get('profile_pic_upload');

		$crop_dir_200 = $this->app->get('profile_pic_upload_croped_200');

		$crop_dir_100 = $this->app->get('profile_pic_upload_croped_100');

		$uploadedFiles = $this->request->getUploadedFiles();

		if (isset($uploadedFiles['image'])) {
			$uploadedFile = $uploadedFiles['image'];

			if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
				$filename = $this->moveUploadedFile($dir, $uploadedFile);

				// $this->response->write('uploaded ' . $filename . '<br/>');

				$img = Image::make($dir . "" . $filename);

				$img->resize(200, 200);

				$img->save($crop_dir_200 . "" . $filename);

				$img->resize(100, 100);

				$img->save($crop_dir_100 . "" . $filename);
			} else {
				$filename = $uimage;
			}
		} else {
			$filename = $uimage;
		} */

		$this->db->table('users')

			->where('u_id', $userid)

			->update([

				"u_first_name" => $this->input['f_name'],

				"u_last_name" => $this->input['l_name'],

				"u_edu_institution" => $this->input['college'],

				// "u_phone" => $this->input['phone'],

				"u_gender" => $this->input['gender'],

				// "u_image" => $this->env['app_url_live'] . "" . $dir . "" .$filename,

			]);

		$this->db->table('driver_details')

			->where('dd_driver_id', $userid)

			->update([

				"dd_birth_day" => $this->input['dob'],

			]);

		$u_details = $this->get_user_details($userid);
		$u_type = $u_details['u_type'];
		if ($u_type == "3") {
			$user_details = $u_details;
		} else {
			$user_details = $this->get_driver_details($userid);
		}

		$result = array(

			"status" => true,

			"message" => "Updated Successfully",
			"data" => $user_details,

			"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

		);

		return $this->response->withJson($result);
	}
	public function update_profile_picture_ios($request, $response, $args)
	{
		$userid = $args['user_id'];
		if (!empty($userid)) {
			if (!Helper::get_user($userid)) {
				$result = array(

					"status" => false,
					"message" => "Please provide a valid user ID, user with that ID does not exist!",
				);
				return $this->response->withJson($result)->withStatus(400);
			};
		}
		if (!@$this->input['image']) {
			$result = array(

				"status" => false,
				"message" => "Please provide an image url",
			);
			return $this->response->withJson($result)->withStatus(400);
		}
		$imageUrl = @$this->input['image'];
		$this->db->table('users')

			->where('u_id', $userid)

			->update([
				"u_image" => $imageUrl,
				"u_image_100" => $imageUrl,
				"u_image_200" => $imageUrl,
			]);

		$users = Users::select('u_id', 'u_first_name', 'u_image')->where('u_id', $userid)->first();

		$balance = Hwallet::balance($userid);

		if (!empty($balance)) {
			$users['wallet_balance'] = $balance;
		} else {
			$users['wallet_balance'] = 0;
		}
		$result = array(

			"status" => true,
			// "userdata"=>$user_details,
			"message" => "Updated Successfully",
			"data" => array(
				"user_details" => $users,

				"user_pic_url" => $imageUrl,

				"user_pic_url_100" => $imageUrl,

				"user_pic_url_200" => $imageUrl

			),

			// "links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

		);
		return $this->response->withJson($result);
	}
	public function update_profile_picture($request, $response, $args)
	{
		$userid = $args['user_id'];
		if (!empty($userid)) {
			if (!Helper::get_user($userid)) {
				$result = array(

					"status" => false,
					"message" => "Please provide a valid user ID, user with that ID does not exist!",
				);
				return $this->response->withJson($result);
			};
			/* $dir = $this->app->get('profile_pic_upload');

			$crop_dir_200 = $this->app->get('profile_pic_upload_croped_200');

			$crop_dir_100 = $this->app->get('profile_pic_upload_croped_100'); */

			/* is_dir($dir) || mkdir($dir);
			is_dir($crop_dir_100) || mkdir($crop_dir_100);
			is_dir($crop_dir_200) || mkdir($crop_dir_200); */
			//var_dump(realpath($dir));

			//var_dump(realpath($dir));
			//die();
			$uploadedFiles = $this->request->getUploadedFiles();
			if (isset($uploadedFiles['image']) && $uploadedFiles['image']->getError() === UPLOAD_ERR_OK) {
				$fileUpload = new FileUpload($this->app);
				$uploadResult = $fileUpload->uploadProfileImage($_FILES["image"]["tmp_name"]);

				// $this->response->write('uploaded ' . $filename . '<br/>');

				/* $img = Image::make($dir . "" . $filename);

				$img->resize(200, 200);

				$img->save($crop_dir_200 . "" . $filename);

				$img->resize(100, 100);

				$img->save($crop_dir_100 . "" . $filename); */
			} else if (!isset($uploadedFiles['image'])) {
				$result = array(

					"status" => false,
					"message" => "Upload failed! No image found to upload!",
				);
				return $this->response->withJson($result);
			} else {
				$result = array(

					"status" => false,
					"message" => "Upload failed!",
				);
				return $this->response->withJson($result);
			}

			$this->db->table('users')

				->where('u_id', $userid)

				->update([
					"u_image" => $uploadResult['url'],
					"u_image_100" => $uploadResult['url_crop_100'],
					"u_image_200" => $uploadResult['url_crop_200'],
				]);

			/* $userdetails = Helper::get_user($userid);

			$uimage = $userdetails['u_image'];
			$u_details = $this->get_user_details($userid);
			$u_type = $u_details['u_type'];
			if ($u_type == "3") {
				$user_details = $u_details;
			} else {
				$user_details = $this->get_driver_details($userid);
			} */

			$users = Users::select('u_id', 'u_first_name', 'u_image')->where('u_id', $userid)->first();

			$balance = Hwallet::balance($userid);

			if (!empty($balance)) {
				$users['wallet_balance'] = $balance;
			} else {
				$users['wallet_balance'] = 0;
			}

			$result = array(

				"status" => true,
				// "userdata"=>$user_details,
				"message" => "Updated Successfully",
				"data" => array(
					"user_details" => $users,

					"user_pic_url" => $uploadResult['url'],

					"user_pic_url_100" => $uploadResult['url_crop_100'],

					"user_pic_url_200" => $uploadResult['url_crop_200'],

				),

				// "links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		} else {
			$result = array(

				"status" => false,
				"message" => "please provide userid",
			);
		}

		return $this->response->withJson($result);
	}

	public function getUser($request, $response, $args)
	{
		//'u_id', 'u_first_name', 'u_last_name', 'u_image'
		$users = Users::select('*')->where('u_id', $args['id'])->get();

		$result = array(

			"status" => true,

			"data" => array("user_details" => $users[0]),

			"message" => "Fetched successfully",

			"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			// "errors"=>array("message"=>""),

			// "meta"=>array("error_type"=> "OAuthException","code" => 400,"error_message"=> "...")

			// "pagination"=>array("next_url"=> "......","next_max_id" => "...")

		);

		return $this->response->withJson($result);

		//print_r($this->request->getQueryParam('id', $default = null));
	}
	public function getUserByEmail($request, $response, $args)
	{
		$user = Users::select('u_id as id', 'u_first_name as first_name', 'u_last_name as last_name')->where('u_email', $args['email'])->first();
		$result = array(

			"status" => $user ? true : false,

			"data" => array("user" => $user),

			"message" => $user ? "Fetched successfully" : "There's no registered user with that email address!",

			"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			// "errors"=>array("message"=>""),

			// "meta"=>array("error_type"=> "OAuthException","code" => 400,"error_message"=> "...")

			// "pagination"=>array("next_url"=> "......","next_max_id" => "...")

		);

		return $this->response->withJson($result);

		//print_r($this->request->getQueryParam('id', $default = null));
	}

	public function getBankDetails($request, $response, $args)
	{
		$users = BankDetails::select('bd_bank_code', 'bd_bank_name', 'bd_account_number', 'bd_account_name')->where('bd_user_id', $args['id'])->get();

		if (isset($users)) {
			$result = array(


				"status" => true,

				"data" => array("user_details" => $users[0]),

			);
		} else {
			$result = array(

				"status" => false,

				"data" => []

			);
		}

		return $this->response->withJson($result);
	}

	public function getAllUsers()
	{
		$users = Users::all('u_id', 'u_first_name', 'u_image');

		return $this->response->withJson([
			'data' => $users,
		]);
	}

	public function moveUploadedFile($directory, UploadedFile $uploadedFile)
	{
		$extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);

		$basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php

		$filename = sprintf('%s.%0.8s', $basename, $extension);

		$uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);

		return $filename;
	}

	public function driver_details($request, $response, $args)
	{


		$userid = $args['id'];

		$users = $this->db->table('users')

			->leftJoin('driver_details', 'driver_details.dd_driver_id', '=', 'users.u_id')

			->leftJoin('edu_institution', 'edu_institution.ei_id', '=', 'users.u_edu_institution')

			->leftJoin('wallet', 'wallet.w_user_id', '=', 'users.u_id')

			->where('users.u_id', '=', $userid)

			->first();

		$ratings = $this->db->table('driver_ratings')

			->where('dr_driver_id', $userid)

			->avg('dr_rating_score');

		$details = array(

			"first_name" => $users->u_first_name,

			"last_name" => $users->u_last_name,

			"email" => $users->u_email,

			"institution_id" => $users->u_edu_institution,

			"institution_name" => $users->ei_name,

			"phone" => $users->u_phone,

			"phone_country" => $users->u_phone_country,

			"gender" => $users->u_gender,

			"vehicle_no" => $users->dd_car_number,

			"verified" => $users->dd_admin_approved,

			"car_model" => $users->dd_car_model_id,

			"car_capacity" => $users->dd_car_capacity,

			"license_no" => $users->dd_license,

			"license_expiry" => $users->dd_expiery_date,

			"dob" => $users->dd_birth_day,

			"ratings" => round($ratings, 2),

			"wallet_balance" => $users->w_amount,

			"image" => $users->u_image,

		);

		$dd_array = array_map(function ($val) {
			return is_null($val) ? "" : $val;
		}, $details);

		$result = array(

			"status" => true,

			"data" => array(
				"user_details" => $dd_array,

				"user_pic_url" => $users->u_image,

				"user_pic_url_100" => $users->u_image_100,

				"user_pic_url_200" => $users->u_image_200
			),

			"message" => "Driver detais",

			"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

		);

		return $this->response->withJson($result);
	}

	public function user_details($request, $response, $args)
	{

		$userid = $args['id'];

		$users = $this->db->table('users')

			->leftJoin('edu_institution', 'edu_institution.ei_id', '=', 'users.u_edu_institution')

			->leftJoin('wallet', 'wallet.w_user_id', '=', 'users.u_id')

			->where('users.u_id', '=', $userid)

			->first();

		$details = array(

			"first_name" => $users->u_first_name,

			"last_name" => $users->u_last_name,

			"email" => $users->u_email,

			"institution_id" => $users->u_edu_institution,

			"institution_name" => $users->ei_name,

			"phone" => $users->u_phone,

			"phone_country" => $users->u_phone_country,

			"gender" => $users->u_gender,

			"wallet_balance" => $users->w_amount,

			"image" => $users->u_image,

		);

		$result = array(

			"status" => true,

			"data" => array(
				"user_details" => $details, "user_pic_url" => $users->u_image,

				"user_pic_url_100" => $users->u_image_100,

				"user_pic_url_200" => $users->u_image_200
			),

			"message" => "User detais",

			"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

		);

		return $this->response->withJson($result);
	}

	public function update_email()
	{
		$userid = $this->input['userid'];

		$newemail = $this->input['new_email'];

		$oldemail = $this->input['old_email'];

		$userdata = array(

			'u_email' => $this->input['old_email'],

			'u_id' => $this->input['userid'],

		);

		$count = Users::where($userdata)->count();

		if ($count > 0) {
			$affected = $this->db->table('users')

				->where('u_id', $userid)

				->update([

					"u_email" => $newemail,

				]);

			if ($affected) {
				$u_details = $this->get_user_details($userid);
				$u_type = $u_details['u_type'];
				if ($u_type == "3") {
					$user_details = $u_details;
				} else {
					$user_details = $this->get_driver_details($userid);
				}

				$result = array(

					"status" => true,

					"message" => "Email Updated Successfully",
					"data" => $user_details,

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
			} else {
				$result = array(

					"status" => false,

					"message" => "Email Updated failed",

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
			}
		} else {
			$result = array(

				"status" => false,

				"message" => "Email Updated failed",

				"error" => array(

					"data" => array("Old email failed"),

				),

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		}

		return $this->response->withJson($result);
	}

	public function update_password()
	{
		$userid = $this->input['userid'];

		$newpassword = $this->input['new_password'];

		$oldpassword = $this->input['old_password'];

		$userdata = array(

			'u_password' => $oldpassword,

			'u_id' => $userid,

		);

		$count = Users::where($userdata)->count();

		if ($count > 0) {
			$affected = $this->db->table('users')

				->where('u_id', $userid)

				->update([

					"u_password" => $newpassword,

				]);

			if ($affected) {
				$u_details = $this->get_user_details($userid);
				$u_type = $u_details['u_type'];
				if ($u_type == "3") {
					$user_details = $u_details;
				} else {
					$user_details = $this->get_driver_details($userid);
				}

				$result = array(

					"status" => true,

					"message" => "Password Updated Successfully",
					"data" => $user_details,

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
			} else {
				$result = array(

					"status" => false,

					"message" => "Password Updated failed",

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
			}
		} else {
			$result = array(

				"status" => false,

				"message" => "Password Updated failed",

				"error" => array(

					"data" => array("Old Password failed"),

				),

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		}

		return $this->response->withJson($result);
	}

	public function update_bank_details()
	{
		$userid = $this->input['user_id'];
		$bank_code = $this->input['bank_code'];
		$bank_name = $this->input['bank_name'];
		$account_number = $this->input['account_number'];
		$account_name = $this->input['account_name'];

		$affected = $this->db->table('bank_details')

			->where('bd_user_id', $userid)

			->update([

				"bd_bank_code" => $bank_code,
				"bd_bank_name" => $bank_name,
				"bd_account_number" => $account_number,
				"bd_account_name" => $account_name,

			]);

		if ($affected) {
			$result = array(

				"status" => true,

				"message" => "Password Updated Successfully",
				"data" => $user_details,

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		} else {
			$result = array(

				"status" => false,

				"message" => "Password Updated failed",

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		}
		return $this->response->withJson($result);
	}

	public function otp()
	{
		$OTP = randomPassword($this->env['otp_length']);

		$validator = new Validator([
			'required' => ':attribute field is required',
			'email' => ':email field is required',
			'record_exists' => ":attribute doesn't match any user record"
		]);
		$validator->addValidator('record_exists', new RecordExistsValidatorRule($this->pdo));
		$validation = $validator->make($this->input, [
			'userid' => "required|numeric|record_exists:users,u_id",
			'phone' => "required|numeric",
			'phone_country' => 'required|regex:/^\+\d+?$/'
		]);
		$validation->validate();
		if ($validation->fails()) {
			$result = array(

				"status" => false,

				"message" => "Invalid user input!",

				'errors' => $validation->errors()->toArray(),

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
			return $this->response->withJson($result);
		}


		$userid = $this->input['userid'];

		$phone = $this->input['phone'];

		$phone_country = $this->input['phone_country'];

		if ($userid != "0") {
			$userdata = array(

				'u_phone' => $phone,

				'u_phone_country' => $phone_country,

			);

			$count = Users::where($userdata)->count();

			if ($count == 0) {
				$affected = $this->db->table('users')

					->where('u_id', $userid)

					->update([

						'u_last_otp' => $OTP,

						//   'u_phone' => $phone,

						// 'u_phone_country' => $phone_country,

					]);

				try {
					$this->send_sms($phone_country . $phone, "Your Moov verification code is: " . $OTP);
				} catch (\Throwable $th) {
					//throw $th;
					$result = array(

						"status" => false,

						"message" => $th->getMessage(),

						"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

					);
					return $this->response->withJson($result);
				}

				$result = array(

					"status" => true,

					"message" => "Otp send successfully",

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
			} else {
				$result = array(

					"status" => false,

					"message" => "Phone already exist",

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
			}
		} else {
			$this->db->table('otp_mobile')->insert(

				[

					'otp_phone' => $phone, 'opt_county' => $phone_country, 'otp_code' => $OTP,

				]

				//'t_response' => $tranx->data

			);
			try {
				$this->send_sms($phone_country . $phone, "Your Moov verification code is: " . $OTP);
			} catch (\Throwable $th) {
				//throw $th;
				$result = array(

					"status" => false,

					"message" => $th->getMessage(),

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
				return $this->response->withJson($result);
			}


			$result = array(

				"status" => true,

				"message" => "Otp send successfully",

				// "error" => array(

				//     "data" => array("Old Password failed"),

				// ),

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		}

		return $this->response->withJson($result);
	}

	public function send_sms($phone, $message)
	{
		$client = new \Twilio\Rest\Client($this->env['twilio_sid'], $this->env['twilio_token']);

		$message = $client->messages->create(

			$phone, // Text this number

			array(

				'from' => get_env('twilio_number'), // From a valid Twilio number

				'body' => $message,

			)

		);

		return $message->sid;
	}

	public function update_phone_with_otp()
	{

		$validator = new Validator([
			'required' => ':attribute field is required',
			'email' => ':email field is required',
			'record_exists' => ":attribute doesn't match any user record"
		]);
		$validator->addValidator('record_exists', new RecordExistsValidatorRule($this->pdo));
		$validation = $validator->make($this->input, [
			'userid' => "required|numeric|record_exists:users,u_id",
			'phone' => "required|numeric",
			'phone_country' => 'required|regex:/^\+\d+?$/',
			'otp' => 'required'
		]);
		$validation->validate();
		if ($validation->fails()) {
			$result = array(

				"status" => false,

				"message" => "User input validation error!",

				'errors' => $validation->errors()->toArray(),

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
			return $this->response->withJson($result);
		}

		$userid = $this->input['userid'];

		$phone = $this->input['phone'];

		$phone_country = $this->input['phone_country'];

		$otp = $this->input['otp'];

		$userdata = array(

			'u_last_otp' => $otp,

			'u_id' => $userid,

		);

		// get_driver_details


		$count = Users::where($userdata)->count();

		if ($count > 0) {
			$affected = $this->db->table('users')

				->where('u_id', $userid)

				->update([

					"u_phone" => $phone,

					"u_phone_country" => $phone_country,

				]);
			$u_details = $this->get_user_details($userid);
			$u_type = $u_details['u_type'];
			if ($u_type == "3") {
				$user_details = $u_details;
			} else {
				$user_details = $this->get_driver_details($userid);
			}

			if ($affected) {
				$result = array(

					"status" => true,

					"message" => "Phone number Updated Successfully",
					"data" => $user_details,

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
			} else {
				$result = array(

					"status" => false,

					"message" => "Failed to update phone number",

					"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

				);
			}
		} else {
			$result = array(

				"status" => false,

				"message" => "OTP confirmation failed",

				"error" => array(

					"data" => array("otp confirmation failed"),

				),

				"links" => array("self" => $this->uri->getBaseUrl() . "" . $this->uri->getBasePath() . "/" . $this->uri->getPath()),

			);
		}

		return $this->response->withJson($result);
	}

	//////No NEED ,only FOr iOS /////////////

	public function get_driver_details($userid)
	{

		// $userid = $args['id'];

		$users = $this->db->table('users')

			->leftJoin('driver_details', 'driver_details.dd_driver_id', '=', 'users.u_id')

			->leftJoin('edu_institution', 'edu_institution.ei_id', '=', 'users.u_edu_institution')

			->leftJoin('wallet', 'wallet.w_user_id', '=', 'users.u_id')

			->where('users.u_id', '=', $userid)

			->first();

		$ratings = $this->db->table('driver_ratings')

			->where('dr_driver_id', $userid)

			->avg('dr_rating_score');

		$details = array(

			"first_name" => $users->u_first_name,

			"last_name" => $users->u_last_name,

			"email" => $users->u_email,

			"institution_id" => $users->u_edu_institution,

			"institution_name" => $users->ei_name,

			"phone" => $users->u_phone,

			"phone_country" => $users->u_phone_country,

			"gender" => $users->u_gender,

			"vehicle_no" => $users->dd_car_number,

			"verified" => $users->dd_admin_approved,

			"car_model" => $users->dd_car_model_id,

			"car_capacity" => $users->dd_car_capacity,

			"license_no" => $users->dd_license,

			"license_expiry" => $users->dd_expiery_date,

			"dob" => $users->dd_birth_day,

			"ratings" => round($ratings, 2),

			"wallet_balance" => $users->w_amount,

			"image" => $users->u_image,

		);

		$dd_array = array_map(function ($val) {
			return is_null($val) ? "" : $val;
		}, $details);

		return $dd_array;
	}

	public function get_user_details($userid)
	{

		$users = $this->db->table('users')

			->leftJoin('edu_institution', 'edu_institution.ei_id', '=', 'users.u_edu_institution')

			->leftJoin('wallet', 'wallet.w_user_id', '=', 'users.u_id')

			->where('users.u_id', '=', $userid)

			->first();

		$details = array(

			"first_name" => $users->u_first_name,

			"last_name" => $users->u_last_name,

			"email" => $users->u_email,

			"institution_id" => $users->u_edu_institution,

			"institution_name" => $users->ei_name,

			"phone" => $users->u_phone,

			"phone_country" => $users->u_phone_country,

			"gender" => $users->u_gender,

			"wallet_balance" => $users->w_amount,

			"image" => $users->u_image,
			"u_type" => $users->u_type,

		);

		return $details;
	}

	///////No need only for Ios//////////
}
