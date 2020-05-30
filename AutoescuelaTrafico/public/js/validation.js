function validateForm() {
	

	var error2 = unameValidation();

	var error1 = passwordValidation();
	
	return (error1.length == 0) && (error2.length == 0);
	

}

// EJERCICIO 3.1: Comprobar la restricciones del password y aplicar clases CSS mediante JQuery
function passwordValidation() {
	var password = document.getElementById("pass");
	var pwd = password.value;
	var valid = true;

	// Comprobamos la longitud de la contraseña
	valid = valid && (pwd.length >= 0);

	// Si no cumple las restricciones, devolvemos un error
	if (!valid) {
		var error = "Please enter a valid password! Length >= 0.";
	} else {
		var error = "";
	}
	password.setCustomValidity(error);
	return error;
}

function unameValidation() {
	var name = document.getElementById("uname");
	var nombre = name.value;

	var valid = true;
	
	valid = valid && (nombre.length <= 20);

	if (valid) {
					
		var hasCaracterRaro = /"/;
		valid = valid && !hasCaracterRaro.test(nombre);
		if (!valid){
			var error = "No uses carácteres inválidos como las comillas.";
			
}
		else{	
			var error = "";
			
			
		}
	} else
		
		var error = "El usuario no puede tener más de 20 carácteres.";
	name.setCustomValidity(error);
	return error;
}

