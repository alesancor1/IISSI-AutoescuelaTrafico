<?php
class WebTestModel extends BaseModel{
	public $table;

	public function __construct($adapter) {
		$this -> table = "Clases";
		parent::__construct($this -> table, $adapter);
	}
	
	public function rows(){
		return $this -> rowNum("SELECT * FROM WebTest");
	}
	
	//	ADMINISTRADOR
	
		//	Hay que paginar
	public function getRecursosAdministrador($first = 0, $last = -1){
		// usuario clave fechaCaducidad tiempoRestante ultimaRenovacion
		$filtroPorUsuario = isset($_POST["filtro"]) ? $_POST["filtro"] : "";
		$query = "SELECT USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) FROM ALUMNOS RIGHT JOIN ACCESOWEB ON ALUMNOS.ACCESOWEB=ACCESOWEB.USUARIO";
		$tablaRecursos = $this->ejecutaSql($query);
		//$tablaRecursos = $this -> consultaPaginada($query, $first, $last);
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