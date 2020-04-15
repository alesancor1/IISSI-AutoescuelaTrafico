<?php
class ErrorHandler{

	//modificaciones en la URI
	public static function check($controller = DEFAULT_CONTROLLER, $action = DEFAULT_ACTION){

		if(!isset($_SESSION["cuenta"])){
			if($controller != DEFAULT_CONTROLLER."Controller" && $controller != "LoginController"){
				BaseController::view("error",array("tipo"=>"notLoggedIn"));
			}
		}
		else{
			$sesion = $_SESSION["cuenta"][2];
			switch($controller){
				case "ExamenesController": BaseController::view("error",array("tipo"=>"wrongLogin"));break;
			}
		}
	}
}
?>