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
		
		if(isset($_POST["uname"]) && isset($_POST["psw"])){
			$tipo = $loginModel->getBy($_POST["uname"], $_POST["psw"]);
			
			if($tipo != 'Profesor' AND $tipo != 'Alumno' AND $tipo != 'Administrador'){
				$this->view("login", array("error"=>TRUE));
			} else {
				session_start();
				$_SESSION["cuenta"] = array($_POST["uname"], $_POST["psw"], $tipo);
				
				switch ($tipo) {
					case 'Profesor':
						$this->view("mainPage");
						break;
					
					case 'Alumno':
						$this->view("mainPage");
						break;
						
					case 'Administrador':
						$this->view("mainPage");
						break;
						
					default:
						break;
				}
			}		
		}
	}

}
?>