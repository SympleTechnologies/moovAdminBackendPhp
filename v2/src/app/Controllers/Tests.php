<?php



namespace src\app\Controllers;



use src\config\Api_Controller;

use src\app\Models\CarModel;

class Tests extends Api_Controller

{



    public function test()

    {
        \set_time_limit(0);
        $jsonFile = file_get_contents('http://localhost/moov/scripts/image_data.json');
        $json = json_decode($jsonFile, true);
        $carModels = [];
        $count = 0;

        foreach ($json as $value) {
            $fromFilePath = 'C:\xampp\htdocs\moov\scripts\carimagery-filtered\\' . $value['image'];
            $count++;
            if ($count > 120) {
                $url = \Cloudinary\Uploader::upload(
                    $fromFilePath,
                    [
                        "use_filename" => true,
                        "folder" => 'public/cars/',
                        "overwrite" => true,
                        "resource_type" => "image"
                    ]
                )['secure_url'];
                if (@ob_get_contents()) {
                    @ob_end_flush();
                }
                flush();
                
                print("Finished uploading: {$count}<br>");
            }
            /* array_push($carModels,[
                'cm_make_name'=>$value['make'],
                'cm_model_name'=>$value['model'],
                'cm_model_image'=>"https://res.cloudinary.com/moov-api/image/upload/v1552487609/public/cars/".$value['image'],
                'cm_year_start'=>$value['year_start'],
                'cm_year_end'=>$value['year_end']
            ]); */
        }
        // CarModel::insert($carModels);
        echo "Done!";
        die();


        /*



        $dir = $this->app->get('profile_pic_upload');



        $filename=randomPassword(10);



        $url = "https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-1/c27.23.160.160/p200x200/20106773_1250898238354329_1823918663698107706_n.jpg?_nc_cat=0&oh=51edc1f9fda6394331f2223f5a66f273&oe=5BCA878A";



        $data = file_get_contents($url);



        $fp = fopen($dir."".$filename.".jpg", "wb");



        if (!$fp) {



        exit;



        }



        fwrite($fp, $data);



        fclose($fp);



        return $filename;



         */



        // $this->send_sms('+919020785587',"test works");



        $deviceToken = "e79kyXI-p5o:APA91bHLxLGyfMiiAQY7hSMG3JW6U-vGatIA-6M6_mEPrBeLSUQFG9o6oe9Q6bu1Utt8w0-dKHw1v0yhQad521ODz7hDWth6cDR3gpwCF0RGe-o-xaZ1e8BJs32tgNqHmR_54rmsB9YryM5DUUadDq6xQhZs_shL0A";



        $message = array(



            "ride_id" => 116,



            "trip_id" => 116,



            "title" => "New booking",



            "message" => "A new ride has been booked on to your trip",



        );



        AndroidPush($deviceToken, $message);



        // $pdo = new \Slim\PDO\Database(DB_DSN, DB_USER, DB_PASSWORD);



        /*



    $stmt = $this->pdo->query("SELECT * FROM users");



    $user = $stmt->fetch();



    print_r($user); */
    }



    public function send_sms($phone, $message)

    {



        $client = new \Twilio\Rest\Client($this->env['twilio_sid'], $this->env['twilio_token']);



        $message = $client->messages->create(



            $phone, // Text this number



            array(



                'from' => '+17742955804', // From a valid Twilio number



                'body' => $message,



            )



        );



        echo $message->sid;
    }



    public function testios()

    {



        $deviceToken = $this->input['token'];

        $message = array(

            "ride_id" => 116,

            "trip_id" => 116,

            "title" => "New booking",

            "message" => "A new ride has been booked on to your trip",

            'alert' => "A new ride has been booked on to your trip",

            'sound' => 'default',



        );



        iOSPush_rider($deviceToken, $message);

        // AndroidPush_rider($deviceToken, $message);
    }



    public function log()

    {





        print_r($parsedBody);
    }


    public function geotest()
    {


        // $Geocoder->setApiKey('AIzaSyB6aH2GUchtBI9Pfu6BA8eRTNvvEFCx5r0');
        $response =  \GeometryLibrary\PolyUtil::distanceToLine(
            ['lat' => 61.387002, 'lng' => 23.890636], // point array [lat, lng]
            ['lat' => 61.487002, 'lng' => 23.790636], // line startpoint array [lat, lng]
            ['lat' => 60.48047, 'lng' => 22.052754] // line endpoint array [lat, lng]
        );

        echo $response; // 12325.124046196 in meters
    }
}
