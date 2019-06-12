<?php
require_once("PDO.DB.class.php"); 

try{

	$db = new DB();

	$response = array();
	$tempArray = array();

	$data = $db->getAllHomework();

	foreach ($data as $account) {
		$tempArray['homework'] = "{$account->getHomework()}";
		$tempArray['due'] = "{$account->getDue()}";

		array_push($response, $tempArray);
	}

	echo json_encode($response);




}catch(PDOEXception $error){
	die("Error");
}

?>