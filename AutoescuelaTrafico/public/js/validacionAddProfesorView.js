function validateFormAddProfesorView(){
	var dni = document.getElementById("dni");
	var nombre = document.getElementById("nombre");
	var apellidos = document.getElementById("apellidos");
	//var fechaContrato = document.getElementById("fechaContrato");
	var telefono = document.getElementById("telefono");
	var salario = document.getElementById("salario");
	var nss = document.getElementById("nss");

	var dniJQuery = $('#dni');
	var nombreJQuery = $('#nombre');
	var apellidosJQuery = $('#apellidos');
	//var fechaContratoJQuery = $('#fechaContrato');
	var telefonoJQuery = $('#telefono');
	var salarioJQuery = $('#salario');
	var nssJQuery = $('#nss');
	
	var resultado = true;
	
	if(!validateDNI(dniJQuery)){
		resultado = false;
		
	}
	if(!validateNombre(nombreJQuery)){
		resultado = false;
	}
	if(!validateApellidos(apellidosJQuery)){
		resultado = false;
	}
	if(!validateTelefono(telefonoJQuery)){
		resultado = false;
	}

		
}





