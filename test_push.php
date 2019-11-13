<?php
require_once "push_alert.php";

echo AndroidPush_rider('REDACTED_DEVICE_TOKEN', [
    'title' => "jjjj",
    'message' => "jjjj",
    'trip_id' => "7",
    'ride_id' => "7",

]);
echo "Pushed";
