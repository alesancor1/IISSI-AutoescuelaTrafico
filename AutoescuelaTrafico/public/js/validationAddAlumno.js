var exprDNI = /[0-9]{8}[A-Z]/;
var exprTildes = /^[A-Za-záéíóúÁÉÍÓÚ\s"]+$/;
var exprNombreApellidos = /^[A-Za-z ,.'-]+$/;

function validateFormAddAlumno() {

	var error1 = validateDNI();
	var error2 = nombreValidation();
	var error3 = apellidosValidation();

	return (error1.length == 0) && (error2.length == 0) && (error3.length == 0);

}

function validateDNI() {
	var entrada = document.getElementById("dni");
	var valueCheck = entrada.value;
	var dni = $("#dni");
	var numeroDNI = valueCheck.substr(0, 8);
	var letra = valueCheck.substr(-1);
	var error;

	var resultado = true;
	if (valueCheck != '') {

		if (!(valueCheck.length == 9) || (!exprDNI.test(valueCheck))) {
			//dni.setCustomValidity('Introduzca un DNI válido');
			error = "Formato de dni no válido.";
			dni.css("border", '1px solid red');
			dni.css("background-color", "#ffeeee");
			$(".validateDni").text('Formato de dni no válido.');
		} else if (letra != letraDNI(numeroDNI)) {
			//dni.setCustomValidity('El DNI debe contener la letra adecuada.');
			error = "Dni erroneo, no existe.";
			dni.css("border", '1px solid red');
			dni.css("background-color", "#ffeeee");
			$(".validateDni").text('Dni erroneo, no existe.');
		} else
			error = "";
	} else {
		error = "Entrada requerida.";
		dni.css("border", '1px solid red');
		dni.css("background-color", "#ffeeee");
		$(".validateDni").text('Entrada requerida.');
	}

	return error;
}

function nombreValidation() {
	var nombre = document.getElementById("nom");
	var valueCheck = nombre.value;
	var ensenya = $(".validateNombre");
	var campo = $("#nom");

	var resultado = true;
	if (valueCheck == '') {
		error = "Nombre vacío.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('No puede ser vacío.');
	} else if (valueCheck.length >= 21) {
		error = "+20 carácteres no permitido";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('+20 carácteres no permitido');
	}else if (!exprTildes.test(valueCheck)) {
		error = "Carácteres inválidos.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('Carácteres inválidos.');
	} else if (!exprNombreApellidos.test(valueCheck)) {
		error = "Carácteres inválidos.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('Carácteres inválidos.');
	} else {
		error = "";
	}
	return resultado;
}

function apellidosValidation() {
	var apellidos = document.getElementById("apell");
	var valueCheck = apellidos.value;
	var ensenya = $(".validateApellidos");
	var campo = $("#apell");

	var resultado = true;
	if (valueCheck == '') {
		error = "Nombre vacío.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('No puede ser vacío.');
	} else if (valueCheck.length >= 31) {
		error = "+30 carácteres no permitido.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('+30 carácteres no permitido.');
	} else if (!exprTildes.test(valueCheck)) {
		error = "Carácteres inválidos.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('Carácteres inválidos.');
	} else if (!exprNombreApellidos.test(valueCheck)) {
		error = "Carácteres inválidos.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('Carácteres inválidos.');
	} else {
		error = "";
	}
	return resultado;
}

function letraDNI(numeroDNI) {
	var numero = numeroDNI % 23;
	var letra = "";
	switch (numero) {
	case 0:
		letra = "T";
		break;
	case 1:
		letra = "R";
		break;
	case 2:
		letra = "W";
		break;
	case 3:
		letra = "A";
		break;
	case 4:
		letra = "G";
		break;
	case 5:
		letra = "M";
		break;
	case 6:
		letra = "Y";
		break;
	case 7:
		letra = "F";
		break;
	case 8:
		letra = "P";
		break;
	case 9:
		letra = "D";
		break;
	case 10:
		letra = "X";
		break;
	case 11:
		letra = "B";
		break;
	case 12:
		letra = "N";
		break;
	case 13:
		letra = "J";
		break;
	case 14:
		letra = "Z";
		break;
	case 15:
		letra = "S";
		break;
	case 16:
		letra = "Q";
		break;
	case 17:
		letra = "V";
		break;
	case 18:
		letra = "H";
		break;
	case 19:
		letra = "L";
		break;
	case 20:
		letra = "C";
		break;
	case 21:
		letra = "K";
		break;
	case 22:
		letra = "E";
		break;
	}
	return letra;
}
