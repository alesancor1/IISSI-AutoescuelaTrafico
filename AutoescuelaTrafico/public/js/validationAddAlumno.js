function validateForm() {

	var error1 = dniValidation();
	//var error2 = nombreValidation();
	//var error3 = apellidosValidation();
	//var error4 = fechaValidation();
	var error5 = permisoOfertaValidation();
	//var error6 = ofertaValidation();

	return ((error1.length == 0) && (error5.length == 0));
	//return ((error1.length == 0) && (error2.length == 0) && (error3.length == 0) && (error4.length == 0) && (error5.length == 0) && (error6.length == 0));

}

function dniValidation(){
	var dni = document.getElementById("dni");
	var d = dni.value;
	var hasCaracterRaro = /[A-Z]/;
	
	if(d == ""){
		var error = "ERROR";
		$("#dni").css("border", '1px solid red');
		$("#dni").css("background-color", "#ffeeee");
		$("#dni").text('DNI vacío.');
	}
	if(hasCaracterRaro.test(d)){
		var error = "ERROR";
		$("#dni").css("border", '1px solid red');
		$("#dni").css("background-color", "#ffeeee");
		$("#dni").text('DNI vacío.');
	}
	else error = "";
	return error;
}

function permisoOfertaValidation(){
	
	var permiso = document.getElementById("permiso");
	var perm = documentacion.value;
	var oferta = documento.getElementById("oferta");
	var of = documentacion.value;
	
	if(perm == ""){
		var error = "ERROR";
		$("#permiso").css("border", '1px solid red');
		$("#permiso").css("background-color", "#ffeeee");
		$("#permiso").text('Contraseña vacía.');
	}
	else if(of == ""){
		var error = "ERROR";
		$("#oferta").css("border", '1px solid red');
		$("#oferta").css("background-color", "#ffeeee");
		$("#oferta").text('Contraseña vacía.');
	}
	else error = "";
	
	return error;
}
