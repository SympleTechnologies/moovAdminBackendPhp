<?php

function iOSPush($token, $message) {

	$url = "https://fcm.googleapis.com/fcm/send";

	$serverApiKey = "AIzaSyD2g3p8L7YBDFtJxCzehtDia4i_e_Tt47U"; //"Your Api key"

	$headers = array(

		'Content-Type:application/json',

		'Authorization:key=' . $serverApiKey,

	);
	//print_r($data);

	$notification = [
		'title' => $message['title'],
		'text' => $message['message'],
		'sound' => 'default',
		//'badge' => '1',
	];
	$arrayToSend = [
		"mutable_content" => true,
		'data' => [
			'ride_id' => $message['ride_id'],
			'trip_id' => $message['trip_id'],
		],
		'to' => $token,
		'notification' => $notification,
		'priority' => 'high',
	];
	$json = json_encode($arrayToSend);
	$headers = array();
	$headers[] = 'Content-Type: application/json';
	$headers[] = 'Authorization: key=' . $serverApiKey;
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);

	curl_setopt($ch, CURLOPT_CUSTOMREQUEST,

		"POST");
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
//Send the request
	//ob_start();
	curl_exec($ch);
	//ob_get_clean();
//Close request
	/*if ($response === FALSE) {
	die('FCM Send Error: ' . curl_error($ch));
}*/
	curl_close($ch);

}

function AndroidPush($deviceToken = '', $message = array()) {

	$url = 'https://android.googleapis.com/gcm/send';

	$serverApiKey = "AAAAYVJu5s0:APA91bEPVQe8D5lhjulHl8xrMJuNUdf0mLa4z35gQDpsh9i-7KbFAZcaGEFQ6LDgm4EANpymAhVW3jAoU56BSLVJ2awG1GszMoDnF93LPkX53s8WwG18oNOdQOaNAzZvlbqn3Vg6Zwjt"; //"Your Api key"

	$headers = array(

		'Content-Type:application/json',

		'Authorization:key=' . $serverApiKey,

	);

	//$post=array("result"=>true,"user_id"=>$id,"name=>$name");

	$data = array(

		'registration_ids' => array($deviceToken),

		'data' => array(

			'type' => 'New',

			'ride_id' => $message['ride_id'],

			'trip_id' => $message['trip_id'],

			'title' => $message['title'],

			'msg' => $message['message'],

		),

	);

	//print_r($data);

	$ch = curl_init();

	curl_setopt($ch, CURLOPT_URL, $url);

	if ($headers) {

		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

	}

	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

	curl_setopt($ch, CURLOPT_POST, true);

	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

	$response = curl_exec($ch);

	curl_close($ch);

}

function iOSPush_rider($token, $message) {
	$url = "https://fcm.googleapis.com/fcm/send";

	$serverApiKey = "AIzaSyD2g3p8L7YBDFtJxCzehtDia4i_e_Tt47U"; //"Your Api key"

	$headers = array(

		'Content-Type:application/json',

		'Authorization:key=' . $serverApiKey,

	);
	//print_r($data);

	$notification = [
		'title' => $message['title'],
		'text' => $message['message'],
		'sound' => 'default',
		//'badge' => '1',
	];
	$arrayToSend = [
		"mutable_content" => true,
		'data' => [
			'ride_id' => $message['ride_id'],
			'trip_id' => $message['trip_id'],
		],
		'to' => $token,
		'notification' => $notification,
		'priority' => 'high',
	];
	$json = json_encode($arrayToSend);
	$headers = array();
	$headers[] = 'Content-Type: application/json';
	$headers[] = 'Authorization: key=' . $serverApiKey;
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);

	curl_setopt($ch, CURLOPT_CUSTOMREQUEST,

		"POST");
	curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
//Send the request
	$response = curl_exec($ch);
//Close request
	/*if ($response === FALSE) {
	die('FCM Send Error: ' . curl_error($ch));
}*/
	curl_close($ch);

}

function AndroidPush_rider($deviceToken = '', $message = array()) {

	$url = 'https://android.googleapis.com/gcm/send';

	$serverApiKey = "AAAAYVJu5s0:APA91bEPVQe8D5lhjulHl8xrMJuNUdf0mLa4z35gQDpsh9i-7KbFAZcaGEFQ6LDgm4EANpymAhVW3jAoU56BSLVJ2awG1GszMoDnF93LPkX53s8WwG18oNOdQOaNAzZvlbqn3Vg6Zwjt"; //"Your Api key"

	$headers = array(

		'Content-Type:application/json',

		'Authorization:key=' . $serverApiKey,

	);

	//$post=array("result"=>true,"user_id"=>$id,"name=>$name");

	$data = array(

		'registration_ids' => array($deviceToken),

		'data' => array(

			'type' => 'New',

			'ride_id' => $message['ride_id'],

			'trip_id' => $message['trip_id'],

			'title' => $message['title'],

			'msg' => $message['message'],

		),

	);

	//print_r($data);

	$ch = curl_init();

	curl_setopt($ch, CURLOPT_URL, $url);

	if ($headers) {

		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

	}

	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

	curl_setopt($ch, CURLOPT_POST, true);

	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

	$response = curl_exec($ch);

	curl_close($ch);

}