<?php
class Validator{
	/*SENTENCIA SWITCH PARA VALIDAR CADA FORMULARIO*/
	public static function validate(){
		$formId = $_POST["validateForm"];  //en esta variable viene un Id desde cada formulario del proyecto
		$callback = $_POST["callbackUri"];
		$callbackError = $_POST["callbackError"];

		$errors = array();
		switch ($formId){
			//insert-forms
			case "loginForm":
				$user = array();
				$user["uname"] = $_POST["uname"];
				$user["psw"] = $_POST["psw"];
				$_SESSION["formInput"] = $user;
				//validacion
				$errors = array_merge($errors, Validator::validateText($user));
				break;
			case "anunciosForm":
				$anuncio = array();
				$anuncio["titulo"] = $_POST["titulo"];
				$anuncio["descripcion"] = $_POST["descripcion"];
				$_SESSION["formInput"] = $anuncio;
				//validacion
				$errors = array_merge($errors, Validator::validateText($anuncio));
				break;
			case "alumnosForm":
				$alumno = array();
				$alumno["dni"] = $_POST["dni"];
				$alumno["nombre"] = $_POST["nombre"];
				$alumno["apellidos"] = $_POST["apellidos"];
				$alumno["fechaNacimiento"] = $_POST["fechaNacimiento"];
				$alumno["permiso"] = $_POST["permiso"];
				$_SESSION["formInput"] = $alumno;
				//validacion
				$errors = array_merge($errors, Validator::validateText($alumno));
				$errors = array_merge($errors, Validator::validateDNI($alumno["dni"]));
				$errors = array_merge($errors, Validator::validateNombre($alumno["nombre"]));
				$errors = array_merge($errors, Validator::validateApellidos($alumno["apellidos"]));
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
				$_SESSION["formInput"] = $profesor;
				//validacion
				$errors = array_merge($errors, Validator::validateText($profesor));
				$errors = array_merge($errors, Validator::validateDNI($profesor["dni"]));
				$errors = array_merge($errors, Validator::validateNombre($profesor["nombre"]));
				$errors = array_merge($errors, Validator::validateApellidos($profesor["apellidos"]));
				$errors = array_merge($errors, Validator::validateTelefono($profesor["telefono"]));
				$errors = array_merge($errors, Validator::validateSalario($profesor["salario"]));
				$errors = array_merge($errors, Validator::validateNSS($profesor["nss"]));
				break;
			case "talleresForm":
				$taller = array();
				$taller["nombreTaller"] = $_POST["nombreTaller"];
				$taller["direccionTaller"] = $_POST["direccionTaller"];
				$taller["telefono"] = $_POST["telefono"];
				$_SESSION["formInput"] = $taller;
				//validacion
				$errors = array_merge($errors, Validator::validateText($taller));
				$errors = array_merge($errors, Validator::validateTelefono($taller["telefono"]));
				break;
			case "accesoWebForm":
				$accesoWeb = array();
				$accesoWeb["dni"] = $_POST["dni"];
				$_SESSION["formInput"] = $accesoWeb;
				//validacion
				$errors = array_merge($errors, Validator::validateText($accesoWeb));
				$errors = array_merge($errors, Validator::validateDNI($accesoWeb["dni"]));
				break;
			case "ordenadoresForm":
				$ordenador = array();
				$ordenador["estadoPc"] = isset($_POST["estadoPc"]) ? $_POST["estadoPc"] : "Nuevo";
				$ordenador["modelo"] = $_POST["modelo"];
				$ordenador["so"] = $_POST["so"];
				$_SESSION["formInput"] = $ordenador;
				//validacion
				$errors = array_merge($errors, Validator::validateText($ordenador));
				break;
			case "usoPcForm":
				$usoPc = array();
				$usoPc["dni"] = $_POST["dni"];
				$usoPc["fechaUso"] = $_POST["fechaUso"];
				$usoPc["horaComienzo"] = $_POST["horaComienzo"];
				$usoPc["horaFin"] = $_POST["horaFin"];
				$usoPc["estadoPc"] = $_POST["estadoPc"];
				$usoPc["oidPc"] = $_POST["oidPc"];		
				$_SESSION["formInput"] = $usoPc;
				//validacion
				$errors = array_merge($errors, Validator::validateText($usoPc));
				$errors = array_merge($errors, Validator::validateDNI($usoPc["dni"]));
				break;
			//filtros
			case "alumnosFilterProf":
				$filtro = array();
				$filtro["filtro"] = isset($_POST["filtro"]) ? $_POST["filtro"] : "";
				$_SESSION["formFilter"] = $filtro;
				//validacion
				$errors = array_merge($errors, Validator::validateText($filtro));
				break;
			case "alumnosFilterAdm": //select box (no se valida)
				break;
			case "usoVehiculosFilter":
				$filtro = array();
				$filtro["filtro"] = isset($_POST["filtroUsos"]) ? $_POST["filtroUsos"] : "";				
				$_SESSION["formFilter"] = $filtro;
				//validacion
				$errors = array_merge($errors, Validator::validateText($filtro));
				break;
			case "webTestsFilter":
				$filtro = array();
				$filtro["filtro"] = isset($_POST["filtro"]) ? $_POST["filtro"] : "";
				$_SESSION["formFilter"] = $filtro;
				//validacion
				$errors = array_merge($errors, Validator::validateText($filtro));
				break;
			case "desgloseFilter":
				$filtro = array();
				$filtro["mes"] = isset($_POST["mes"]) ? $_POST["mes"] : "";
				$filtro["anyo"] = isset($_POST["anyo"]) ? $_POST["anyo"] : "";
				$_SESSION["formFilter"] = $filtro;
				//validacion
				$errors = array_merge($errors, Validator::validateText($filtro));
				break;
		}
		if(count($errors)>0){
			$_SESSION["errores"] = $errors;
			header("Location:index.php".$callbackError);
		}
		else
			header("Location:index.php".$callback);
	}
	/*FUNCIONES DE VALIDACION*/
	private function validateText($textArr){
		$error = array();
		foreach ($textArr as $text) {
			if(preg_match("/'+/", $text) || preg_match('/"+/', $text)){
				$error[] = "<p>El campo de texto no debe contener comillas</p>";
				break;
			}
		}
		return $error;
	}
	private function validateDNI($dni){	//validacion de DNI
		$letra = substr($dni,-1);
		$numeroDNI = substr($dni, 0, 8);
		$error = array();

		if(!strlen($dni)==9 || !preg_match("/[0-9]{8}[A-Z]/", $dni)){
			$error[] = "<p>Introduzca un DNI válido</p>";
		} else if($letra != Validator::letraDNI($numeroDNI)){
			$error[] = "<p>El DNI debe contener la letra adecuada</p>";
		} else if($dni == ''){
			$error[] = "<p>Introduzca su DNI</p>";
		}
		return $error;
	}
	private function validateNombre($nombre){
		$error = array();
		if(!preg_match("/^[A-Za-z ,.'-]+$/", $nombre)){
			$error[] = "<p>Introduzca un nombre válido</p>";
		} else if($nombre == ''){
			$error[] = "<p>Introduzca un nombre</p>";
		}
		return $error;
	}
	private function validateApellidos($apellidos){
		$error = array();
		if(!preg_match("/^[A-Za-z ,.'-]+$/", $apellidos)){
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
		} else if(!preg_match("/[0-9]{9}/", $telefono)){
			$error[] = 'el número de teléfono sólo debe contener números';
		} else if(strlen($telefono)>9){
			$error[] = 'Introduzca un número de teléfono con 9 caracteres';
		}
		return $error;
	}

	private function validateAnyo($anyo){
    $error = array();

    if($anyo <= 1900){
        $error[] = "<p>Años a partir de 1900.</p>";
    } else if($anyo > date("Y")){
        $error[] = "<p>Años anteriores al año actual.</p>";
    } else if(!preg_match("/[0-9]{4}/", $anyo)){
        $error[] = "<p>Utilice un formato adecuado para el año introducido.</p>";
    }
    return $error;
	}

	private function validateSalario($salario){
	    $error = array();

	    if(salario==''){
	        $error[] = "<p>Inserte un valor para el salario.</p>";
	    } else if(!preg_match("/^[0-9]{0,4}$/", $salario)){
	        $error[] = "<p>El salario ha de ser positivo y estar comprendido entre 0 y 5000.</p>";
	    }
	    return $error;
	}

	private function validateNSS($nss){
	    $error = array();

	    if($nss==''){
	        $error[] = "<p>Inserte un número de la Seguridad Social.</p>";
	    } else if(!preg_match("/[0-9]{2} [0-9]{10}/", $nss)){
	        $error[] = "<p>Formato incorrecto, compruebe el dato introducido.</p>";
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