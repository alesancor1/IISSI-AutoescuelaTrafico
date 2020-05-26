<?php
class ClasesModel extends BaseModel {
	public $table;

	public function __construct($adapter) {
		$this -> table = "Clases";
		parent::__construct($this -> table, $adapter);
	}
	
	public function rows(){
		return $this -> rowNum("SELECT * FROM Clases");
	}
	
	//	ADMINISTRADOR
	
	/* ToDo:
	 * 	- getHorarioAdministrador
	 */
	 
	 public function getGestionAdministrador(){
	 	$query = "SELECT CONCAT(CONCAT(Alumnos.Apellidos,' '), Alumnos.Nombre) AS ALUMNO, DIAS_SIN_DAR_CLASE(Alumnos.DNI) AS diasSinClase, FECHA_ULTIMA_CLASE(Alumnos.DNI) AS fechaUltimaClase, CONCAT(CONCAT(Profesores.Apellidos,' '), Profesores.Nombre) AS PROFESOR FROM Clases LEFT JOIN Alumnos ON Alumnos.DNI = Clases.DNIAlumno LEFT JOIN Profesores ON Profesores.DNI = Clases.DNIProfesor ORDER BY Alumnos.DNI";
		$tabla = $this->ejecutaSql($query);
		return $tabla;
	 }
	 
	//	PROFESORES
	
	/* ToDo:
	 * 	- getHorarioProfesor
	 * 		subfunciones asociadas
	 */ 
	 
	//	ALUMNOS
	 
	 public function getInformacionAlumno(){
		$query = "SELECT OID_C, C.Fecha, C.HoraInicio, Cantidad FROM Clases C RIGHT JOIN PagoClases PaC ON PaC.OID_PaC = C.PagoClase WHERE DNIALUMNO = '" . $_SESSION["cuenta"][3] . "' AND TO_DATE(CONCAT(CONCAT(TO_CHAR(C.FECHA),':'), TO_CHAR(C.HORAINICIO)),'DD/MM/YYYY HH24:Mi')<SYSDATE ORDER BY OID_C ASC";
		$clases[] = $this -> ejecutaSql($query);
		return $clases;
	 }

}
?>