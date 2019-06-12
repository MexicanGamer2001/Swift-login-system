<?php

class DB{
	private $db;

	function __construct(){
		try{
            //open a connection
			$this->db = new PDO("mysql:host={$_SERVER['DB_SERVER']};dbname={$_SERVER['DB']}",$_SERVER['DB_USER'],$_SERVER['DB_PASSWORD']);
			$this->db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		}catch(PDOException $e){
			die("Big problem");
		}
	}//constructor

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////User


    function getAllUserclass($user, $password){
    try{
        include "classes/User.class.php";
        $data = array();
        $query = "select * from swiftUP where password = '{$password}' && username = '{$user}'";
        $statement = $this->db->prepare($query);
        $statement->execute();
        $statement->setFetchMode(PDO::FETCH_CLASS,"User");
        while ($account = $statement->fetch()) {
            $data[] = $account;
        }
        return $data;
    }catch(PDOException $e){
        echo $e->getMessage();
        die("Error: User Fetch ");
    }
  }


    function getAllHomework(){
    try{
        include "classes/Homework.class.php";
        $data = array();
        $query = "select * from homeworkTable";
        $statement = $this->db->prepare($query);
        $statement->execute();
        $statement->setFetchMode(PDO::FETCH_CLASS,"Homework");
        while ($account = $statement->fetch()) {
            $data[] = $account;
        }
        return $data;
    }catch(PDOException $e){
        echo $e->getMessage();
        die("Error: User Fetch ");
    }
  }


}






