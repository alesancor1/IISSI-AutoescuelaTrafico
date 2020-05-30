<?php
class VehiculosModel extends BaseModel{
	public $table;

	public function __construct($adapter) {
		$this -> table = "Vehiculos";
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
		$this -> ejecutaSql("INSERT INTO Talleres (NOMBRE, DIRECCION, TELEFONO) VALUES ('$nombreTaller', '$direccionTaller', '$telefonoTaller')");
	}
	
	public function deleteTaller($nombreTaller, $direccionTaller, $telefonoTaller){
		$query = "DELETE FROM Talleres WHERE NOMBRE = '$nombreTaller' AND DIRECCION = '$direccionTaller' AND TELEFONO = '$telefonoTaller'";
		$this -> ejecutaSql($query);
	}
	
	public function getInfoVehiculos(){
		$query = "SELECT MODELO,MATRICULA,ESTADO,TIPOSEGURO,F AS FECHA,REVISION,TIPOCUOTA,IMPORTECUOTA FROM TURISMOS LEFT JOIN SEGUROSTURISMOS ON MATRICULA=TURISMO
				  LEFT JOIN(
    					SELECT TURISMO,F,REVISION FROM ITVTURISMOS LEFT JOIN
        					(SELECT TURISMO T,MAX(FECHA)F FROM ITVTURISMOS GROUP BY TURISMO) ON T = TURISMO WHERE FECHA = F
    					)ITV ON ITV.TURISMO = MATRICULA
    	UNION
				  SELECT MODELO,MATRICULA,ESTADO,TIPOSEGURO,F AS FECHA,REVISION,TIPOCUOTA,IMPORTECUOTA FROM MOTOCICLETAS LEFT JOIN SEGUROSMOTOCICLETAS ON MATRICULA=MOTOCICLETA
				  LEFT JOIN(
    					SELECT MOTOCICLETA,F,REVISION FROM ITVMOTOCICLETAS LEFT JOIN
        					(SELECT MOTOCICLETA T,MAX(FECHA)F FROM ITVMOTOCICLETAS GROUP BY MOTOCICLETA) ON T = MOTOCICLETA WHERE FECHA = F
    					)ITV ON ITV.MOTOCICLETA = MATRICULA";
		
		$tabla = $this-> ejecutaSql($query);
		return $tabla;
	}
	
	public function getReparacionesVehiculos(){
		$query = "SELECT FECHA,DESCRIPCION,COSTE,TALLER,TURISMO AS MATRICULA FROM REPARACIONESTURISMOS
    				UNION
				  SELECT FECHA,DESCRIPCION,COSTE,TALLER,MOTOCICLETA AS MATRICULA FROM REPARACIONESMOTOCICLETAS";
				  
		$tabla = $this->ejecutaSql($query);
		return $tabla;
	}
	
 }

?>