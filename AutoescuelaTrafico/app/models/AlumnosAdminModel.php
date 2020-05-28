<?php
class AlumnosAdminModel extends BaseModel {

	private $table;

	public function __construct($adapter) {
		$this -> table = "Alumnos";
		parent::__construct($this -> table, $adapter);
	}

	// Metodos de consulta
	public function getAlumnos($first = 0, $last = -1) {
		$filtro = isset($_SESSION["filtro"]) ? $_SESSION["filtro"] : "";
		$query = "SELECT * FROM ALUMNOS LEFT JOIN MATRICULAS ON ALUMNOS.DNI=MATRICULAS.ALUMNO";
		$query = "SELECT * FROM ($query) Q WHERE Q.PERMISOMATRICULADO LIKE '%$filtro%'";
		
		$alumnos = $this -> consultaPaginada($query, $first, $last);
		foreach ($alumnos as $num => $alumno) {
			$alumnos[$num] = Alumnos::__parse("Alumnos", $alumno);
		}
		return $alumnos;
	}
	
	public function insert($dni, $nombre, $apellidos, $fechaNacimiento, $permisoMatriculado, $oferta){	
		$this->ejecutaSql("INSERT INTO Alumnos (DNI, NOMBRE, APELLIDOS, FECHANACIMIENTO) VALUES ('$dni', '$nombre', '$apellidos', to_date('$fechaNacimiento','YYYY-MM-DD'))");
		$this->ejecutaSql("INSERT INTO MATRICULAS (FECHA, PERMISOMATRICULADO, ALUMNO, OFERTA) VALUES (sysdate, '$permisoMatriculado', '$dni', '$oferta')");	
	}
	
	public function delete($dni) {
		$this->ejecutaSql("DELETE FROM ALUMNOS WHERE DNI='$dni'");
	}

	// Consulta paginada
	public function rows() {
		$filtro = isset($_SESSION["filtro"]) ? $_SESSION["filtro"] : "";
		$query = "SELECT * FROM ALUMNOS LEFT JOIN MATRICULAS ON ALUMNOS.DNI=MATRICULAS.ALUMNO";
		$query = "SELECT * FROM ($query) Q WHERE Q.PERMISOMATRICULADO LIKE '%$filtro%'";
		return $this -> rowNum($query);
	}

}
?>