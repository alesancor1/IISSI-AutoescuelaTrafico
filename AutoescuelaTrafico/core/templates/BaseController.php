<?php
class BaseController{
 
    public function __construct() {
        require_once __DIR__.'/../Connection.php';
        require_once __DIR__.'/BaseEntity.php';
        require_once __DIR__.'/BaseModel.php';
         
        //Incluye todos los modelos
        require_once __DIR__.'/Enum.php';
		require_once __DIR__.'/../entities/Vehiculo.php';
        require_once __DIR__.'/../entities/Persona.php';
		require_once __DIR__.'/../entities/Examen.php';
		require_once __DIR__.'/../entities/Practico.php';
        foreach(glob(__DIR__."/../entities/*.php") as $file){
            require_once $file;
        }
        foreach(glob(__DIR__."/../../app/models/*.php") as $file){
            require_once $file;
        }
    }
     
    //Funcionalidades
     
    public function view($vista,$datos=array()){
        foreach ($datos as $id_assoc => $valor) {
            ${$id_assoc}=$valor;
        }
                 
        if($vista == 'error'){
            require_once __DIR__.'/../../app/views/'.$vista.'.php';
        }   
        else{
            require_once __DIR__.'/../../app/views/'.$vista.'View.php';
            if(isset($_SESSION["cuenta"]) && $_GET["controller"]!=DEFAULT_CONTROLLER)
                require_once __DIR__.'/../../app/views/layouts/menubar.php';
        }  
    }
}
?>
