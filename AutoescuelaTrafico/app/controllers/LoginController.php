<?php

class LoginController extends BaseController {

	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}

	public function index() {
		$this->view("login",array("error"=>FALSE));
	}

	public function login() {
		$loginModel = new LoginModel($this->adapter);
		$user = $_SESSION["formInput"];
		
		if(isset($user["uname"]) && isset($user["psw"])){
			
			$row = $loginModel->getByLogin($user["uname"], $user["psw"]);
			$tipo = null; $dni=null;
			if(isset($row)){
				$tipo = $row[0]->TIPO;
				$dni = $row[0]->DNI;
			}
			
			if($tipo != 'Profesor' AND $tipo != 'Alumno' AND $tipo != 'Administrador'){
				$this->view("login", array("error"=>TRUE));
			} else {
				$_SESSION["cuenta"] = array($user["uname"], $user["psw"], $tipo, $dni);
				funciones::redirect("Anuncios");
			}
		}
	}
}
?>