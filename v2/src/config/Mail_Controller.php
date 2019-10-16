<?php
namespace src\config;

use PHPMailer\PHPMailer\Exception;
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
		if (toBoolean(get_env('MAIL_PRETEND'))) {
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
			$transport = (new \Swift_SmtpTransport(get_env('MAIL_HOST'), get_env('MAIL_PORT')))
  				->setUsername(get_env('MAIL_USERNAME'))
  				->setPassword(get_env('MAIL_PASSWORD'))
				->setEncryption(get_env('MAIL_ENCRYPTION'));
			$mailer = new \Swift_Mailer($transport);

			$htmlMsg = $this->app->view->fetch($details['view_page'], $details['view_data']);
			$text=preg_replace('~[\r\n]+~', '\r\n', strip_tags($htmlMsg));
			// Create a message
			$message = (new \Swift_Message($details['subject']))
				->setFrom([get_env('MAIL_FROM') => 'MOOV ADMIN'])
				->setTo([$details['to']])
				->setBody($text)
				->addPart($htmlMsg, 'text/html')
				;
			return $mailer->send($message);
		} catch (\Swift_TransportException $e) {
			// echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
			if (\int(get_env('MAIL_DEBUG', 0)) > 0){
				echo "Swift_TransportException: ".$e->getMessage();
			}
			return false;
		}
		catch (\Exception $e) {
			// echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
			if (\int(get_env('MAIL_DEBUG', 0)) > 0){
				echo "Exception: ".$e->getMessage();
			}
			return false;
		}
	}
}
 