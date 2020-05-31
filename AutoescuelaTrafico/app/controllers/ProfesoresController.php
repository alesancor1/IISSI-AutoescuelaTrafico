<?php
class ProfesoresController extends BaseController {
	
	public $conectar;
	public $adapter;
	
	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}
	
	//ADMINISTRADOR
	
	public function indexProfesoradoInformacion(){
		$profesores = new ProfesoresModel($this->adapter);
		$infoProfesores = $profesores -> getInformacionProfesores();
		
		$permisos= new ProfesoresModel($this->adapter);
		$permisosImpartidos = $profesores -> getPermisosImpartidos();
		
		$this->view("/profesores/indexProfesoresAdmin", array("infoProfesores" => $infoProfesores, "permisosImpartidos" => $permisosImpartidos));
	}
	
	public function addProfesor(){
		$profesores = new ProfesoresModel($this -> adapter);
		$profesor = $_SESSION["formInput"];
		$addProfesor = $profesores->addProfesor($profesor["dni"], $profesor["nombre"], $profesor["apellidos"], $profesor["fechaContrato"], $profesor["telefono"], $profesor["salario"], $profesor["nss"]);
		funciones::redirect("Profesores", "indexProfesoradoInformacion");
	}
	
	public function deleteProfesor(){
		$profesores = new ProfesoresModel($this -> adapter);
		$deleteProfesor = $profesores->deleteProfesor($_POST["dni"], $_POST["nombre"], $_POST["apellidos"], $_POST["fechaContrato"], $_POST["telefono"], $_POST["salario"], $_POST["nss"]);
		funciones::redirect("Profesores", "indexProfesoradoInformacion");
	}
}
?>