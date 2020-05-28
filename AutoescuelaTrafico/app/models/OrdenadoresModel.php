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
		$query = "SELECT Q.*,ESTADOPC, MODELO FROM (
    		SELECT NOMBRE,APELLIDOS,OID_PC PC,FECHA,HORACOMIENZO,HORAFIN,ROUND(24*(TO_DATE(HORAFIN,'HH24:Mi')-TO_DATE(HORACOMIENZO,'HH24:Mi')),2) TIEMPOUSO FROM ALUMNOS RIGHT JOIN
        	(SELECT * FROM USOPC RIGHT JOIN( SELECT O.OID_PC,MAX(HORACOMIENZO)HORAC,FECHA F FROM USOPC RIGHT JOIN ORDENADORES O ON PC = OID_PC
            RIGHT JOIN (
            SELECT OID_PC,MAX(FECHA)LF FROM USOPC RIGHT JOIN ORDENADORES ON PC = OID_PC GROUP BY OID_PC)PC_ULTFECHA
            ON O.OID_PC=PC_ULTFECHA.OID_PC WHERE FECHA = LF OR FECHA IS NULL GROUP BY O.OID_PC,FECHA) LAST_F
            ON OID_PC=PC WHERE FECHA = F OR FECHA IS NULL) ON DNI = ALUMNO)Q
            LEFT JOIN ORDENADORES ON PC=OID_PC ORDER BY PC";
		$tabla = $this -> ejecutaSql($query);
		return $tabla;
	}
	
	public function insertPc($estadoPc, $modelo, $so){
		$tabla = $this -> ejecutaSql("INSERT INTO Ordenadores (ESTADOPC, MODELO, SO) VALUES ('$estadoPc', '$modelo', '$so')");
	}
	
	public function deletePc($oidPc){
		$tabla = $this->ejecutaSql("DELETE FROM Ordenadores WHERE OID_PC = '$oidPc'");
	}
	
	public function verUsos($oidPc){
		$query = "SELECT OID_U,OID_PC,ESTADOPC,NOMBRE,APELLIDOS,FECHA,HORACOMIENZO,HORAFIN,ROUND(24*(TO_DATE(HORAFIN,'HH24:Mi')-TO_DATE(HORACOMIENZO,'HH24:Mi')),2)
		TIEMPOUSO
		FROM USOPC RIGHT JOIN ORDENADORES ON PC=OID_PC LEFT JOIN ALUMNOS ON ALUMNO=DNI WHERE OID_PC = $oidPc ORDER BY FECHA";
		$table = $this->ejecutaSql($query);
		return $table;
	}
	
	public function addUso($fechaUso, $horaComienzo, $horaFin, $dni, $oidPc, $estadoPc){
		$query = "INSERT INTO UsoPC (FECHA, HORACOMIENZO, HORAFIN, ALUMNO, PC) VALUES (to_date('$fechaUso','YYYY-MM-DD'), '$horaComienzo', '$horaFin', '$dni', $oidPc)";
		$table = $this->ejecutaSql($query);
		
		if($estadoPc!==null){
			$query = "UPDATE Ordenadores SET ESTADOPC = '$estadoPc' WHERE OID_PC = $oidPc";
			$table = $this->ejecutaSql($query);
		}
	}
	
	public function deleteUso($oidU){
		$this->ejecutaSql("DELETE FROM UsoPC WHERE OID_U = $oidU");
	}
}

?>