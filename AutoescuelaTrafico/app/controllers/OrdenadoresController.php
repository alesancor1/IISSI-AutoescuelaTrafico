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
	
	public function addPc(){
		$ordenadores = new OrdenadoresModel($this -> adapter);
		$ordenador = $_SESSION["formInput"];
		$addOrdenador = $ordenadores->insertPc($ordenador["estadoPc"], $ordenador["modelo"], $ordenador["so"]);
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
	
	public function addUso(){
		$usos = new OrdenadoresModel($this->adapter);
		$uso = $_SESSION["formInput"];
		$addUso = $usos->addUso($uso["fechaUso"], $uso["horaComienzo"], $uso["horaFin"], $uso["dni"], $uso["oidPc"], isset($uso["estadoPc"]) ? $uso["estadoPc"] : null);
		$this->verUsos();
	}
	
	public function deleteUsos(){
		$usos = new OrdenadoresModel($this->adapter);
		
		foreach($_POST as $num => $oidU){
			$borraUso = $usos->deleteUso($oidU);
		}
		$this->verUsos();
	}
	
}
?>