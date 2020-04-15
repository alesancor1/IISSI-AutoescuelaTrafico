<?php
	class ExamenesController extends BaseController{
		public $conectar;
		public $adapter;

		public function __construct(){
			parent::__construct();

			$this-> conectar = new Connection();
			$this-> adapter = $this -> conectar -> conexion();
		}

		public function index(){

			//creamos el objeto 
			$examenes = new ExamenesModel($this->adapter);
			$allExamenes = $examenes->getAllExamenes();
			$this->view("indexExamenes", array("allExamenes"=>$allExamenes));
		}
	}
?>