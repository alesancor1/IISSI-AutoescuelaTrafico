<?php
class WebTestModel extends BaseModel{
	public $table;
	public $method = null;

	public function __construct($adapter) {
		$this -> table = "WebTest";
		parent::__construct($this -> table, $adapter);
	}
	
	public function rows(){
		switch($this->method){
			case 'getRecursosAdministrador':
				return $this->rowNum("SELECT USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) FROM ALUMNOS RIGHT JOIN ACCESOWEB ON ALUMNOS.ACCESOWEB=ACCESOWEB.USUARIO");
				break;
			
			case 'getInformacionAlumno':
				return $this->rowNum("SELECT USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) FROM ALUMNOS RIGHT JOIN AccesoWeb ON Alumnos.ACCESOWEB=AccesoWeb.USUARIO WHERE Alumnos.DNI = '" . $_SESSION['cuenta'][3] . "'");
				break;
				
			default:
				return $this -> rowNum("SELECT * FROM WebTest");
		}
	}
	
	//	ADMINISTRADOR
	
		//	Hay que paginar
	public function getRecursosAdministrador($first = 0, $last = -1){
		// usuario clave fechaCaducidad tiempoRestante ultimaRenovacion
		$filtroPorUsuario = isset($_POST["filtro"]) ? $_POST["filtro"] : "";
		$query = "SELECT USUARIO,CLAVEPORDEFECTO,FECHARENOVACION,FECHACADUCIDAD,TRUNC(FECHACADUCIDAD)-TRUNC(SYSDATE) FROM ALUMNOS RIGHT JOIN ACCESOWEB ON ALUMNOS.ACCESOWEB=ACCESOWEB.USUARIO";
		$query = "SELECT * FROM ($query) Q WHERE Q.USUARIO LIKE '%$filtroPorUsuario%'";
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
	
	public function insertAccesoWeb($accesoWeb){
		 //solo si el alumno esta creado y tiene accesoWeb a null(caducado o no tiene asignado)
		$query = "UPDATE ALUMNOS SET ACCESOWEB='$accesoWeb' WHERE DNI = '$accesoWeb'";
		$this -> ejecutaSql($query);
	}
	
	public function renovacionAccesoWeb($accesoWeb) {
		$this->db()->beginTransaction();
		$this->ejecutaSql("DELETE FROM ACCESOWEB WHERE USUARIO ='$accesoWeb'");
		$query = "UPDATE ALUMNOS SET ACCESOWEB='$accesoWeb' WHERE DNI = '$accesoWeb'";
		$this->ejecutaSql($query);
		$this->db()->commit();
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