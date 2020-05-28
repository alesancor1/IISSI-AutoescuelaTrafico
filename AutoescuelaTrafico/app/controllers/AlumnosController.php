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
		// _______________________________________________________________________________________________________
		// Parte de ALUMNOS_______________________________________________________________________________________
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

		foreach ($listaTeorico as $num => $teo) {
			// variable de nombre + apellidos
			$nombreApellidos = $teo -> NOMBRE . " " . $teo -> APELLIDOS;
			// Si el array de claves del 'array_map' resultado contiene el nombre
			// se añade el examen
			if (array_key_exists($nombreApellidos, $resultado))
				array_push($resultado[$nombreApellidos], $teo);
			// En caso de no tener la clave se crea una clave con ese nombre y se le
			// asocia un array vacio al que se le añade el examen
			else {
				$resultado[$nombreApellidos] = array();
				$array_push($resultado[$nombreApellidos], $teo);
			}
		}
		foreach ($listaPracticoC as $num => $pC) {
			$nombreApellidos = $pC -> NOMBRE . " " . $pC -> APELLIDOS;
			if (array_key_exists($nombreApellidos, $resultado))
				array_push($resultado[$nombreApellidos], $pC);
			else {
				$resultado[$nombreApellidos] = array();
				array_push($resultado[$nombreApellidos], $pC);
			}
		}
		foreach ($listaPracticoP as $num => $pP) {
			$nombreApellidos = $pP -> NOMBRE . " " . $pP -> APELLIDOS;
			if (array_key_exists($nombreApellidos, $resultado))
				array_push($resultado[$nombreApellidos], $pP);
			else{
				$resultado[$nombreApellidos] = array();
				array_push($resultado[$nombreApellidos], $pP);
				}
			}
			
		// __________________________________________________________________________________
		// Los ultimos examenes______________________________________________________________________________________

		$resultado2 = $resultado;
		
		foreach ($resultado2 as $alumno => $examenes) {
			foreach ($examenes as $num => $examen) {
				
			}
		}

		$this -> view("/alumnos/ListaCalificaciones", array("resultado" => $resultado, "listaAlumnos" => $listaAlumnos, "resultado2" => $resultado));
	}

	// ADMINISTRADOR
	// LISTA
	public function listaAdministrador() {
		$alumnos = new AlumnosAdminModel($this -> adapter);
		if (isset($_POST["permiso"]))
			$_SESSION["filtro"] = $_POST["permiso"];

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

	public function enviar() {
		$alumno = new AlumnosAdminModel($this -> adapter);
		$insertarAlumno = $alumno -> insert($_POST["dni"], $_POST["nombre"], $_POST["apellidos"], $_POST["fechaNacimiento"], $_POST["permiso"], $_POST["oferta"]);
		funciones::redirect("Alumnos", "listaAdministrador");
	}

	public function borrar() {
		$alumno = new AlumnosAdminModel($this -> adapter);

		foreach ($_POST as $num => $dni) {
			$borrarAlumno = $alumno -> delete($dni);
		}
		funciones::redirect("Alumnos", "listaAdministrador");
	}

}


?>