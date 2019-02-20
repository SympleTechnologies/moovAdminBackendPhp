<?php
namespace src\config;

use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use src\config\Api_Controller;

require_once 'env.php';

class Mail_Controller extends Api_Controller {
	private $sender_email;
	private $sender_email_password;

	public function __construct() {

		/*   $this->sender_email          =
			        $this->sender_email_password = 'jijinsics123';
			        $this->sender_host           = 'smtp.gmail.com';
			        $this->sender_port           = '587';
		*/
		parent::__construct();

	}
	public function send_mail($details = array()) {
		if (get_env('MAIL_PRETEND')) {
			return $this->pretendToSendMail($details);
		} else {
			return $this->sendMailWithMailer($details);
		}
	}
	public function pretendToSendMail($details = array()) {
		$subject = $details['subject'];
		$to = $details['to'];
		$message = $this->app->view->fetch($details['view_page'], $details['view_data']);

		$logMessage = "
			<h5>From: {get_env('MAIL_USERNAME')} MOOV ADMIN </h5>
			<h5>To Address: {$to}</h5>
			<h2>Subject: {$subject}</h2>
			Body<br>
			{$message}
		";
		$this->logger->info($logMessage);
		return true;
	}
	public function sendMailWithMailer($details = array()) {
		$mail = new PHPMailer(true);
		try {
			$mail->SMTPDebug = 0;
			$mail->isSMTP();
			$mail->Host = get_env('MAIL_HOST');
			$mail->SMTPAuth = true;
			$mail->Username = get_env('MAIL_USERNAME');
			$mail->Password = get_env('MAIL_PASSWORD');
			$mail->SMTPSecure = get_env('MAIL_ENCRYPTION');
			$mail->Port = get_env('MAIL_PORT');
			$mail->setFrom(get_env('MAIL_USERNAME'), "MOOV ADMIN");
			$mail->addAddress($details['to']);
			// $mail->addReplyTo($this->sender_email, 'Information');
			$mail->isHTML(true);
			$mail->Subject = $details['subject'];
			$htmlMsg = $this->app->view->fetch($details['view_page'], $details['view_data']);
			$mail->Body = $htmlMsg;
			$mail->AltBody = $mail->html2text($htmlMsg);
			return $mail->send();
		} catch (Exception $e) {
			// echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
			return FALSE;
		}
	}

}
?>