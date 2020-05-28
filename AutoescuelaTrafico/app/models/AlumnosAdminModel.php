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
		$this->ejecutaSql("INSERT INTO ACCESOWEB(USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,WEB) VALUES ('$dni',DBMS_RANDOM.STRING('x',12),sysdate,sysdate+61,1)");	
		$this->ejecutaSql("INSERT INTO Alumnos (DNI, NOMBRE, APELLIDOS, FECHANACIMIENTO,ACCESOWEB) VALUES ('$dni', '$nombre', '$apellidos', to_date('$fechaNacimiento','YYYY-MM-DD'),'$dni')");
		$this->ejecutaSql("INSERT INTO MATRICULAS (FECHA, PERMISOMATRICULADO, ALUMNO, OFERTA) VALUES (sysdate, '$permisoMatriculado', '$dni', '$oferta')");	
	}
	
	public function delete($dni) {
		$this->ejecutaSql("DELETE FROM ALUMNOS WHERE DNI='$dni'");
	}


	// CALIFICACIONES
	public function getAlumnosSinPaginar() {
		// El 0 es de relleno para cuadrarlo con como esta hecho en el paginado
		$query = "SELECT 0,A.* FROM Alumnos A RIGHT JOIN( SELECT DNIALUMNO,DNIPROFESOR FROM Clases C
		 GROUP BY DNIALUMNO,DNIPROFESOR) ON DNI=DNIALUMNO";
		$alumnos = $this -> ejecutaSql($query);
		foreach ($alumnos as $num => $alumno) {
			$alumnos[$num] = Alumnos::__parse("Alumnos", $alumno);
		}
		return $alumnos;
	}

	public function getExamenesTeoricos() {
		$query = "SELECT 'TEORICO' AS TIPO,NOMBRE,APELLIDOS,FECHA,CALIFICACION,NFALLOS FROM EXAMENESTEORICOS 
		LEFT JOIN ALUMNOS ON ALUMNO = DNI WHERE CALIFICACION IS NOT NULL";
		$examenTeo = $this -> ejecutaSql($query);
		return $examenTeo;
	}

	public function getExamenesPracticosCirculacion() {
		$query = "SELECT 'CIRCULACION' 
		AS TIPO,NOMBRE,APELLIDOS,FECHA,CALIFICACION,FALTASLEVES,FALTASDEFICIENTES,FALTASELIMINATORIAS FROM 
		EXAMENESPRACTICOCIRCULACION LEFT JOIN ALUMNOS ON ALUMNO = DNI WHERE CALIFICACION IS NOT NULL";
		$examenPC = $this -> ejecutaSql($query);
		return $examenPC;
	}

	public function getExamenesPracticosPista() {
		$query = " SELECT 'PISTA' 
		AS TIPO,NOMBRE,APELLIDOS,FECHA,CALIFICACION,FALTASLEVES,FALTASDEFICIENTES,FALTASELIMINATORIAS FROM 
		EXAMENESPRACTICOPISTA LEFT JOIN ALUMNOS ON ALUMNO = DNI WHERE CALIFICACION IS NOT NULL";
		$examenPP = $this -> ejecutaSql($query);
		return $examenPP;
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