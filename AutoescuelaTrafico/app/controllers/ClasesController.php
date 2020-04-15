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
		$this -> view("indexClasesGestion", array("gestionClases"=>$gestionClases));
	}

	//	PROFESORES

	/* ToDo:
	 * 	- Horario
	 */

	//	ALUMNOS

	/* ToDo:
	 * 	- indexClasesTutorias
	 */

	public function indexClasesInformacion() {
		$clases = new ClasesModel($this -> adapter);
		$clasesInformacion = $clases -> getInformacionAlumno();
		$this -> view("indexClasesInformacion", array("clasesInformacion"=>$clasesInformacion));
	}
	

}
?>