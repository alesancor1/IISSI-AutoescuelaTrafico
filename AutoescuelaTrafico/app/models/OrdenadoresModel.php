<?php
class OrdenadoresModel extends BaseModel{
	public $table;

	public function __construct($adapter) {
		$this -> table = "Ordenadores";
		parent::__construct($this -> table, $adapter);
	}
	
	public function rows(){
		return $this -> rowNum("SELECT * FROM Ordenadores");
	}
	
	//	ADMINISTRADOR
	
	public function getRecursosOrdenadores(){
		$query = "SELECT O.OID_PC PC,ESTADOPC,NOMBRE,APELLIDOS,FECHA,HORACOMIENZO,HORAFIN,ROUND(24*(TO_DATE(HORAFIN,'HH24:Mi')-TO_DATE(HORACOMIENZO,'HH24:Mi')),2) TIEMPOUSO 
			FROM USOPC RIGHT JOIN ORDENADORES O ON PC = OID_PC RIGHT JOIN (
			SELECT O.OID_PC,MAX(HORACOMIENZO)HORAC,FECHA F FROM USOPC RIGHT JOIN ORDENADORES O ON PC = OID_PC
			RIGHT JOIN (
			SELECT OID_PC,MAX(FECHA)LF FROM USOPC RIGHT JOIN ORDENADORES ON PC = OID_PC GROUP BY OID_PC)PC_ULTFECHA
			ON O.OID_PC=PC_ULTFECHA.OID_PC WHERE FECHA = LF GROUP BY O.OID_PC,FECHA) PC_ULTFECHA_HORA
			ON O.OID_PC=PC_ULTFECHA_HORA.OID_PC LEFT JOIN ALUMNOS ON DNI = ALUMNO WHERE FECHA = F AND HORACOMIENZO = HORAC ORDER BY O.OID_PC";
		$tabla = $this -> ejecutaSql($query);
		return $tabla;
	}
	
}

?>