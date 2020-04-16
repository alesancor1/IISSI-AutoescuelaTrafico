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
		$query = "SELECT Usuario, ClavePorDefecto, FechaRenovacion, FechaCaducidad, TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) FROM Alumnos A RIGHT JOIN AccesoWeb ON AccessoWeb = Usuario WHERE A.DNI = " . $_SESSION["cuenta"][3] . "ORDER BY Usuario";
		$tablaRecursos = $this->ejecutaSql($query);
		
		//parsing
		if(sizeof($tablaRecursos)==0){
			$tablaRecursos = null;
		} else {
			foreach($tablaRecursos as $num => $accesoWeb){
				$tablaRecursos[$num] = AccesoWeb::__parse("AccesoWeb", $accesoWeb);
			}
		}
		return $tablaRecursos;
	}
	
}

?>