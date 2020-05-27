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
	
	public function getAlumnosSinPaginar(){
		// El 0 es de relleno para cuadrarlo con como esta hecho en el paginado
		$query = "SELECT 0, A.* FROM Alumnos A RIGHT JOIN( SELECT DNIALUMNO,DNIPROFESOR FROM Clases C WHERE DNIPROFESOR='" . $_SESSION["cuenta"][3] . "'" . " GROUP BY DNIALUMNO,DNIPROFESOR) ON DNI=DNIALUMNO";
		$alumnos = $this -> ejecutaSql($query);
		foreach ($alumnos as $num => $alumno) {
			$alumnos[$num] = Alumnos::__parse("Alumnos", $alumno);
		}
		return $alumnos;
	}
	
	public function getExamenesTeoricos(){
		$dni = $_SESSION["cuenta"][3];
		$query = "SELECT NOMBRE,Apellidos,FECHA,CALIFICACION FROM (SELECT DISTINCT C.DNIALUMNO,AET.FECHA,AET.CALIFICACION FROM CLASES C LEFT JOIN EXAMENESTEORICOS AET ON AET.ALUMNO = C.DNIALUMNO WHERE DNIPROFESOR ='" . $dni . "'" . ")ALUCALIF LEFT JOIN ALUMNOS ON alumnos.dni=alucalif.dnialumno ORDER BY NOMBRE,FECHA";
		$examenTeo = $this -> ejecutaSql($query);
		return $examenTeo;
	}
	
	public function getExamenesPracticosCirculacion(){
		$dni = $_SESSION["cuenta"][3];
		$query = "SELECT NOMBRE,Apellidos,FECHA,CALIFICACION FROM (SELECT DISTINCT C.DNIALUMNO,AET.FECHA,AET.CALIFICACION FROM CLASES C LEFT JOIN EXAMENESPRACTICOCIRCULACION AET ON AET.ALUMNO = C.DNIALUMNO WHERE DNIPROFESOR ='" . $dni . "'" . ")ALUCALIF LEFT JOIN ALUMNOS ON alumnos.dni=alucalif.dnialumno ORDER BY Nombre,Fecha";
		$examenPC = $this -> ejecutaSql($query);
		return $examenPC;
	}
	
	public function getExamenesPracticosPista(){
		$dni = $_SESSION["cuenta"][3];
		$query = " SELECT NOMBRE,Apellidos,FECHA,CALIFICACION FROM (SELECT DISTINCT C.DNIALUMNO,AET.FECHA,AET.CALIFICACION FROM CLASES C LEFT JOIN EXAMENESPRACTICOPISTA AET ON AET.ALUMNO = C.DNIALUMNO WHERE DNIPROFESOR ='" . $dni . "'" . ")ALUCALIF LEFT JOIN ALUMNOS ON alumnos.dni=alucalif.dnialumno ORDER BY Nombre,Fecha";
		$examenPP = $this -> ejecutaSql($query);
		return $examenPP;
	}

	// Consulta paginada
	public function rows() {
		$query = "SELECT A.* FROM Alumnos A RIGHT JOIN( SELECT DNIALUMNO,DNIPROFESOR FROM Clases C WHERE DNIPROFESOR='" . $_SESSION["cuenta"][3] . "'" . " GROUP BY DNIALUMNO,DNIPROFESOR) ON DNI=DNIALUMNO";
		return $this -> rowNum($query);
	}

}
?>