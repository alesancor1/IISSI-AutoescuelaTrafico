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
		foreach ($listaAlumnos as $num => $alumno) {
			// variable de nombre + apellidos
			$nombreApellidos = $alumno -> getNombre() . " " . $alumno -> getApellidos();
			// Array de teoria
			$arrayTeo = array();
			foreach ($listaTeorico as $num => $teo) {
				if ($nombreApellidos == $teo -> NOMBRE . " " . $teo -> APELLIDOS)
					array_push($arrayTeo, $teo);
			}
			// Array practico circulacion
			$arrayPC = array();
			foreach ($listaPracticoC as $num => $pC) {
				if ($nombreApellidos == $pC -> NOMBRE . " " . $pC -> APELLIDOS)
					array_push($arrayPC, $pC);
			}
			// Array practico pista
			$arrayPP = array();
			foreach ($listaPracticoP as $num => $pP) {
				if ($nombreApellidos == $pP -> NOMBRE . " " . $pP -> APELLIDOS)
					array_push($arrayPP, $pP);
			}

			// Array de todos los examenes [[Teoricos],[Circulacion],[Pista]]
			$arrayRecubridor = $arrayName = array($arrayTeo, $arrayPC, $arrayPP);
			// {Nombre Apellidos => [[Teoricos],[Circulacion],[Pista]], ...}
			$resultado[$nombreApellidos] = $arrayRecubridor;
		}

		//___________________________________________________________________________________________________________
		// Los ultimos examenes______________________________________________________________________________________
		// Los tres tipos de examen
		$teorico = new AlumnosModel($this -> adapter);
		$listaTeorico = $teorico -> getUltimosExamenesTeoricos();

		$practicoC = new AlumnosModel($this -> adapter);
		$listaPracticoC = $practicoC -> getUltimosExamenesPP();

		$practicoP = new AlumnosModel($this -> adapter);
		$listaPracticoP = $practicoP -> getUltimoExamenPC();

		$alumnos = new AlumnosModel($this -> adapter);
		$listaAlumnos = $alumnos -> getAlumnosSinPaginar();

		// Procesar los datos---------------------------------------------
		// Resultado es un map
		$resultado = array();
		// Comparar fechas por teoricos
		foreach ($listaTeorico as $num => $teo) {
			$claves = array_keys($resultado);
			// Comprueba si el alumno ya esta en el array
			if (in_array(($teo -> NOMBRE . " " . $teo -> APELLIDOS), $claves)) {
				// Comparando las dos fechas
				$fe = funciones::dateComparator($resultado[$teo -> NOMBRE . " " . $teo -> APELLIDOS] -> FECHA, $teo -> FECHA);
				// Si la fecha nueva es mas actual se sustituye
				if ($fe == $teo -> FECHA)
					$resultado[$teo -> NOMBRE . " " . $teo -> APELLIDOS] = $teo;
				// Si no esta presente en el array se añade el nuevo ultimo examen
			} else
				$resultado[$teo -> NOMBRE . " " . $teo -> APELLIDOS] = $teo;
		}
		// Comparar fechas por practicos circulacion
		foreach ($listaPracticoC as $num => $pC) {
			$claves = array_keys($resultado);
			if (in_array(($pC -> NOMBRE . " " . $pC -> APELLIDOS), $claves)) {

				$fe = funciones::dateComparator($resultado[$pC -> NOMBRE . " " . $pC -> APELLIDOS] -> FECHA, $pC -> FECHA);
				if ($pC -> FECHA == $fe)
					$resultado[$pC -> NOMBRE . " " . $pC -> APELLIDOS] = $pC;
			} else
				$resultado[$pC -> NOMBRE . " " . $pC -> APELLIDOS] = $pC;
		}
		// Comparar fechas por practicos pista
		foreach ($listaPracticoP as $num => $pP) {
			if (in_array(($pP -> NOMBRE . " " . $pP -> APELLIDOS), $claves)) {

				$fe = funciones::dateComparator($resultado[$pP -> NOMBRE . " " . $pP -> APELLIDOS] -> FECHA, $pP -> FECHA);
				if ($pP -> FECHA == $fe)
					$resultado[$pP -> NOMBRE . " " . $pC -> APELLIDOS] = $pP;
			} else
				$resultado[$pP -> NOMBRE . " " . $pP -> APELLIDOS] = $pP;

		}

		$this -> view("/alumnos/ListaCalificaciones", array("resultado" => $resultado, "listaAlumnos" => $listaAlumnos, "resultado2" => $resultado));
	}

	// ADMINISTRADOR
	// LISTA
	public function listaAdministrador() {
		$alumnos = new AlumnosAdminModel($this -> adapter);
		if(isset($_POST["permiso"])) $_SESSION["filtro"] = $_POST["permiso"];
		
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
	
	public function enviar(){
		$alumno= new AlumnosAdminModel($this->adapter);
		$insertarAlumno= $alumno -> insert($_POST["dni"],$_POST["nombre"],$_POST["apellidos"],$_POST["fechaNacimiento"],$_POST["permiso"],$_POST["oferta"]);
		funciones::redirect("Alumnos", "listaAdministrador");
	}

	public function borrar(){		
		$alumno= new AlumnosAdminModel($this->adapter);
		
		foreach ($_POST as $num => $dni) {
			$borrarAlumno= $alumno -> delete($dni);	
		}
		funciones::redirect("Alumnos", "listaAdministrador");
	}

}
?>