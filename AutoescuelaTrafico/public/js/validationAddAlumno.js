var exprTildes = /[!@#$%^&*(),.?":{}|'<>]/;

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

	entrada.style.cssText = "background-color: #f1f1f1";
	$(".validateDni").text('');

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

	nombre.style.cssText = "background-color: #f1f1f1";
	ensenya.text('');

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
	}
	else if (exprTildes.test(valueCheck)) {
		error = "Carácteres inválidos.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('Carácteres inválidos.');
	} 
	else {
		error = "";
	}
	return resultado;
}

function apellidosValidation() {
	var apellidos = document.getElementById("apell");
	var valueCheck = apellidos.value;
	var ensenya = $(".validateApellidos");
	var campo = $("#apell");

	apellidos.style.cssText = "background-color: #f1f1f1";
	ensenya.text('');

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
	} else if (exprTildes.test(valueCheck)) {
		error = "Carácteres inválidos.";
		campo.css("border", '1px solid red');
		campo.css("background-color", "#ffeeee");
		ensenya.text('Carácteres inválidos.');
	} 
	else {
		error = "";
	}
	return resultado;
}