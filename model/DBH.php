<?php
class DBH{
private static $dbh;
	/**
	*	Конструктор
	*	http://phpfaq.ru/pdo
	*/
	private static function connectToDB(){	
		require_once "config.php";
		$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
		$opt = array(

		    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
		    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
		);
		try {
			self::$dbh = new PDO($dsn, $user, $pass, $opt);
			
		} catch (Exception $e) {
			echo "Нет подключения к базе!";
		}

		
	}

	public static function getDBH(){
		if(!self::$dbh){
			self::connectToDB();
		}
		return self::$dbh;
	}
}