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
	
	public function index(){
		$ordenadores = new OrdenadoresModel($this -> adapter);
		$recursosOrdenadores = $ordenadores -> getRecursosOrdenadores();
		$this -> view("/ordenadores/indexOrdenadoresAdmin", array("recursosOrdenadores" => $recursosOrdenadores));
	}
	
		//	REVISAR, funciona en la BBDD (se ve en el sqldeveloper) pero no lo muestra en la pagina de ninguna forma (recargar, cache, reiniciar, logout, etc)
	public function add(){
		$ordenadores = new OrdenadoresModel($this -> adapter);
		$addOrdenador = $ordenadores->insert($_POST["estadoPc"], $_POST["modelo"], $_POST["so"]);
		funciones::redirect("Ordenadores");
	}
	
	public function delete(){
		$ordenadores = new OrdenadoresModel($this -> adapter);
		$deleteOrdenador = $ordenadores->delete($_POST["oidPc"]);
		funciones::redirect("Ordenadores");
	}
	
}
?>