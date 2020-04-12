<?php
//Configuracion global
require_once __DIR__.'/../app/config/globals.php';

//Controlador base
require_once __DIR__.'/../core/templates/BaseController.php';

//Funciones de enrutacion
require_once __DIR__.'/../core/routes.php';

//Si hay algun controlador lo cargamos, si no cargamos el por defecto
if(isset($_GET["controller"])){
	$controllerObj = loadController($_GET["controller"]);
	doAction($controllerObj);
}
else{
	$controllerObj = loadController(DEFAULT_CONTROLLER);
	doAction($controllerObj);
}
?>