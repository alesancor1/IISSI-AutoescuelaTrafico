<?php
class VehiculosModel extends BaseModel{
	public $table;

	public function __construct($adapter) {
		$this -> table = "PEPITO GRILLO";
		parent::__construct($this -> table, $adapter);
	}
	
	public function rows(){
		return $this -> rowNum("SELECT * FROM nohacefalta");
	}
	
	//	ADMINISTRADOR
	
	public function getUsosPorAlumno(){
		$filtro = isset($_POST["filtro"]) ? $_POST["filtro"] : "";

		$query = "SELECT NOMBRE,APELLIDOS,MODELO,MATRICULA,ESTADO FROM ALUMNOCONDUCETURISMOS LEFT JOIN TURISMOS ON TURISMO = MATRICULA LEFT JOIN ALUMNOS ON DNI = ALUMNO
			UNION
			SELECT NOMBRE,APELLIDOS,MODELO,MATRICULA,ESTADO FROM ALUMNOCONDUCEMOTOCICLETAS LEFT JOIN MOTOCICLETAS ON MOTOCICLETA = MATRICULA LEFT JOIN ALUMNOS ON DNI = ALUMNO";
		$query = "SELECT * FROM ($query) Q 
			WHERE Q.NOMBRE LIKE '%$filtro%' OR Q.APELLIDOS LIKE '%$filtro%' OR Q.MODELO LIKE '%$filtro%' OR Q.MATRICULA LIKE '%$filtro%'";
		$tabla = $this->ejecutaSql($query);
		return $tabla;
	}
	
	public function getTalleres(){
		$query = "SELECT * FROM Talleres";
		$tabla = $this->ejecutaSql($query);
		return $tabla;
	}
	
	public function addTaller($nombreTaller, $direccionTaller, $telefonoTaller){
		$tabla = $this -> ejecutaSql("INSERT INTO Talleres (NOMBRE, DIRECCION, TELEFONO) VALUES ('$nombreTaller', '$direccionTaller', '$telefonoTaller')");
	}
	
	public function deleteTaller($nombreTaller, $direccionTaller, $telefonoTaller){
		$query = "DELETE FROM Talleres WHERE NOMBRE = '$nombreTaller' AND DIRECCION = '$direccionTaller' AND TELEFONO = '$telefonoTaller'";
		$tabla = $this -> ejecutaSql($query);
	}

 }

?>