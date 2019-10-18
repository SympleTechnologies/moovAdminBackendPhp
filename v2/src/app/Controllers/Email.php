<?php
namespace src\app\Controllers;

use src\app\Models\School;
use src\app\Models\SupportMessage;
use src\app\Models\User;
use src\config\Api_Controller;
use src\config\Mail_Controller;

class Email extends Api_Controller {
	public function __construct($app) {
		parent::__construct();
		$this->email = new Mail_Controller();

	}

	public function support_email() {

		$userid = @$this->input['userid'];
		$schoolID = @$this->input['school_id'];
		$subject = $this->input['subject'];
		$from = $this->input['from'];
		$message = $this->input['message'];

		//$useremail = $user['u_email'];
		$messageType = @$this->input['message_type'] ? $this->input['message_type'] : 'user';
		$basePath = ""; //rtrim(str_ireplace('index.php', '', $app->getContainer()->get('request')->getUri()->getBasePath()), '/');
		//"jijin.sics@gmail.com";
		//support@themoovapp.com
		if ($messageType == 'school') {
			$user = School::generateUserFromSchoolID($schoolID);
			if (empty($from)) {
				$from = $user->u_first_name . " " . $user->u_last_name;
			}
		} else {
			$user = User::find($userid);
		}
		$maildata = array(
			"to" => 'israelalagbe53@gmail.com',
			'subject' => $from . ' - ' . $subject,
			'view_page' => 'emails/support_email.html',
			'view_data' => array(
				'user' => $user,
				//'email' => $useremail,
				'message' => $message,
				'basePath' => $basePath,
			),
		);
		

		if ($this->email->send_mail($maildata)) {
			SupportMessage::create(
				[
					'subject' => $subject,
					'message' => $message,
					'user_id' => $userid,
					'school_id' => $schoolID,
					'message_type' => $messageType,
				]
			);
			$output = array(
				"status" => true,
				"message" => "Message sent successfully",
			);

		} else {
			$output = array(
				"status" => false,
				"message" => "An error occured while sending the email",
			);

		}
		return $this->response->withJson($output);

	}
}
