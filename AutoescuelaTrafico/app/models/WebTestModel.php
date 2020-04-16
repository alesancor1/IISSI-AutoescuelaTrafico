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
		$dni = $_SESSION["cuenta"][3];
		$query = "SELECT USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) FROM ALUMNOS RIGHT JOIN AccesoWeb ON Alumnos.ACCESOWEB=AccesoWeb.USUARIO WHERE Alumnos.DNI = '$dni'";
		$tablaRecursos = $this->ejecutaSql($query);
		
		//parsing
		if(sizeof($tablaRecursos)==0){
			$tablaRecursos = null;
		} else {
			foreach($tablaRecursos as $num => $accesoWeb){
				$tablaRecursos[$num] = AccesoWeb::__parse("AccesoWeb", $accesoWeb);
				print_r($tablaRecursos);
			}
		}
		return $tablaRecursos;
	}
	
}

?>