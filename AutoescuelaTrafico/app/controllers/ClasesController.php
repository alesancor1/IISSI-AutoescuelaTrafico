<?php
class ClasesController extends BaseController {
	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}

	//	ADMINISTRADOR

	public function indexGestion() {
		$clases = new ClasesModel($this -> adapter);
		$gestionClases = $clases -> getGestionAdministrador();
		$this -> view("/clases/indexClasesAdmin", array("gestionClases"=>$gestionClases));
	}

	//	PROFESORES

		//	Horario

	//	ALUMNOS

	public function indexClasesInformacion() {
		$clases = new ClasesModel($this -> adapter);

		$clases->method = 'getInformacionAlumno';
		
		if(!isset($_SESSION["paginator"])){
			$_SESSION["paginator"] = new Paginator();
		}
		$paginator = $_SESSION["paginator"];
		$paginator -> __init($clases);
		
		$clasesInformacion = $clases -> getInformacionAlumno($paginator -> _start, $paginator -> _end);
		$this -> view("/clases/indexClasesInformacion", array("clasesInformacion"=>$clasesInformacion));
	}
	
	public function indexClasesTutorias(){
		$tutorias = new ClasesModel($this -> adapter);

		$tutorias->method = 'getTutoriasAlumno';
		
		if(!isset($_SESSION["paginator"])){
			$_SESSION["paginator"] = new Paginator();
		}
		$paginator = $_SESSION["paginator"];
		$paginator -> __init($tutorias);
		
		$tutoriasInformacion = $tutorias -> getTutoriasAlumno($paginator -> _start, $paginator -> _end);
		$this -> view("/tutorias/indexTutorias", array("tutoriasInformacion"=>$tutoriasInformacion));
	}

}
?>