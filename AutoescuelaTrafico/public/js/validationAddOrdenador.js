var exprTildes = /[!@#$%^&*(),.?":{}|'<>]/;

function validationModeloPc(){
	document.getElementById('modelo').style.cssText = "background-color: #DBF1FF;";
	var model = document.getElementById("modelo");
	var modelo = model.value;
	
	var error;
	console.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
	if(!(modelo.length <= 25)){
		error = "+25 carácteres no permitido.";
		document.getElementById('modelo').style.cssText = "background-color: #FF8989;";
	}
	else if(exprTildes.test(modelo)){
		error = "Se han usado carácteres no permitidos.";
		document.getElementById('modelo').style.cssText = "background-color: #FF8989;";
	} else if(modelo.length == 0) {
		error = "No puede ser vacio.";
		document.getElementById('modelo').style.cssText = "background-color: #FF8989;";
	} else {
		error = "";
		document.getElementById('modelo').style.cssText = "background-color: #DBF1FF;";
	}
	
	model.setCustomValidity(error);
	return (error==0);
}

function validationSO(){
	document.getElementById('so').style.cssText = "background-color: #DBF1FF;";
	var sistema = document.getElementById("so");
	var so = sistema.value;
	
	var error;
	if(!(so.length <= 25)){
		error = "+25 carácteres no permitido.";
		document.getElementById('so').style.cssText = "background-color: #FF8989;";
	}
	else if(exprTildes.test(so)){
		error = "Se han usado carácteres no permitidos.";
		document.getElementById('so').style.cssText = "background-color: #FF8989;";
	} else if(so.length == 0) {
		error = "No puede ser vacio.";
		document.getElementById('so').style.cssText = "background-color: #FF8989;";
	} else {
		error = "";
		document.getElementById('so').style.cssText = "background-color: #DBF1FF;";
	}
	
	sistema.setCustomValidity(error);
	return (error==0);
}
