<?php
class BaseController{
 
    public function __construct() {
        require_once __DIR__.'/../Connection.php';
        require_once __DIR__.'/BaseEntity.php';
        require_once __DIR__.'/BaseModel.php';
         
        //Incluye todos los modelos
        require_once __DIR__.'/Enum.php';
		require_once __DIR__.'/../entities/Vehiculo.php';
        require_once __DIR__.'/../entities/Persona.php'; //clase padre
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
            require_once __DIR__.'/../../app/view/'.$vista.'.php';
        }   
        else{
            require_once __DIR__.'/../../app/views/'.$vista.'View.php';
        }  
    }
}
?>
