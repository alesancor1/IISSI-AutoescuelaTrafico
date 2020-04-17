<?php
class AnunciosController extends BaseController {
	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}

	public function index() {
		$anuncios = new AnunciosModel($this -> adapter);
		$allAnuncios = $anuncios -> getAll();
		
		$this -> view("/anuncios/indexAnuncios", array("allAnuncios"=>$allAnuncios));
	}

	public function enviar(){
		$anuncios = new AnunciosModel($this -> adapter);
		$insertarAnuncios = $anuncios -> insert($_POST["titulo"],$_POST["descripcion"]);
		funciones::redirect("Anuncios");
	}

}
?>