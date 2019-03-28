<?php
namespace src\app\Helpers;

use Monolog\Logger;
use Monolog\Handler\AbstractProcessingHandler;
use src\app\Models\Log;


class DbLoggerHandler extends AbstractProcessingHandler
{
    public function __construct($level = Logger::DEBUG, bool $bubble = true)
    {
        parent::__construct($level, $bubble);
    }
    protected function write(array $record): void
    {
        $logType=$record['level_name'];
        $message=$record['message'];
        $context=$record['context'];
        $userAgent=$_SERVER['HTTP_USER_AGENT'];
        Log::create([
            'type'=> $logType ,
            'message'=> $message ,
            'context'=> json_encode($context,JSON_PRETTY_PRINT|JSON_OBJECT_AS_ARRAY ) ,
            'user_agent'=>  $userAgent 
        ]);
     }
}
