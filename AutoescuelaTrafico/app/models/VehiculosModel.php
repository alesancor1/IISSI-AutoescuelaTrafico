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
		$query = "SELECT NOMBRE,APELLIDOS,MODELO,MATRICULA,ESTADO FROM ALUMNOCONDUCETURISMOS LEFT JOIN TURISMOS ON TURISMO = MATRICULA LEFT JOIN ALUMNOS ON DNI = ALUMNO
			UNION
			SELECT NOMBRE,APELLIDOS,MODELO,MATRICULA,ESTADO FROM ALUMNOCONDUCEMOTOCICLETAS LEFT JOIN MOTOCICLETAS ON MOTOCICLETA = MATRICULA LEFT JOIN ALUMNOS ON DNI = ALUMNO";
		$tabla = $this->ejecutaSql($query);
		return $tabla;
	}

 }

?>