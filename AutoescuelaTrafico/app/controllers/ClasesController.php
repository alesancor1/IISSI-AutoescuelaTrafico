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

	public function indexGestion() {
		$clases = new ClasesModel($this -> adapter);
		$gestionClases = $clases -> getGestionAdministrador();
		$this -> view("/clases/indexClasesGestion", array("gestionClases"=>$gestionClases));
	}

	//	PROFESORES

	/* ToDo:
	 * 	- Horario
	 */

	//	ALUMNOS

	public function indexClasesInformacion() {
		$clases = new ClasesModel($this -> adapter);
		$clasesInformacion = $clases -> getInformacionAlumno();
		$this -> view("/clases/indexClasesInformacion", array("clasesInformacion"=>$clasesInformacion));
	}
	
	/*
	 * Para que funcione hay que añadir al SQL la tabla AUX_T (mirar procedimiento del entregable IISSI1).
	 * 
	 */
	public function indexClasesTutorias(){
		$tutorias = new ClasesModel($this -> adapter);
		$tutoriasInformacion = $tutorias -> getTutoriasAlumno();
		$this -> view("/tutorias/indexTutorias", array("tutoriasInformacion"=>$tutoriasInformacion));
	}

}
?>