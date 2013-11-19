<?php
header('Access-Control-Allow-Origin: *');   //these headers allow cross-domain communication (e.g. a localhost can communicate with the ntnu server)
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$con = new mysqli("localhost", "root", "", "moviesharedb");
if (mysqli_connect_errno()) {
    die(mysqli_connect_error());
}

$data = file_get_contents("php://input");
$username = json_decode($data)->username;
$password = json_decode($data)->password;
$Blowfish_Pre = '$2a$12$';
$Blowfish_End = '$';

$statement = $con->prepare(
	"SELECT salt, password FROM users where username = ?"
);

$statement->bind_param("s",$username);

$statement->execute();
//$statement->store_result();
$statement->bind_result($value1, $value2); 
$statement->fetch();

$hashed_pass = crypt($password, $Blowfish_Pre . $value1 . $Blowfish_End);
if ($hashed_pass == $value2) {
  echo true;
} else {
  echo 'There was a problem with your user name or password.';
}

//echo($value1);

$statement->close();

$con->close();
?>