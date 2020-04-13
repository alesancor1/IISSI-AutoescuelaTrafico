<?php
class BaseController{
 
    public function __construct() {
        require_once __DIR__.'/../Connection.php';
        require_once __DIR__.'/BaseEntity.php';
        require_once __DIR__.'/BaseModel.php';
         
        //Incluye todos los modelos
        require_once __DIR__.'/../../app/models/Persona.php'; //clase padre
        foreach(glob(__DIR__."/../../app/models/*.php") as $file){
            require_once $file;
        }
    }
     
    //Funcionalidades
     
    public function view($vista,$datos=array()){
        foreach ($datos as $id_assoc => $valor) {
            ${$id_assoc}=$valor;
        }
         
        require_once __DIR__.'/../helpers/ViewHelpers.php';
        
        if($vista == 'error'){
            require __DIR__.'/../../app/view/'.$vista.'.php';
        }   
        else{
            require_once __DIR__.'/../../app/views/'.$vista.'View.php';
        }  
    }
     
    public function redirect($controlador=DEFAULT_CONTROLLER,$accion=DEFAULT_ACTION){
        header("Location:index.php?controller=".$controlador."&action=".$accion);
    } 
}
?>
