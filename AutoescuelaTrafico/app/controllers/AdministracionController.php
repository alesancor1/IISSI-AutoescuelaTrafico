<?php
class AdministracionController extends BaseController {
	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}

	//	ADMINISTRADOR

	public function getGastosAlumnos(){
		$gastos = new AdministracionModel($this->adapter);
		
		$gastos->method='getGastosAlumnos';
		
		if(!isset($_SESSION["paginator"])){
			$_SESSION["paginator"] = new Paginator();
		}
		$paginator = $_SESSION["paginator"];
		$paginator->__init($gastos);

		$gastosAlumnos = $gastos->getGastosAlumnos($paginator->_start, $paginator->_end);
		
		$this->view("/administracion/indexGastosAlumnos", array("gastosAlumnos" => $gastosAlumnos));
	}
	
	public function getDesglose(){
		$desglose = new AdministracionModel($this->adapter);		
		$desglose->method='getDesgloseGeneral';

		if (isset($_POST["mes"]))
			$_SESSION["desgloseMes"] = $_POST["mes"];
		if(isset($_POST["anyo"]))
			$_SESSION["desgloseAnyo"] = $_POST["anyo"];
		
		if(!isset($_SESSION["paginator"])){
			$_SESSION["paginator"] = new Paginator();
		}
		$paginator = $_SESSION["paginator"];
		$paginator->__init($desglose);
		
		$desgloseGeneral = $desglose->getDesgloseGeneral($paginator -> _start, $paginator -> _end);
		$this -> view("/administracion/indexDesgloseGeneral", array("desgloseGeneral" => $desgloseGeneral));
	}
}
?>