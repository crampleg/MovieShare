<?php
header('Access-Control-Allow-Origin: *');   //these headers allow cross-domain communication (e.g. a localhost can communicate with the ntnu server)
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

$con = new mysqli("localhost", "root", "", "moviesharedb");
if (mysqli_connect_errno()) {
    die(mysqli_connect_error());
}
CRYPT_BLOWFISH or die ('No Blowfish found.');

$data = file_get_contents("php://input");
$username = json_decode($data)->username;
$password = json_decode($data)->password;

$Blowfish_Pre = '$2a$12$';  //the cost is 12
$Blowfish_End = '$';
$Allowed_Chars =
'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789./';
$Chars_Len = 63;
$Salt_Length = 21;
$salt = "";
for($i=0; $i<$Salt_Length; $i++)
{
    $salt .= $Allowed_Chars[mt_rand(0,$Chars_Len)];
}
$bcrypt_salt = $Blowfish_Pre . $salt . $Blowfish_End;

$hashed_password = crypt($password, $bcrypt_salt);


//if (check_if_available($username)) {
	$statement = $con->prepare(
	"INSERT INTO users values (?,?,?)"
	);

	$statement->bind_param("sss",$username,$salt,$hashed_password);

	$rowNames = '';
	$statement->bind_result($rowNames);
	$statement->execute();
	
	echo("User created: $username");
	//}
//else {
	//echo("Username already taken. Please choose another one.")
		//}





function check_if_available ($username_string) {
	/*
	if ($stmt = $con->prepare("SELECT username FROM users WHERE username=?")) {
	    $stmt->bind_param("s", $username_string);
	    $stmt->execute();
	    $stmt->bind_result($count);
	    $stmt->fetch();
	    //$stmt->close();
	}*/
	$statement = $con->prepare(
	"SELECT username FROM users WHERE username=?"
	);

	$statement->bind_param("s",$username_string);

	$rowNames = '';
	$statement->bind_result($rowNames);
	$statement->execute();
	return ($rowNames > 0 ? true : false);	
}

//mysqli_close();
$con->close();
?>