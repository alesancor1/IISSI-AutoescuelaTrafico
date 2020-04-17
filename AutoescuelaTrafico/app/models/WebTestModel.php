<?php
class WebTestModel extends BaseModel{
	public $table;

	public function __construct($adapter) {
		$this -> table = "Clases";
		parent::__construct($this -> table, $adapter);
	}
	
	//	ADMINISTRADOR
	
	public function getRecursosAdministrador(){
		// usuario clave fechaCaducidad tiempoRestante ultimaRenovacion
		$query = "SELECT USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) FROM ALUMNOS RIGHT JOIN AccesoWeb ON Alumnos.ACCESOWEB=AccesoWeb.USUARIO";
		$tablaRecursos = $this->ejecutaSql($query);
		if(sizeof($tablaRecursos)==0){
			$tablaRecursos = null;
		} else {
			foreach($tablaRecursos as $num => $accesoWeb){
				$tablaRecursos[$num] = AccesoWeb::__parse("AccesoWeb", $accesoWeb);
			}
		}
		return $tablaRecursos;
	}
	
	//	ALUMNO
	
	public function getInformacionAlumno(){
		$dni = $_SESSION["cuenta"][3];
		$query = "SELECT USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) FROM ALUMNOS RIGHT JOIN AccesoWeb ON Alumnos.ACCESOWEB=AccesoWeb.USUARIO WHERE Alumnos.DNI = '$dni'";
		$datos = $this->ejecutaSql($query);
		if(sizeof($datos)==0){
			$datos = null;
		} else {
			foreach($datos as $num => $accesoWeb){
				$datos[$num] = AccesoWeb::__parse("AccesoWeb", $accesoWeb);
			}
		}
		return $datos;
	}
	
}

?>