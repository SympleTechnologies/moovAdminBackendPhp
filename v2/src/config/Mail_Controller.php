<?php
namespace src\config;

use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use src\config\Api_Controller;

class Mail_Controller extends Api_Controller
{
	private $sender_email;
	private $sender_email_password;

	public function __construct()
	{

		/*   $this->sender_email          =
			        $this->sender_email_password = 'jijinsics123';
			        $this->sender_host           = 'smtp.gmail.com';
			        $this->sender_port           = '587';
		*/
		parent::__construct();
	}
	public function send_mail($details = array())
	{
		if (get_env('MAIL_PRETEND')) {
			return $this->pretendToSendMail($details);
		} else {
			return $this->sendMailWithMailer($details);
		}
	}
	public function pretendToSendMail($details = array())
	{
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
	public function sendMailWithMailer($details = array())
	{
		try {
			$sendgrid = new \SendGrid(get_env('SENDGRID_API_KEY'));
			$email    = new \SendGrid\Mail\Mail();
			$email->addTo($details['to']);
			$email->setFrom(get_env('MAIL_USERNAME'));
			$email->setSubject($details['subject']);
			$htmlMsg = $this->app->view->fetch($details['view_page'], $details['view_data']);
			$text=preg_replace('~[\r\n]+~', '\r\n', $htmlMsg);
			$email->addContent('text/html', $htmlMsg);
			$email->addContent('text/plain', $text);
			$response = ($sendgrid->send($email));
			if (get_env('MAIL_DEBUG', 0) > 0){
				echo "Sendgrid status code: ".$response->statusCode();
				echo "Sendgrid body: ".$response->body();
			}
				
			return $response->statusCode() > 200;
		} catch (Exception $e) {
			// echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
			return false;
		}
	}
}
 