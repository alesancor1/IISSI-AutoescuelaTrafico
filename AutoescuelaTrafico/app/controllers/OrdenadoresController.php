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
	public function addPc(){
		$ordenadores = new OrdenadoresModel($this -> adapter);
		$addOrdenador = $ordenadores->insertPc($_POST["estadoPc"], $_POST["modelo"], $_POST["so"]);
		funciones::redirect("Ordenadores");
	}
	
	public function deletePc(){
		$ordenadores = new OrdenadoresModel($this -> adapter);
		$deleteOrdenador = $ordenadores->deletePc($_POST["oidPc"]);
		funciones::redirect("Ordenadores");
	}
	
	public function verUsos(){
		$usos = new OrdenadoresModel($this->adapter);
		$verUsos = $usos->verUsos($_POST["oidPc"]);
		$this -> view("/ordenadores/usosPc", array("verUsos" => $verUsos));
	}
	
}
?>