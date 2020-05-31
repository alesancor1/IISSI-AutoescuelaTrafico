<?php
class Validator{
	/*SENTENCIA SWITCH PARA VALIDAR CADA FORMULARIO*/
	public static function validate(){
		$formId = $_POST["validateForm"];  //en esta variable viene un Id desde cada formulario del proyecto
		$callback = $_POST["callbackUri"];

		switch ($formId){
			//insert-forms
			case "loginForm":
				$user = array();
				$user["uname"] = $_POST["uname"];
				$user["psw"] = $_POST["psw"];
				//validacion
				$_SESSION["formInput"] = $user;
				break;
			case "anunciosForm":
				$anuncio = array();
				$anuncio["titulo"] = $_POST["titulo"];
				$anuncio["descripcion"] = $_POST["descripcion"];
				//validacion
				$_SESSION["formInput"] = $anuncio;
				break;
			case "alumnosForm":
				$alumno = array();
				$alumno["dni"] = $_POST["dni"];
				$alumno["nombre"] = $_POST["nombre"];
				$alumno["apellidos"] = $_POST["apellidos"];
				$alumno["fechaNacimiento"] = $_POST["fechaNacimiento"];
				$alumno["permiso"] = $_POST["permiso"];
				//validacion
				$_SESSION["formInput"] = $alumno;
				break;
			case "profesorForm":
				$profesor = array();
				$profesor["dni"] = $_POST["dni"];
				$profesor["nombre"] = $_POST["nombre"];
				$profesor["apellidos"] = $_POST["apellidos"];
				$profesor["fechaContrato"] = $_POST["fechaContrato"];
				$profesor["telefono"] = $_POST["telefono"];
				$profesor["salario"] = $_POST["salario"];
				$profesor["nss"] = $_POST["nss"];
				//validacion
				$_SESSION["formInput"] = $profesor;
				break;
			case "talleresForm":
				$taller = array();
				$taller["nombreTaller"] = $_POST["nombreTaller"];
				$taller["direccionTaller"] = $_POST["direccionTaller"];
				$taller["telefono"] = $_POST["telefono"];
				//validacion
				$_SESSION["formInput"] = $taller;
				break;
			case "accesoWebForm":
				$accesoWeb = array();
				$accesoWeb["dni"] = $_POST["dni"];
				//validacion
				$_SESSION["formInput"] = $accesoWeb;
				break;
			case "ordenadoresForm":
				$ordenador = array();
				$ordenador["estadoPc"] = isset($_POST["estadoPc"]) ? $_POST["estadoPc"] : "Nuevo";
				$ordenador["modelo"] = $_POST["modelo"];
				$ordenador["so"] = $_POST["so"];
				//validacion
				$_SESSION["formInput"] = $ordenador;
				break;
			case "usoPcForm":
				$usoPc = array();
				$usoPc["dni"] = $_POST["dni"];
				$usoPc["fechaUso"] = $_POST["fechaUso"];
				$usoPc["horaComienzo"] = $_POST["horaComienzo"];
				$usoPc["horaFin"] = $_POST["horaFin"];
				$usoPc["estadoPc"] = $_POST["estadoPc"];
				$usoPc["oidPc"] = $_POST["oidPc"];
				//validacion
				$_SESSION["formInput"] = $ordenador;
				break;
			//filtros
			case "alumnosFilterProf":
				$filtro = array();
				$filtro["filtro"] = isset($_POST["filtro"]) ? $_POST["filtro"] : "";
				//validacion
				$_SESSION["formFilter"] = $filtro;
				break;
			case "alumnosFilterAdm": //select box (no se valida)
				break;
			case "usoVehiculosFilter":
				$filtro = array();
				$filtro["filtro"] = isset($_POST["filtroUsos"]) ? $_POST["filtroUsos"] : "";
				//validacion
				$_SESSION["formFilter"] = $filtro;
				break;
			case "webTestsFilter":
				$filtro = array();
				$filtro["filtro"] = isset($_POST["filtro"]) ? $_POST["filtro"] : "";
				//validacion
				$_SESSION["formFilter"] = $filtro;
				break;
			case "desgloseFilter":
				$filtro = array();
				$filtro["mes"] = isset($_POST["mes"]) ? $_POST["mes"] : "";
				$filtro["anyo"] = isset($_POST["anyo"]) ? $_POST["anyo"] : "";
				//validacion
				$_SESSION["formFilter"] = $filtro;
				break;
		}
		header("Location:index.php".$callback);
	}
	/*FUNCIONES DE VALIDACION*/
	private function validateDNI($dni){	//validacion de DNI
		$letra = substr($dni,-1);
		$numeroDNI = substr($dni, 0, 8);
		$error = array();

		if(!strlen($dni)==9 || !preg_match("[0-9]{8}[A-Z]", $dni)){
			$error[] = "<p>Introduzca un DNI válido</p>";
		} else if($letra != letraDNI($numeroDNI)){
			$error[] = "<p>El DNI debe contener la letra adecuada</p>";
		} else if($dni == ''){
			$error[] = "<p>Introduzca su DNI</p>";
		}
		return $error;
	}
	private function validateNombre($nombre){
		$error = array();
		if(!preg_match("^[A-Za-z ,.'-]+$", $nombre)){
			$error[] = "<p>Introduzca un nombre válido</p>";
		} else if($nombre == ''){
			$error[] = "<p>Introduzca un nombre</p>";
		}
		return $error;
	}
	private function validateApellidos($apellidos){
		$error = array();
		if(!preg_match("^[A-Za-z ,.'-]+$", $apellidos)){
			$error[] = "<p>Introduzca apellidos válidos</p>";
		} else if($apellidos == ''){
			$error[] = "<p>Introduzca apellidos</p>";
		}
		return $error;
	}
	private function validateTelefono($telefono){
		$error = array();
		if($telefono == ''){
			$error[] = 'introduzca su número de teléfono';
		} else if(!preg_match("[0-9]{9}", $telefono)){
			$error[] = 'el número de teléfono sólo debe contener números';
		} else if(strlen($telefono)>9){
			$error[] = 'Introduzca un número de teléfono con 9 caracteres';
		}
		return $error;
	}
	private function letraDNI($dni){
		$num = $dni % 23;
		$letra = '';
		switch ($num) {
			case 0:
				$letra = "T";
				break;
			case 1:
				$letra = "R";
				break;
			case 2:
				$letra = "W";
				break;
			case 3:
				$letra = "A";
				break;
			case 4:
				$letra = "G";
				break;
			case 5:
				$letra = "M";
				break;
			case 6:
				$letra = "Y";
				break;
			case 7:
				$letra = "F";
				break;
			case 8:
				$letra = "P";
				break;
			case 9:
				$letra = "D";
				break;
			case 10:
				$letra = "X";
				break;
			case 11:
				$letra = "B";
				break;
			case 12:
				$letra = "N";
				break;
			case 13:
				$letra = "J";
				break;
			case 14:
				$letra = "Z";
				break;
			case 15:
				$letra = "S";
				break;
			case 16:
				$letra = "Q";
				break;
			case 17:
				$letra = "V";
				break;
			case 18:
				$letra = "H";
				break;
			case 19:
				$letra = "L";
				break;
			case 20:
				$letra = "C";
				break;
			case 21:
				$letra = "K";
				break;
			case 22:
				$letra = "E";
				break;
		}
		return $letra;
	}

}













?>