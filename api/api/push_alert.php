<?php

function iOSPush($deviceToken, $message)

{



    // Put your device token here (without spaces):

    $deviceToken = $deviceToken;

    //echo $deviceToken."<br>";

    // Put your private key's passphrase here:

    $passphrase = 'sics';

    // Put your alert message here:

    $message = $message;

    ////////////////////////////////////////////////////////////////////////////////

    $ctx = stream_context_create();

    stream_context_set_option($ctx, 'ssl', 'local_cert', '../c_driver.pem');

    stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

    $fp = stream_socket_client(

        //'ssl://gateway.sandbox.push.apple.com:2195', $err,

        // 'ssl://gateway.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);
       'ssl://gateway.sandbox.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);

    if (!$fp) {

        exit("Failed to connect: $err $errstr" . PHP_EOL);

    }



    $body['aps'] =$message;



    //print_r($body);

    $payload = json_encode($body);

    $msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;

    $result = fwrite($fp, $msg, strlen($msg));

    // if (!$result){    

    // echo 'Message not delivered'.PHP_EOL;
    // }
       

    // else{

    //      echo 'Message successfully delivered' . PHP_EOL;
    //      print_r($result);
    // }
    

    fclose($fp);







}

function AndroidPush($deviceToken = '', $message = array())

{

    $url = 'https://android.googleapis.com/gcm/send';

    $serverApiKey = "AIzaSyDYYCSgr2xxzo_gTf17MaJUEspsLELnTJk"; //"Your Api key"

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





function iOSPush_rider($deviceToken, $message)

{



    // Put your device token here (without spaces):

    $deviceToken = $deviceToken;

    //echo $deviceToken."<br>";

    // Put your private key's passphrase here:

    $passphrase = 'sics';

    // Put your alert message here:

    $message = $message;



    $ctx = stream_context_create();

    stream_context_set_option($ctx, 'ssl', 'local_cert', '../c_user.pem');

    stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

    $fp = stream_socket_client(

        //'ssl://gateway.sandbox.push.apple.com:2195', $err,
        //ssl: //gateway.push.apple.com:2195


         'ssl://gateway.sandbox.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);

    if (!$fp) {

        exit("Failed to connect: $err $errstr" . PHP_EOL);

    }



    $body['aps'] =  $message;

    //print_r($body);

    $payload = json_encode($body);

    $msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;

    $result = fwrite($fp, $msg, strlen($msg));

  

    fclose($fp);


//  if (!$result){    

//     echo 'Message not delivered'.PHP_EOL;
//     }
       

//     else{

//          echo 'Message successfully delivered' . PHP_EOL;
//          print_r($result);
//     }



}





function AndroidPush_rider($deviceToken = '', $message = array())

{

    $url = 'https://android.googleapis.com/gcm/send';

    $serverApiKey = "AIzaSyDYYCSgr2xxzo_gTf17MaJUEspsLELnTJk"; //"Your Api key"

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