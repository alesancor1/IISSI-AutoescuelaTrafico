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
	public function listaProfesor() {
		$alumnos = new AlumnosModel($this -> adapter);

		//inicializacion del paginador
		if (!isset($_SESSION["paginator"]))
			$_SESSION["paginator"] = new Paginator();
		$paginator = $_SESSION["paginator"];
		$paginator -> __init($alumnos);

		//llamada al metodo de consulta
		$listaProf = $alumnos -> getAlumnos($paginator -> _start, $paginator -> _end);

		//renderiza la vista pasandole el array de anuncios
		$this -> view("/alumnos/ListAlumnos", array("listaProf" => $listaProf));
	}

	public function listaCalificacionesProfesor() {
		// Los tres tipos de examen---------------------------------------
		$teorico = new AlumnosModel($this -> adapter);
		$listaTeorico = $teorico -> getExamenesTeoricos();

		$practicoC = new AlumnosModel($this -> adapter);
		$listaPracticoC = $practicoC -> getExamenesPracticosCirculacion();

		$practicoP = new AlumnosModel($this -> adapter);
		$listaPracticoP = $practicoP -> getExamenesPracticosPista();
		//----------------------------------------------------------------
		// Todos los alumnos del profesor---------------------------------
		$alumnos = new AlumnosModel($this -> adapter);
		$listaAlumnos = $alumnos -> getAlumnosSinPaginar();
		//----------------------------------------------------------------
		
		// Procesar los datos---------------------------------------------
		// Resultado es un map
		$resultado = array();
		foreach ($listaAlumnos as $num => $alumno) {
			// variable de nombre + apellidos
			$nombreApellidos = $alumno -> getNombre() . " " . $alumno -> getApellidos();
			// Array de teoria
			$arrayTeo = array();
			foreach ($listaTeorico as $num => $teo) {
				if($nombreApellidos == $teo -> NOMBRE . " " . $teo -> APELLIDOS)
					array_push($arrayTeo, $teo);
			}
			// Array practico circulacion
			$arrayPC = array();
			foreach ($listaPracticoC as $num => $pC) {
				if($nombreApellidos == $pC -> NOMBRE . " " . $pC -> APELLIDOS)
					array_push($arrayPC, $pC);
			}
			// Array practico pista
			$arrayPP = array();
			foreach ($listaPracticoP as $num => $pP) {
				if($nombreApellidos == $pP -> NOMBRE . " " . $pP -> APELLIDOS)
					array_push($arrayPP, $pP);
			}
			
			// Array de todos los examenes [[Teoricos],[Circulacion],[Pista]]
			$arrayRecubridor = $arrayName = array($arrayTeo, $arrayPC, $arrayPP);
			// {Nombre Apellidos => [[Teoricos],[Circulacion],[Pista]], ...}
			$resultado[$nombreApellidos] = $arrayRecubridor;
		}

		$this -> view("/alumnos/ListaCalificaciones", array("resultado" => $resultado, "listaAlumnos" => $listaAlumnos));
	}

	// ADMINISTRADOR
	// LISTA
	public function listaAdministrador() {
		$alumnos = new AlumnosAdminModel($this -> adapter);

		//inicializacion del paginador
		if (!isset($_SESSION["paginator"]))
			$_SESSION["paginator"] = new Paginator();
		$paginator = $_SESSION["paginator"];
		$paginator -> __init($alumnos);

		//llamada al metodo de consulta
		$listaAdmin = $alumnos -> getAlumnos($paginator -> _start, $paginator -> _end);

		//renderiza la vista pasandole el array de anuncios
		$this -> view("/alumnos/ListaAlumnosAdmin", array("listaAdmin" => $listaAdmin));
	}

}
?>