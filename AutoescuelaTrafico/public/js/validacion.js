var exprDNI = /[0-9]{8}[A-Z]/;
var exprTildes = /^[A-Za-záéíóúÁÉÍÓÚ\s]+$/;
var exprNombreApellidos = /^[A-Za-z ,.'-]+$/;
var exprNumero = /[0-9]{9}/;

function validateFormListAlumnosView(){
	var filtro = document.getElementById("filtro");
	var filtroValue = filtro.value.trim();

	var numeroDNI = filtroValue.substr(0, 8);
	var letra = filtroValue.substr(-1);
	
	var dniCheck = true;
	var error = '';
	if(!(exprDNI.test(filtroValue))){
		dniCheck = false;
	} else if(letra!=letraDNI(numeroDNI)){
		dniCheck = false;
	} else if(filtroValue==''){
		dniCheck = false;
	}

	var nombreCheck = true;
	if(!exprTildes.test(filtroValue)){
		nombreCheck = false;
	} else if(!exprNombreApellidos.test(filtroValue)){
		nombreCheck = false;
	}

	var apellidosCheck = true;
	if(!exprTildes.test(filtroValue)){
		apellidosCheck = false;
	} else if(!exprNombreApellidos.test(filtroValue)){
		apellidosCheck = false;
	}

	var lengthCheck = filtroValue.length<30;

	var resCheck = (dniCheck || nombreCheck || apellidosCheck) && lengthCheck;

	if(!resCheck) {
		error = "Búsqueda no válida. Compruebe la válidez del DNI o del nombre o apellidos introducidos.";
		filtro.setCustomValidity(error);
	}

	return error;
}

function validateDNI2(){
	var dni = document.getElementById("dni");
	var dniValue = dni.value;
	
	var numeroDNI = dniValue.substr(0, 8);
	var letra = dniValue.substr(-1);
	
	var resultado = true;
	var error;
	if (!(dniValue.length == 9) || (!exprDNI.test(dniValue))) {
		error = "Introduzca un DNI válido";
		$("#dni").css("border", '1px solid red');
		$("#dni").css("background", '#ffeeee');
		resultado = false;
	} else if (letra != letraDNI(numeroDNI)) {
		error = "El DNI debe contener la letra adecuada";
		$("#dni").css("border", '1px solid red');
		$("#dni").css("background", '#ffeeee');
		resultado = false;
	} else if(dniValue==''){
		error = 'Introduzca su DNI';
		$("#dni").css("border", '1px solid red');
		$("#dni").css("background", '#ffeeee');
		resultado = false;
	} else {
		error = "";
	}
	dni.setCustomValidity(error);
	return error;
}

function validateNombre2(){
	var nombre = document.getElementById("nombre");
	var nombreValue = nombre.value;

	var resultado = true;
	var error;
	
	if(!exprTildes.test(nombreValue)){
		error = "Introduzca un nombre válido.";
		$("#nombre").css("border", '1px solid red');
		$("#nombre").css("background", '#ffeeee');
		resultado = false;
	} else if(!exprNombreApellidos.test(nombreValue)){
		error = "Introduzca un nombre válido.";
		$("#nombre").css("border", '1px solid red');
		$("#nombre").css("background", '#ffeeee');
		resultado = false;
	} else {
		error = "";
	}
	nombre.setCustomValidity(error);
	return resultado;
}

function validateApellidos2(){
	var apellidos = document.getElementById("apellidos");
	var apellidosValue = apellidos.value;

	var resultado = true;
	var error;
	
	if(!exprTildes.test(apellidosValue)){
		error = 'Introduzca unos apellidos válidos.';
		$("#apellidos").css("border", '1px solid red');
		$("#apellidos").css("background", '#ffeeee');
		resultado = false;
	} else if(!exprNombreApellidos.test(apellidosValue)){
		error = 'Introduzca unos apellidos válidos.';
		$("#apellidos").css("border", '1px solid red');
		$("#apellidos").css("background", '#ffeeee');
		resultado = false;
	} else {
		error = '';
	}
	apellidos.setCustomValidity(error);
	return resultado;
}

function validateTelefono(){
	var telefono = document.getElementById("telefono");
	var telefonoValue = telefono.value.trim();
	
	var error;
	var resultado = true;
	
	if (telefonoValue == '') {
		error = 'Introduzca su número de teléfono.';
		$("#telefono").css("border", '1px solid red');
		$("#telefono").css("background", '#ffeeee');
		resultado = false;
	} else if (!exprNumero.test(telefonoValue)) {
		error = 'Un número de teléfono solo puede contener números.';
		$("#telefono").css("border", '1px solid red');
		$("#telefono").css("background", '#ffeeee');
		resultado = false;
	} else if (telefonoValue.length < 9) {
		error = 'Introduzca un número de teléfono correcto';
		$("#telefono").css("border", '1px solid red');
		$("#telefono").css("background", '#ffeeee');
		resultado = false;
	} else {
		error = "";
	}
	telefono.setCustomValidity(error);
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