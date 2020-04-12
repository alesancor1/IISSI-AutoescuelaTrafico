<?php
class BaseController{
 
    public function __construct() {
        require_once 'C:/xampp/htdocs/IISSI/AUTOESCUELA/core/Connection.php';
        require_once 'C:/xampp/htdocs/IISSI/AUTOESCUELA/core/templates/BaseEntity.php';
        require_once 'C:/xampp/htdocs/IISSI/AUTOESCUELA/core/templates/BaseModel.php';
         
        //Incluye todos los modelos
        foreach(glob("C:/xampp/htdocs/IISSI/AUTOESCUELA/app/models/*.php") as $file){
            require_once($file);
        }
    }
     
    //Funcionalidades
     
    public function view($vista,$datos){
        // foreach ($datos as $id_assoc => $valor) {
            // ${$id_assoc}=$valor;
        // }
         
         
         
        require_once 'C:/xampp/htdocs/IISSI/AUTOESCUELA/core/helpers/ViewHelpers.php';
        $helper=new ViewHelpers();
     
        require_once 'C:/xampp/htdocs/IISSI/AUTOESCUELA/app/views/'.$vista.'View.php';
    }
     
    public function redirect($controlador=DEFAULT_CONTROLLER,$accion=DEFAULT_ACTION){
        header("Location:index.php?controller=".$controlador."&action=".$accion);
    } 
}
?>
