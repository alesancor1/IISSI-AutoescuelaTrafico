<?php
class funciones{

	public static function redirect($controlador=DEFAULT_CONTROLLER,$accion=DEFAULT_ACTION){
        header("Location:index.php?controller=".$controlador."&action=".$accion);
    }
}
?>