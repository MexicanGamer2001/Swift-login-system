<?php
require_once("PDO.DB.class.php"); 

$error=$errorPassword=$errorUser=$WrongUsernPW=$plzFill ="";
$succes =  "Successfully added.";

try{

	$db = new DB();


	//echo "DB connect";

	$response = array();

if(isset( $_POST['user']) && isset( $_POST['pw']) ){

	$inputname = $_POST['user'];
	$inputpw   = $_POST['pw'];

	$data = $db->getAllUserclass($inputname, $inputpw);

	$getDBusername = "";
	$getDBpw = "";

		foreach ($data as $account) {
			$getDBusername = "{$account->getUsername()}";
			$getDBpw = "{$account->getPassword()}";
		}


		if($inputname === $getDBusername && $inputpw === $getDBpw){
			//if right user/pass

			$response['error'] = "false";
			$response['user'] =  $getDBusername;
			$response['pw'] =  $getDBpw;

			//echo $succes;

			}else{
			//if wrong user/pass
				//$WrongUsernPW =  "Oops! Wrong pw and username";
				//header("location: login.php");

			 $response['error'] = "true";
             $response['message'] = 'Invalid username or password';


			}

	}else{
			 $response['error'] = "true";
             $response['message'] = 'no username or password';
	}
	
	echo json_encode($response);


}catch(PDOEXception $error){
	die("Error");
}


?>