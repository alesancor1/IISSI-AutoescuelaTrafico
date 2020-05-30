function validateForm(){
	var noValidation= document.getElementById("#login").novalidate;
	
	if(!noValidation){
		var error1 = userValidation();
		var error2 = passwordValidation();
		
		return (error1.length==0) && (error2.length==0);
	}
	else{
		return true;
	}
}

function userValidation() {
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
		}
		// No hay errores
		else {
			error = "";
		}
		// Hay error de exceso de caracteres
	} else {
		error = "El usuario no puede tener más de 20 carácteres.";
	}
	
	name.setCustomValidity(error);
	
	return error;
}

function passwordValidation() {
	var password = document.getElementById("psw");

	var pwd = password.value;
	var valid = true;

	// Comprobamos la longitud de la contraseña
	valid = valid && (pwd.length > 0);

	// Si no cumple las restricciones, devolvemos un error
	if (!valid) {
		var error = 'Por favor, introduzca una contraseña! El campo no puede estar vacio';
		
	} else {
		var error = "";
	}
	password.setCustomValidity(error);
	return error;
}