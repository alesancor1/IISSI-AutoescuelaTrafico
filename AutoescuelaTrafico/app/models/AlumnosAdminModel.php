<?php
class AlumnosAdminModel extends BaseModel {

	private $table;

	public function __construct($adapter) {
		$this -> table = "Alumnos";
		parent::__construct($this -> table, $adapter);
	}

	// Metodos de consulta
	public function getAlumnos($first = 0, $last = -1) {
		$filtro = isset($_POST["permiso"]) ? $_POST["permiso"] : "";
		$query = "SELECT * FROM ALUMNOS LEFT JOIN MATRICULAS ON ALUMNOS.DNI=MATRICULAS.ALUMNO";
		$query = "SELECT * FROM ($query) Q WHERE Q.PERMISOMATRICULADO LIKE '%$filtro%'";
		
		$alumnos = $this -> consultaPaginada($query, $first, $last);
		foreach ($alumnos as $num => $alumno) {
			$alumnos[$num] = Alumnos::__parse("Alumnos", $alumno);
		}
		return $alumnos;
	}

	// Consulta paginada
	public function rows() {
		$query = "SELECT * FROM Alumnos";
		return $this -> rowNum($query);
	}

}
?>