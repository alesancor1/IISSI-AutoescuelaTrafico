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

		//inicializacion del paginador
		if(!isset($_SESSION["paginator"])) 
			$_SESSION["paginator"] = new Paginator();
		$paginator = $_SESSION["paginator"];
		$paginator->__init($anuncios);

		//llamada al metodo de consulta
		$allAnuncios = $anuncios -> getAll($paginator->_start, $paginator->_end);
		
		//renderiza la vista pasandole el array de anuncios
		$this -> view("/anuncios/indexAnuncios", array("allAnuncios"=>$allAnuncios));
	}

	public function enviar(){
		$anuncios = new AnunciosModel($this -> adapter);
		$insertarAnuncios = $anuncios -> insert($_POST["titulo"],$_POST["descripcion"]);
		funciones::redirect("Anuncios");
	}
}
?>