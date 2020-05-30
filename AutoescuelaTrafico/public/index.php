<?php
header('Content-Type: text/html; charset=utf-8');
?>

<!DOCTYPE HTML>
<html>
	<head>
	    <link rel="icon" href="./favicon.ico"/>
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       	<link rel="stylesheet" href="./css/paginatorButtons.css">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script>
    	<script src="./js/validacion.js" type="text/javascript"></script>
		<script src="./js/validationLogin.js" type="text/javascript"></script>
		
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