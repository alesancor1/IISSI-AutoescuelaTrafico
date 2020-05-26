<?php
class TutoriasModel extends BaseModel {
	public $table;

	public function __construct($adapter) {
		$this -> table = "Tutorias";
		parent::__construct($this -> table, $adapter);
	}
	
	public function rows(){
		return $this -> rowNum("SELECT * FROM AUX_T");
	}
	
	//	ALUMNOS
	
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