<?php
class ProfesoresController extends BaseController {
	
	public $conectar;
	public $adapter;
	
	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}
	
	//ADMINISTRADOR (LISTA DE PROFESORES)
	
	public function indexProfesoradoInformacion(){
		$profesores = new ProfesoresModel($this->adapter);
		$infoProfesores = $profesores -> getInformacionProfesores();
		
		$permisos= new ProfesoresModel($this->adapter);
		$permisosImpartidos = $profesores -> getPermisosImpartidos();
		
		$this->view("/profesores/indexProfesoresAdmin", array("infoProfesores" => $infoProfesores, "permisosImpartidos" => $permisosImpartidos));
	}
}
?>