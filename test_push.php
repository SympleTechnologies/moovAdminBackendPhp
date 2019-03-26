<?php

//require_once "push_alert.php";

// iOSPush('dRWpQ0kVWrQ:APA91bHN12VGCnv8MLF-UmXcWmSp3r5-24csa98sQSLDDqYIKwgbxZ-5LN8JFQOMMwrufcJiLDT99MJeqfWnT1JVLoLo16BMY4HUYI9VgGzeF1AAGRTRStcqqSZHiIxNYLElnKmuRKoM',[
//     'title'=>"jjjj",
//     'body'=>"jjjj",
//     'trip_id'=>"7",
//     'ride_id'=>"7",

// ]);

 /* require('vendor/autoload.php');

use Rakit\Validation\Validator;

$validator = new Validator;
$validation = $validator->make([
    'name'=>"Israel Alagbe",
    'age'=>18,
    'father'=>['age'=>40],
    'email'=>'isra@jjd.com'
], [
    'name'=>'required',
    'age'=>'required|numeric|min:18',
    'father.age'=>'required|min:18',
    'email'=>'email'
]);
$validation->validate();
if ($validation->fails()) {
    // handling errors
    $errors = $validation->errors();
    echo "<pre>";
    print_r($errors->all()[0]);
    echo "</pre>";
    exit;
} else {
    // validation passes
    echo "Success!";
} */



require 'vendor/autoload.php';
$sendgrid = new \SendGrid("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");
$email    = new \SendGrid\Mail\Mail();
$email->addTo("israelalagbe53@gmail.com");
$email->addTo("israelalagbe@hotmail.com");
$email->setFrom("support@themoovapp.com");
$email->setSubject("Sending with SendGrid is Fun");
$email->addContent('text/plain',"Hello world");
$email->addContent('text/html',"<h1>Hello world</h1>");
/* $email->setHtml("and easy to do anywhere, even with PHP"); */

$response = ($sendgrid->send($email));
echo $response->statusCode()>200;
echo $response->body();


//var_dump(\GeometryLibrary\PolyUtil::decode("e}fg@ixjSM@C?C?A?A?AAAAA?ACAA?ECEAOAMGeA??Eq@E}@A[?W??AMy@G]@YBWB]FoBJ??Cg@C_@C[Io@EQEQCMIUM]Uc@Yc@yA_C??BE@ABC@A?C@A@C?C@A?CACAE?CACAECCACACAAC?AAA?A?A?C?A?A?A?GKEGEIa@w@Ua@MSMSc@i@e@k@c@a@g@_@y@g@q@YQGYKSG_AUGAwAc@c@MeA[e@O[I]IOESESIeA]c@M_@OYKi@YWQm@a@USMI}@w@{AwAsAuAGEcF}EIGGGmBqBoB{Bq@u@k@aA??@A?A@A?A?A@A?A@A?K?CACAE?CCCACCAIIUE{@y@]]aA}Bo@sAeAmB}@qA}@gAe@e@kAq@]Uc@Yc@Wo@[_@QgJkEwAy@gAo@YSQM_Au@qAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN"));