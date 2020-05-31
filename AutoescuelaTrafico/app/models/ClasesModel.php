<?php
class ClasesModel extends BaseModel {
	public $table;
	public $method = null; // metodo que va a ejecutarse, necesario para diferenciar el metodo rows()

	public function __construct($adapter) {
		$this -> table = "Clases";
		parent::__construct($this -> table, $adapter);
	}
	
	public function rows(){
		switch($this->method){
			case 'getInformacionAlumno': 
						return $this -> rowNum("SELECT OID_C, C.Fecha, C.HoraInicio, Cantidad FROM Clases C RIGHT JOIN PagoClases PaC ON PaC.OID_PaC = C.PagoClase WHERE DNIALUMNO = '" . $_SESSION["cuenta"][3] . "' AND TO_DATE(CONCAT(CONCAT(TO_CHAR(C.FECHA),':'), TO_CHAR(C.HORAINICIO)),'DD/MM/YYYY HH24:Mi')<SYSDATE ORDER BY OID_C ASC");
						break;

			case 'getTutoriasAlumno':
						return $this -> rowNum("SELECT P.Nombre, P.Apellidos, LIBRES.FECHA, LIBRES.HORA FROM (
					 		(SELECT AUX_T.FECHA,AUX_T.HORA,P.DNI FROM AUX_T, Profesores P)
					 		minus
							(SELECT C.FECHA,C.HORAINICIO,C.dniProfesor FROM CLASES C WHERE C.FECHA>=TRUNC(sysdate))
							) LIBRES
				 			RIGHT JOIN PROFESORES P ON P.DNI = libres.dni");
	 					break;
			default:
				return $this -> rowNum("SELECT * FROM Clases");
		}
	}
	
	//	ADMINISTRADOR
	
		//	Horario
	 
	 public function getGestionAdministrador(){
	 	$query = "SELECT DISTINCT * FROM (SELECT CONCAT(CONCAT(Alumnos.Apellidos,' '), Alumnos.Nombre) AS ALUMNO, DIAS_SIN_DAR_CLASE(Alumnos.DNI) AS diasSinClase, FECHA_ULTIMA_CLASE(Alumnos.DNI) AS fechaUltimaClase, CONCAT(CONCAT(Profesores.Apellidos,' '), Profesores.Nombre) AS PROFESOR FROM Clases LEFT JOIN Alumnos ON Alumnos.DNI = Clases.DNIAlumno LEFT JOIN Profesores ON Profesores.DNI = Clases.DNIProfesor ORDER BY Alumnos.DNI)";
		$tabla = $this->ejecutaSql($query);
		return $tabla;
	 }
	 
	//	PROFESORES
	
		//	Horario
	 
	//	ALUMNOS
	 
	 //info de clases impartidas
	 public function getInformacionAlumno($first = 0, $last = -1){
		$query = "SELECT OID_C, C.Fecha, C.HoraInicio, Cantidad FROM Clases C RIGHT JOIN PagoClases PaC ON PaC.OID_PaC = C.PagoClase WHERE DNIALUMNO = '" . $_SESSION["cuenta"][3] . "' AND TO_DATE(CONCAT(CONCAT(TO_CHAR(C.FECHA),':'), TO_CHAR(C.HORAINICIO)),'DD/MM/YYYY HH24:Mi')<SYSDATE ORDER BY OID_C ASC";
		$clases = $this -> consultaPaginada($query, $first, $last);
		return $clases;
	 }

	 //tutorias
	 public function getTutoriasAlumno($first = 0, $last = -1){
	 	$query = "SELECT P.Nombre, P.Apellidos, LIBRES.FECHA, LIBRES.HORA FROM (
	 		(SELECT AUX_T.FECHA,AUX_T.HORA,P.DNI FROM AUX_T, Profesores P)
	 		minus
			(SELECT C.FECHA,C.HORAINICIO,C.dniProfesor FROM CLASES C WHERE C.FECHA>=TRUNC(sysdate))
			) LIBRES
 			RIGHT JOIN PROFESORES P ON P.DNI = libres.dni";
		$tutorias[] = $this->consultaPaginada($query, $first, $last);	
		return $tutorias;
	 }

}
?>