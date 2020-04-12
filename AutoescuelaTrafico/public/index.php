<?php
//Configuracion global
require_once("C:/xampp/htdocs/IISSI/AUTOESCUELA/app/config/globals.php");

//Controlador base
require_once 'C:/xampp/htdocs/IISSI/AUTOESCUELA/core/templates/BaseController.php';

//Funciones de enrutacion
require_once 'C:/xampp/htdocs/IISSI/AUTOESCUELA/core/routes.php';

//Si hay algun controlador lo cargamos, si no cargamos el por defecto
if(isset($_GET["controller"])){
	$controllerOBJ = loadController($_GET["controller"]);
	doAction($controllerObj);
}
else{
	$controllerObj = loadController(DEFAULT_CONTROLLER);
	doAction($controllerObj);
}
?>