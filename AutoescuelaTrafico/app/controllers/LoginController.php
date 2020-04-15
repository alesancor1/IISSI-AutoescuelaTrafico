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
			
			$row = $loginModel->getByLogin($_POST["uname"], $_POST["psw"]);
			$tipo = null; $dni=null;
			if(isset($row)){
				$tipo = $row[0]->TIPO;
				$dni = $row[0]->DNI;
			}
			
			if($tipo != 'Profesor' AND $tipo != 'Alumno' AND $tipo != 'Administrador'){
				$this->view("login", array("error"=>TRUE));
			} else {
				$_SESSION["cuenta"] = array($_POST["uname"], $_POST["psw"], $tipo, $dni);
				
				switch ($tipo) {
					case 'Profesor':
						funciones::redirect("MainPage");
						break;
					
					case 'Alumno':
						funciones::redirect("MainPage");
						break;
						
					case 'Administrador':
						funciones::redirect("MainPage");
						break;
						
					default:
						break;
				}
			}		
		}
	}

}
?>