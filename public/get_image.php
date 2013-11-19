<?php
header('Access-Control-Allow-Origin: *');   //these headers allow cross-domain communication (e.g. a localhost can communicate with the ntnu server)
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$con = new mysqli("localhost", "root", "", "moviesharedb");
if (mysqli_connect_errno()) {
    die(mysqli_connect_error());
}

$data = file_get_contents("php://input");
$username = json_decode($data)->username;

$statement = $con->prepare(
	"SELECT image_link FROM point_of_interests where username = ?"
);

$statement->bind_param("s",$username);

$statement->execute();
//$statement->store_result();
$statement->bind_result($value); 
$statement->fetch();

echo($value);

$statement->close();

$con->close();
?>