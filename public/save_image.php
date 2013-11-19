<?php
header('Access-Control-Allow-Origin: *');   //these headers allow cross-domain communication (e.g. a localhost can communicate with the ntnu server)
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$con = new mysqli("localhost", "root", "", "moviesharedb");
if (mysqli_connect_errno()) {
    die(mysqli_connect_error());
}

$data = file_get_contents("php://input");
$imageData = json_decode($data)->imageData;
//$imageData = str_replace(' ','+',$imageData);
$decoded = base64_decode($imageData);
//$imageData = 'data:image/jpeg;base64,'.$imageData;
file_put_contents('images/saved.jpg',$decoded);




echo($imageData);

$statement->close();

$con->close();
?>