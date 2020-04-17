<?php
class WebTestController extends BaseController{
	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}
	
	//	ADMINISTRADOR
	
	public function indexRecursosWebTest(){
		$recursos = new WebTestModel($this -> adapter);
		$recursosAdministrador = $recursos -> getRecursosAdministrador();
		$this -> view("/webtest/indexWebTestAdmin", array("recursosAdministrador" => $recursosAdministrador));
	}
	
	//	ALUMNO
	
	public function indexInformacionWebTest(){
		$informacion = new WebTestModel($this -> adapter);
		$informacionAlumno = $informacion -> getInformacionAlumno();
		$this -> view("/webtest/indexWebTestAlumno", array("informacionAlumno" => $informacionAlumno)); 
	}
}

?>