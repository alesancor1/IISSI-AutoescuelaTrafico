<!DOCTYPE HTML>
<html>
	<head>
	    <link rel="icon" href="./favicon.ico"/>
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
</html>

<?php
//Configuracion global
require_once __DIR__.'/../app/config/globals.php';

//helpers
require_once __DIR__.'/../core/helpers/funciones.php';
require_once __DIR__.'/../core/helpers/Paginator.php';

//Controlador base
require_once __DIR__.'/../core/templates/BaseController.php';

//Funciones de enrutacion
require_once __DIR__.'/../core/routes.php';

//Error Handler
require_once __DIR__.'/../core/ErrorHandler.php';

//Si hay algun controlador lo cargamos, si no cargamos el por defecto
if(!isset($_SESSION))
	session_start();

if(isset($_POST['logout']))
	unset($_SESSION["cuenta"]);

if(isset($_GET["controller"])){
	$controllerObj = loadController($_GET["controller"]);
	doAction($controllerObj);
}
else{
	$controllerObj = loadController(DEFAULT_CONTROLLER);
	doAction($controllerObj);
}
?>