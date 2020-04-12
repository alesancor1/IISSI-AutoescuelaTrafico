<?php
//Configuracion global
require_once 'app/config/globals.php';

//Controlador base
require_once 'core/templates/BaseControler.php';

//Funciones de enrutacion
require_once 'core/routes.php';

//Si hay algun controlador lo cargamos, si no cargamos el por defecto
if(isser($_GET["controller"])){
	$controllerOBJ = loadController($_GET["controller"]);
	doAction($controllerObj);
}
else{
	$controllerObj = loadController(DEFAULT_CONTROLLER);
	doAction($controllerObj);
}
?>