<?php


 function mail_sample() {
        
        $mail=new Mail_Controller();

        $maildata=array(
            "to"=>'jijin.sics@gmail.com',
            'subject'=>'Test mail',
            'view_page'=>'emails/reg_success.html',
            'view_data'=>array(
                'name'=>'test name'
            )
        );
        
        if($mail->send_mail($maildata)){
            echo "Success";
        }else{
            echo "failed";
        }

       
    }

      function log(){
        $this->logger->Warning('Warning test', ['b' => 'test']);
        $this->logger->Notice('Notice test', ['b' => 'test']);
        $this->logger->Info('Info test', ['b' => 'test']);
        $this->logger->Debug('Debug test', ['b' => 'test']);
        $this->logger->Critical('Critical test', ['b' => 'test']);
        $this->logger->Alert('Alert test', ['b' => 'test']);
        $this->logger->Emergency('Emergeny test', ['b' => 'test']);

    }
    

    function api(){
         $result=array(
            "status"=>TRUE,
            "data"=>array("user_details"=>$users[0]), //all data required to show 
            "message"=>"login success", //to show in user area
            "links"=>array("self"=> $this->uri->getBaseUrl()."".$this->uri->getBasePath()."/".$this->uri->getPath()),
            
            // "errors"=>array("message"=>""),
            //"meta"=>array("code" => 200,"message"=> "success")
            // "pagination"=>array("next_url"=> "......","next_max_id" => "...")

        );
    
    }

    function joints(){
        $articles = $this->db->table('users')
    ->select("*")
    ->join('users_category', 'users_category.user_id', '=', 'users.id')->get();
// ->join('users', 'articles.user_id', '=', 'user.id')

return $this->response->withJson($articles);

    }

     function test()
    {
        $message = "Hello";
        $key = "Jijin";
        echo hmac_sign($message, $key);
    }
     function test2()
    {
        //     $bundle=$this->input['b'];
        //     $key="Jijin";
        //    echo  hmac_verify($bundle, $key);

        $array = "Jijin,25";
// $encrypted  = my_simple_crypt(serialize($array), 'e' );

// echo "enc  ".$encrypted."<br/>";

// $decrypted = my_simple_crypt( $encrypted, 'd' );
        // // echo "enc  ".unserialize($decrypted)."<br/>";
        // print_r(unserialize($decrypted));

        $ncrypt = new Ncrypt();

        $ncrypt->set_secret_key('abd'); // optional, but STRONGLY recommended
        $ncrypt->set_secret_iv('efgh'); // optional, but STRONGLY recommended
        $ncrypt->set_cipher('AES-256-CBC'); // optional
        // encrypt a plain text/string
        $encrypted = $ncrypt->encrypt(serialize($array)); // output: SFpQVWk0WjFxdW5lSGFXaUdWUEx3Zz09
        // decrypt an encrypted string to it's original plain text/string
        $decrypted = $ncrypt->decrypt('YnlwQ2xQUFdudXV0YTdkRGFOVHNGZz09'); // output: Hello World!
        echo $encrypted . "<br>" . $decrypted;

        echo ($decrypted);
        print_r(explode(",", unserialize($decrypted)));
    }


    

    
    

?>