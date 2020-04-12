<?php

class AlumnosController extends BaseController {

	public $conectar;
	public $adapter;

	public function __construct() {
		parent::__construct();

		$this -> conectar = new Connection();
		$this -> adapter = $this -> conectar -> conexion();
	}
	
	public function index(){
		
		//Creamos el objeto alumno
		$alumno = new Alumno($this->adapter);
		
		//Conseguimos todos los alumnos
		$allAlumnos = $alumno->getAll();
        
        //Cargamos la vista index y le pasamos valores
        $this->view("index",array(
            "allAlumnos"=>$allAlumnos,
            "Hola"    =>"Soy Víctor Robles"
        ));
    }
     
    public function crear(){
        if(isset($_POST["Nombre"])){
             
            //Creamos un alumno
            $alumno=new Usuario($this->adapter);
			$alumno->setDni($_POST["DNI"]);
            $alumno->setNombre($_POST["Nombre"]);
            $alumno->setApellidos($_POST["Apellido"]);
            $alumno->setTelefono($_POST["Telefono"]);
			$alumno->setFechaNacimiento($_POST["FechaNacimiento"]);
			$alumno->setClasesPagadas($_POST["ClasesPagadas"]);
			$alumno->setRMedico($_POST["RMedico"]);
            $save=$alumno->save();
        }
        $this->redirect("Alumnos", "index");
    }
     
    public function borrar(){
        if(isset($_GET["DNI"])){
            $id=(int)$_GET["DNI"];
             
            $alumno=new Alumno($this->adapter);
            $alumno->deleteById($id);
        }
        $this->redirect();
    }
     
     
    public function hola(){
        $usuarios=new UsuariosModel($this->adapter);
        $usu=$usuarios->getUnUsuario();
        var_dump($usu);
    }

}
?>