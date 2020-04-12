<?php
//FUNCIONES PARA EL FRONT CONTROLLER (index.php)

function loadController($controller){
	$controller = ucwords($controller).'Controller';
	$strFileController=__DIR__.'/../app/controllers/'.$controller.'.php';

	if(!is_file($strFileController)){
		$strFileController=__DIR__.'/../app/controllers/'.ucwords(DEFAULT_CONTROLLER).'Controller.php';
	}

	require_once $strFileController;
	$controllerObj = new $controller();
	return $controllerObj;
}
function loadAction($controllerObj, $action){
	$action = $action;
	$controllerObj->$action();
}

function doAction($controllerObj){
	if(isset($_GET["action"]) && method_exists($controllerObj, $_GET["action"])){
		loadAction($controllerObj, $_GET["action"]);
	}
	else{
		loadAction($controllerObj, DEFAULT_ACTION);
	}
}
?>