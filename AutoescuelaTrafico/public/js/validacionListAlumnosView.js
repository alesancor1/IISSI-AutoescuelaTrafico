var exprDNI = /[0-9]{8}[A-Z]/;
var exprTildes = /^[A-Za-záéíóúÁÉÍÓÚ\s]+$/;
var exprNombreApellidos = /^[A-Za-z ,.'-]+$/;


function validateFormListAlumnosView(){
	var filtro = document.getElementById("filtro");
	var filtroJQuery = $('#filtro');
	
	var checks = validateDNI(filtroJQuery) || 
		validateNombre(filtroJQuery) || 
		validateApellidos(filtroJQuery);

	var lengthCheck = filtroJQuery.val().trim().length<30;
	if(checks && lengthCheck){
		filtroJQuery.css("border", '1px solid green');
		filtroJQuery.css("background", '#C5FFDF');
	} else {
		filtroJQuery.css("border", '1px solid red');
		filtroJQuery.css("background", '#ffeeee');
	}
	
	return checks && lengthCheck;
}

function validateDNI(dni){
	var valueCheck = dni.val().trim();
	
	var numeroDNI = valueCheck.substr(0, 8);
	var letra = valueCheck.substr(-1);
	
	var resultado = true;
	if(valueCheck!=''){
		if (!(valueCheck.length == 9) || (!exprDNI.test(valueCheck))) {
			//dni.setCustomValidity('Introduzca un DNI válido');
			resultado = false;
		} else if (letra != letraDNI(numeroDNI)) {
			//dni.setCustomValidity('El DNI debe contener la letra adecuada');
			resultado = false;
		} else {
			//Todo BIEN
			//dni.setCustomValidity("");
			//$('#dni').css("background-color", "white");
		}
	}
	return resultado;
}

function validateNombre(nombre){
	var valueCheck = nombre.val().trim();
	
	var resultado = true;
	if(!exprTildes.test(valueCheck)){
		//nombre.setCustomValidity("Introduzca un nombre válido.");
		resultado = false;
	} else if(!exprNombreApellidos.test(valueCheck)){
		//nombre.setCustomValidity("Introduzca un nombre válido.");
		resultado = false;
	} else {
		//	Todo BIEN
		//nombre.setCustomValidity("");
		//$('#nombre').css("background-color", "white");
	}
	return resultado;
}

function validateApellidos(apellidos){
	var valueCheck = apellidos.val().trim();
	
	var resultado = true;
	if(!exprTildes.test(valueCheck)){
		//apellidos.setCustomValidity('Introduzca unos apellidos válidos.');
		resultado = false;
	} else if(!exprNombreApellidos.test(valueCheck)){
		//apellidos.setCustomValidity('Introduzca unos apellidos válidos.');
		resultado = false;
	} else {
		//	Todo BIEN
		// apellidos.setCustomValidity("");
		// $('#apellidos').css("background-color", "white");
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