<?php
class ViewHelpers{
     
    public static function url($controlador=DEFAUL_CONTROLLER,$accion=DEFAULT_ACTION){
        $urlString="index.php?controller=".$controlador."&action=".$accion;
        return $urlString;
    }
     
    //mas posibles funciones para ayudar a las vistas
}
?>