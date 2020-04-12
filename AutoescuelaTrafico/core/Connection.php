<?php

class Connection extends PDO {

	private $host;
	private $user;
	private $pass;
	private $charset;

	public function __construct() {
		// $db_cfg =
		// require_once 'C:/xampp/htdocs/IISSI/AUTOESCUELA/app/config/db.php';
		$this -> host = "oci:dbname=localhost/XE";
		$this -> user = "AutoEscuelaTrafico";
		$this -> pass = "IISSI";
		$this -> charset = "utf8";
	}
	
	public function conexion() {

		// try {
			$conexion = new PDO($this -> host . ';' . $this -> charset, $this ->user, $this ->pass, array(PDO::ATTR_PERSISTENT => true));
			$conexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			return $conexion;
		// } catch(PDOException $e) {
			// $_SESSION['exception'] = $e -> GetMessage();
			// header("Location: error.php");
		// }
	}

	public function closeConexion($conexion) {
		$conexion = null;
	}

}
?>