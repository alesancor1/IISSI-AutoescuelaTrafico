<?php
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
	
	// public function getCalificaciones(){
		// $dni = $_SESSION["cuenta"][3];
		// $query = "SELECT NOMBRE,Apellidos,FECHA,CALIFICACION FROM (SELECT DISTINCT C.DNIALUMNO,AET.FECHA,AET.CALIFICACION FROM CLASES C LEFT JOIN EXAMENESTEORICOS AET ON AET.ALUMNO = C.DNIALUMNO WHERE DNIPROFESOR = " . $dni . ")ALUCALIF LEFT JOIN ALUMNOS ON alumnos.dni=alucalif.dnialumno ORDER BY NOMBRE,FECHA";
		// $calificaciones = $this -> ejecutaSql($query);
		// foreach (calificaciones as $num => $calificacion) {
			// $calificacion[$num] = 
		// }
	// }

	// Consulta paginada
	public function rows() {
		$query = "SELECT A.* FROM Alumnos A RIGHT JOIN( SELECT DNIALUMNO,DNIPROFESOR FROM Clases C WHERE DNIPROFESOR='" . $_SESSION["cuenta"][3] . "'" . " GROUP BY DNIALUMNO,DNIPROFESOR) ON DNI=DNIALUMNO";
		return $this -> rowNum($query);
	}

}
?>