function validateFormListAlumnosView(){
	var filtro = document.getElementById("filtro");
	var filtroJQuery = $('#filtro');
	
	var checks = validateDNI(filtroJQuery) || 
		filtroJQuery.val().trim()=='' ||
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

