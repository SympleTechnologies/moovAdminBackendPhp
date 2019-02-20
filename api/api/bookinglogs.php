<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Rides log</title>
    <link rel="stylesheet" href="https://bootswatch.com/4/lumen/bootstrap.min.css">
</head>
<body>
<?php

$myfile = fopen("logs/2018/08/" . date("d-m-Y") . ".log", "r") or die("No testings done today! " . date("d-m-Y"));
echo fread($myfile, filesize("logs/2018/08/" . date("d-m-Y") . ".log"));
fclose($myfile);

?>
</body>
</html>
