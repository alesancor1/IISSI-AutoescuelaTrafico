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
		$this -> view("/webtest/indexWebTest", array("recursosAdministrador" => $recursosAdministrador));
	}
	
	//	ALUMNO
}

?>