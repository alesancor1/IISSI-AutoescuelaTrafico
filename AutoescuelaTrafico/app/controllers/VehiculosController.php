<?php
class VehiculosController extends BaseController{
	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}
	
	//	ADMINISTRADOR
	
	public function getUsosYTalleres(){
		$usos = new VehiculosModel($this->adapter);
		$usos = $usos -> getUsosPorAlumno();
		
		$usosPorAlumno = array();
		
		foreach($usos as $uso){
			$id = $uso -> APELLIDOS . ", " . $uso -> NOMBRE;
			$usosPorAlumno[$id][] = $uso;
		}
		
		//	Poner la consulta de los talleres
		
		$this -> view("/vehiculos/usosYTalleres", array("usosPorAlumno" => $usosPorAlumno));
		
	}
	
}
?>