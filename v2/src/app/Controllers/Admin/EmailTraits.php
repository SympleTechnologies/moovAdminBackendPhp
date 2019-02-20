<?php
namespace src\app\Controllers\Admin;
use src\config\Mail_Controller;

trait EmailTraits {

	public function sendPasswordEmail($fname, $email, $password) {
		$to = $email;
		$subject = "Password Reset on The Moov App";
		$message = "Hello {$fname}, \n\n You Password on The Moov App has been successfully reset." .
			"Your new password is: {$password}" .
			"You can now log in with this password on the app. \n\n Regards\n\n The Moov Team";
		$headers = array(
			'From' => 'support@themoovapp.com',
			'X-Mailer' => 'THE_MOOV_APP',
		);

		mail($to, $subject, $message, $headers);
	}

	public function sendSupportEmail($req, $res, $args) {
		if (!$this->validateToken($req, $res) || (!$this->isSuperAdmin() && !$this->isAdmin())) {
			return $this->invalidSession($res);
		}
		$emailController = new Mail_Controller();

		$v = $this->validateRequired(array("subject", 'message', 'recipient_email_addresses', 'recipient_name'), $this->input);

		if ($v !== true) {
			return $res->getBody()->write(json_encode([
				'status' => 403, 'message' => $v,
			]));
		}
		$recipient_name = $this->input['recipient_name'];
		$recipient_email_addresses = $this->input['recipient_email_addresses'];
		$subject = $this->input['subject'];
		$message = $this->input['message'];
		/*$userids = $this->input['userids'];*/
		//$users = User::find(explode(",", $userids));
		$emails = [];
		foreach (explode(",", $recipient_email_addresses) as $email) {
			if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$emails[] = $email;
			}
		}

		$to = implode(", ", $emails);

		$basePath = "";

		$maildata = array(
			"to" => $to,
			'subject' => $subject,
			'view_page' => 'emails/user_reply_email.html',
			'view_data' => array(
				'recipient_name' => $recipient_name,
				//'email' => $useremail,
				'message' => $message,
				'basePath' => $basePath,
			),
		);

		if ($emailController->send_mail($maildata)) {
			$output = array(
				"status" => 200,
				"message" => "Message Has been successfully sent",
			);

		} else {
			$output = array(
				"status" => 500,
				"message" => "An error occured while sending the email",
			);

		}
		/*$headers = array(
				'From' => 'hello@themoovapp.com',
				'X-Mailer' => 'THE_MOOV_APP',
			);

		*/

		return $res->getBody()->write(\json_encode($output));
	}
}

?>