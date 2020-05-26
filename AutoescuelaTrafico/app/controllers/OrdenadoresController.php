<?php
class OrdenadoresController extends BaseController{
	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}
	
	//	ADMINISTRADOR
	
	public function indexRecursosOrdenadores(){
		$ordenadores = new OrdenadoresModel($this -> adapter);
		$recursosOrdenadores = $ordenadores -> getRecursosOrdenadores();
		$this -> view("/ordenadores/indexOrdenadoresAdmin", array("recursosOrdenadores" => $recursosOrdenadores));
	}
	
}

?>