<?php
class BaseController{
 
    public function __construct() {
        require_once 'Connection.php';
        require_once 'BaseEntity.php';
        require_once 'BaseModel.php';
         
        //Incluye todos los modelos
        foreach(glob("models/*.php") as $file){
            require_once $file;
        }
    }
     
    //Funcionalidades
     
    public function view($vista,$datos){
        foreach ($datos as $id_assoc => $valor) {
            ${$id_assoc}=$valor;
        }
         
        require_once 'core/helpers/ViewHelpers.php';
        $helper=new ViewHelpers();
     
        require_once 'app/view/'.$vista.'View.php';
    }
     
    public function redirect($controlador=DEFAULT_CONTROLLER,$accion=DEFAULT_ACTION){
        header("Location:index.php?controller=".$controlador."&action=".$accion);
    } 
}
?>
