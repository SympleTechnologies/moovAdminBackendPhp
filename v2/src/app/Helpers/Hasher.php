<?php
namespace src\app\Helpers;

class Hasher{
    public static function hash($password){
        $options = [
            'salt' => get_env('HASH_SALT'), //write your own code to generate a suitable salt
            'cost' => get_env('HASH_COST',12) // the default cost is 10
        ];
        return  password_hash($password, PASSWORD_BCRYPT , $options);
    }
    public static function check($plainPassword,$hashedPassword){
        return password_verify($plainPassword, $hashedPassword);
    }
}