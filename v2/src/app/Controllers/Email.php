<?php
namespace src\app\Controllers;

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

		$userid = $this->input['userid'];
		$subject = $this->input['subject'];
		$from = $this->input['from'];
		$message = $this->input['message'];
		$user = User::find($userid);
		$useremail = $user['u_email'];
		$basePath = ""; //rtrim(str_ireplace('index.php', '', $app->getContainer()->get('request')->getUri()->getBasePath()), '/');
		//"jijin.sics@gmail.com";
		//support@themoovapp.com

		$maildata = array(
			"to" => 'israelalagbe53@gmail.com',
			'subject' => $from . ' - ' . $subject,
			'view_page' => 'emails/support_email.html',
			'view_data' => array(
				'user' => $user,
				'email' => $useremail,
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
				]
			);
			$output = array(
				"status" => true,
				"message" => "Support sent successfully",
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
