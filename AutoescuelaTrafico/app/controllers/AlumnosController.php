<?php
class AlumnosController extends BaseController {

	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}
	
	// PROFESOR
		//LISTA
	public function listaProfesor(){
		$alumnos = new AlumnosModel($this -> adapter);

		//inicializacion del paginador
		if(!isset($_SESSION["paginator"])) 
			$_SESSION["paginator"] = new Paginator();
		$paginator = $_SESSION["paginator"];
		$paginator->__init($alumnos);

		//llamada al metodo de consulta
		$listaProf = $alumnos -> getAlumnos($paginator->_start, $paginator->_end);
		
		//renderiza la vista pasandole el array de anuncios
		$this -> view("/alumnos/ListAlumnos", array("listaProf"=>$listaProf));
	}
	
	
	// ADMINISTRADOR
		// LISTA
	public function listaAdministrador(){
		$alumnos = new AlumnosAdminModel($this -> adapter);

		//inicializacion del paginador
		if(!isset($_SESSION["paginator"])) 
			$_SESSION["paginator"] = new Paginator();
		$paginator = $_SESSION["paginator"];
		$paginator->__init($alumnos);

		//llamada al metodo de consulta
		$listaAdmin = $alumnos -> getAlumnos($paginator->_start, $paginator->_end);
		
		//renderiza la vista pasandole el array de anuncios
		$this -> view("/alumnos/ListaAlumnosAdmin", array("listaAdmin"=>$listaAdmin));		
	}
}
?>