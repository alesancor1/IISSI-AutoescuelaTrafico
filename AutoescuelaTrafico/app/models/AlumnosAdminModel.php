<?php
class AlumnosAdminModel extends BaseModel {

	private $table;

	public function __construct($adapter) {
		$this -> table = "Alumnos";
		parent::__construct($this -> table, $adapter);
	}

	// Metodos de consulta
	public function getAlumnos($first = 0, $last = -1) {
		$query = "SELECT * FROM Alumnos";
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