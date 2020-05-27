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

	/* ToDo:
	 *	- Horarios
	 */
	 
	//	Hay que unificar el de horario con el de gestion ya que van por tabs que no vamos a hacer cargas distintas

	public function indexGestion() {
		$clases = new ClasesModel($this -> adapter);
		$gestionClases = $clases -> getGestionAdministrador();
		//	En la unificacion de los metodos tendriamos que hacer las dos peticiones/querys aqui e unificarlas
		//	en una variable que los contenga a ambos en un unico array (esto si no hacemos el horario final)
		$this -> view("/clases/indexClasesAdmin", array("gestionClases"=>$gestionClases));
	}

	//	PROFESORES

	/* ToDo:
	 * 	- Horario
	 */

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
	
	/*
	 * Para que funcione hay que añadir al SQL la tabla AUX_T (mirar procedimiento del entregable IISSI1).
	 * 
	 */
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