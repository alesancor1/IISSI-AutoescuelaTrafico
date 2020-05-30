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
		$(".errorPsw").text('Contraseña vacía.');
		
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
			$("#uname").css("border", '1px solid red');
			$("#uname").css("background-color", "#ffeeee");
			$(".errorUName").text("Comillas no válidas");
		}
		// No hay errores
		else {
			error = "";
		}
		// Hay error de exceso de caracteres
	} else {
		error = "El usuario no puede tener más de 20 carácteres.";
			$("#uname").css("border", '1px solid red');
			$("#uname").css("background-color", "#ffeeee");
			$(".errorUName").text("Usuario demasiado largo.");
	}
	return error;
}

