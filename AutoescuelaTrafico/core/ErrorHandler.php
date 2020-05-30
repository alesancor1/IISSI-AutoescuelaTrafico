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
			$sesion = isset($_SESSION["cuenta"]) ? $_SESSION["cuenta"][2] : null;
			switch($controller){
				case "AdministracionController":
					if($sesion != "Administrador")
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					break;

				case "AlumnosController":
					if($sesion == "Alumno")
						BaseController::view("error",array("tipo"=>"wrongLogin"));

					elseif($sesion != "Administrador" && 
						  ($action == "listaCalificacionesAdmin" || $action == "listaAdministrador" || $action == "enviar" || $action == "borrar"))
						BaseController::view("error",array("tipo"=>"wrongLogin"));

					elseif($sesion != "Profesor" && 
						  ($action == "listaProfesor" || $action == "listaCalificacionesProfesor"))
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					break;

				case "AnunciosController":
					if($sesion == "Alumno" && $action== "enviar")
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					break;

				case "ClasesController":
					if($sesion!="Administrador" && $action=="indexGestion")
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					break;

				case "ExamenesController": 
					if($sesion!="Alumno")
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					break;

				case "LoginController":
					if($sesion != null)
						funciones::redirect();
					break;

				case "OrdenadoresController":
					if($sesion != "Administrador")
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					if($action == "verUsos" && !isset($_POST["oidPc"]))
						funciones::redirect("Ordenadores");
					break;

				case "ProfesoresController":
					if($sesion != "Administrador")
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					break;

				case "VehiculosController":
					if($sesion != "Administrador")
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					break;

				case "WebTestController":
					if($sesion == "Alumno" && $action != "indexInformacionWebTest")
						BaseController::view("error",array("tipo"=>"wrongLogin"));

					elseif($sesion == "Profesor")
						BaseController::view("error",array("tipo"=>"wrongLogin"));
					break;

				//unimplemented
				case "MensajesController":
				case "HorarioController":
						BaseController::view("error",array("tipo"=>"notImplemented"));
				break;

			}
		}
	}

	public static function DBChecker($exception){
		$First = "ORA-200";
		$Second = "ORA-06";


		$Firstpos=strpos($exception, $First)+11;
		$Secondpos=strpos($exception, $Second)-$Firstpos-1;

		$exception = substr($exception , $Firstpos, $Secondpos);
		$exception = utf8_encode ($exception);

		$uri = "?controller=".$_GET["controller"];

		if($_GET["controller"]=="Alumnos")
			$uri .= "&action=listaAdministrador";

		elseif($_GET["controller"]=="Profesores")
			$uri .= "&action=indexProfesoradoInformacion";

		elseif($_GET["controller"]=="Vehiculos")
			$uri .= "&action=getUsosYTalleres";

		elseif($_GET["controller"]=="WebTest")
			$uri .= "&action=indexRecursosWebTest";

		echo "<script>
			  alert('".$exception."');
		      window.location.href='".$uri."';
			 </script>";	
	}
}
?>