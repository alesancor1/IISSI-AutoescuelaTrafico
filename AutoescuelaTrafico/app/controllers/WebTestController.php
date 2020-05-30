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
		
		$recursos->method = 'getRecursosAdministrador';
		
		if(!isset($_SESSION["paginator"])){
			$_SESSION["paginator"] = new Paginator();
		}
		$paginator = $_SESSION["paginator"];
		$paginator->__init($recursos);

		$recursosAdministrador = $recursos -> getRecursosAdministrador($paginator->_start, $paginator->_end);
		$this -> view("/webtest/indexWebTestAdmin", array("recursosAdministrador" => $recursosAdministrador));
	}
	
	public function enviar() {
		$accesoWeb = new WebTestModel($this->adapter);
		$insertarAccesoWeb = $accesoWeb -> insertAccesoWeb($_POST["dni"]);
		funciones::redirect("WebTest", "indexRecursosWebTest");
	}
	
	public function renovar(){
		$accesoWeb = new WebTestModel($this->adapter);
		$renovacion = $accesoWeb -> renovacionAccesoWeb($_POST["dni"]);
		funciones::redirect("WebTest", "indexRecursosWebTest");
	}
	
	//	ALUMNO
	
	public function indexInformacionWebTest(){
		$informacion = new WebTestModel($this -> adapter);
		$informacionAlumno = $informacion -> getInformacionAlumno();
		$this -> view("/webtest/indexWebTestAlumno", array("informacionAlumno" => $informacionAlumno)); 
	}
}

?>