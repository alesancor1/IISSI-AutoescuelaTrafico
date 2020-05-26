<?php
//ESTE MODELO ES DE EJEMPLO
class AlumnosModel extends BaseModel {

	private $table;

	public function __construct($adapter) {
		$this -> table = "Alumnos";
		parent::__construct($this -> table, $adapter);
	}

	// Metodos de consulta
	public function getAlumnos($first = 0, $last = -1) {
		$query = "SELECT A.* FROM Alumnos A RIGHT JOIN( SELECT DNIALUMNO,DNIPROFESOR FROM Clases C WHERE DNIPROFESOR='" . $_SESSION["cuenta"][3] . "'" . " GROUP BY DNIALUMNO,DNIPROFESOR) ON DNI=DNIALUMNO";
		$alumnos = $this -> consultaPaginada($query, $first, $last);
		foreach ($alumnos as $num => $alumno) {
			$alumnos[$num] = Alumnos::__parse("Alumnos", $alumno);
		}
		return $alumnos;
	}

	// Consulta paginada
	public function rows() {
		$query = "SELECT A.* FROM Alumnos A RIGHT JOIN( SELECT DNIALUMNO,DNIPROFESOR FROM Clases C WHERE DNIPROFESOR='" . $_SESSION["cuenta"][3] . "'" . " GROUP BY DNIALUMNO,DNIPROFESOR) ON DNI=DNIALUMNO";
		return $this -> rowNum($query);
	}

}
?>