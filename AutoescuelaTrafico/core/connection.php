<?php

class Connection extends PDO {
	
	private $host;
	private $user;
	private $pass;
	private $charset;
	
	public function __construct() {
		$db_cfg= require_once 'app/config/db.php';
		$this->host=$db_cfg["host"];
		$this->user=$db_cfg["user"];
        $this->pass=$db_cfg["pass"];
		$this->charset=$db_cfg["charset"];
	}
	
	public function conexion() {
		
		try{
			$conexion=new PDO($host.';'.$charset,$user,$pass,array(PDO::ATTR_PERSISTENT => true));
    		$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			return $conexion;
	    }catch(PDOException $e){
			$_SESSION['exception'] = $e->GetMessage();
			header("Location: claseErrorAlIniciarConexionBD.php");
		}
	}
		
	public function closeConexion($conexion){
		$conexion=null;
	}
				
}

?>