function validateForm() {

	var error1 = passwordValidation();
	var error2 = unameValidation();

	console.log((error1.length == 0) && (error2.length == 0));
	return ((error1.length == 0) && (error2.length == 0));

}

function passwordValidation() {
	var password = document.getElementById("pass");

	var pwd = password.value;
	console.log(pwd);
	var valid = true;

	// Comprobamos la longitud de la contraseña
	valid = valid && (pwd.length > 0);

	// Si no cumple las restricciones, devolvemos un error
	if (!valid) {
		var error = 'Please enter a valid password! Length >= 0.';
		$("#pass").css("border", '1px solid red');
		$("#pass").css("background-color", "#ffeeee");
		$("#pass").attr("placeholder", 'Inserte de nuevo la contraseña.');
		
	} else {
		var error = "";

	}

	return error;
}

function unameValidation() {
	var name = document.getElementById("uname");
	var nombre = name.value;

	var error;
	var valid = true;

	valid = valid && (nombre.length <= 20);

	// Caracteres excesivos
	if (valid) {

		var hasCaracterRaro = /"/;
		valid = valid && !hasCaracterRaro.test(nombre);

		// No hay error de caracteres no permitidos
		if (!valid) {
			error = "No uses carácteres inválidos, las comillas.";
			$("#uname").css("background-color", "red");
		}
		// No hay errores
		else {
			error = "";
		}
		// Hay error de exceso de caracteres
	} else {
		error = "El usuario no puede tener más de 20 carácteres.";
		$("#uname").css("background-color", "red");
	}
	return error;
}

// function insertarAlumno(){
// function validacionInsertarAlumno(){
//
// var exprDNI = /[0-9]{8}[A-Z]/;
// var dni = document.getElementById("dni");
// var numeroDNI = dni.value.substr(0, 8);
// var letra = dni.value.substr(-1);
//
// var resultado = true;
// if ($('#dni').val() == '') {
// dni.setCustomValidity('Introduzca su DNI');
// $('#dni').css("background-color", "red");
// resultado = false;
// } else if (!($('#dni').val().trim().length == 9) || (!exprDNI.test($('#dni').val().trim()))) {
// dni.setCustomValidity('Introduzca un DNI válido');
// $('#dni').css("background-color", "red");
// resultado = false;
// } else if (letra != letraDNI(numeroDNI)) {
// dni.setCustomValidity('El DNI debe contener la letra adecuada');
// $('#dni').css("background-color", "red");
// resultado = false;
// } else {
// dni.setCustomValidity("");
// $('#dni').css("background-color", "black");
// }
// //fin dni
// return resultado;
// }
// $('.enviar').click(function(){
// validacionInsertarAlumno();
// })
//
// }
//
//
//
// //Funcion para calcular la letra del DNI
// function letraDNI(numeroDNI) {
// var numero = numeroDNI % 23;
// var letra = "";
// switch (numero) {
// case 0:
// letra = "T";
// break;
// case 1:
// letra = "R";
// break;
// case 2:
// letra = "W";
// break;
// case 3:
// letra = "A";
// break;
// case 4:
// letra = "G";
// break;
// case 5:
// letra = "M";
// break;
// case 6:
// letra = "Y";
// break;
// case 7:
// letra = "F";
// break;
// case 8:
// letra = "P";
// break;
// case 9:
// letra = "D";
// break;
// case 10:
// letra = "X";
// break;
// case 11:
// letra = "B";
// break;
// case 12:
// letra = "N";
// break;
// case 13:
// letra = "J";
// break;
// case 14:
// letra = "Z";
// break;
// case 15:
// letra = "S";
// break;
// case 16:
// letra = "Q";
// break;
// case 17:
// letra = "V";
// break;
// case 18:
// letra = "H";
// break;
// case 19:
// letra = "L";
// break;
// case 20:
// letra = "C";
// break;
// case 21:
// letra = "K";
// break;
// case 22:
// letra = "E";
// break;
//
// }
//
// return letra;
// }

