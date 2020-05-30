<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/popup.css">
    <script src="./js/validationAddAlumno.js" type="text/javascript"></script>
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <h1 class = nuevo>NUEVO ALUMNO</h1>
                
                <form id="addAlum" action="?controller=Alumnos&action=enviar" class="form-container" method = "post">

                    <div class = "inputText">
                        <label for="titulo"><b>DNI</b></label>
                        <input id="dni" type="text" placeholder="DNI" name="dni" pattern="[0-9]{8}[A-Z]{1}" required>
                    </div>

                    <div class = "inputText">
                        <label for="nombre"><b>NOMBRE</b></label>
                        <input type="text" placeholder="Nombre del alumno" name="nombre" maxlength="20" required>
                    </div>
                    
                    <div class = "inputText">
                        <label for="apellidos"><b>APELLIDOS</b></label>
                        <input type="text" placeholder="Apellidos del alumno" name="apellidos" maxlength="30" required>
                    </div>
                    
                    <div class = "inputDate">
                        <label for="fechaNacimiento"><b>Fecha de Nacimiento</b></label>
                        <input type="date" name="fechaNacimiento" required>
                    </div>
                    
                    <div class = "select">
                        <label for="permiso"><b>Permiso</b></label>
                        <select id="permiso" name="permiso">
                        	<option disabled selected value="">Seleccionar permiso</option>
                        	<option value="Permiso A2">Permiso A2</option>
                        	<option value="Permiso B">Permiso B</option>
                        </select>
                    </div>
                    
                    <div class = "select">
                        <label for="oferta"><b>Oferta</b></label>
                        <select id="oferta" name="oferta">
                        	<option disabled selected value="">Seleccionar oferta</option>
                        	<option value="1">Oferta 1</option>
                        	<option value="2">Oferta 2</option>
                        </select>
                    </div>

                    <div class = "botones">
                        <button type="button" class="volver" id='closePopup'> < Volver</button>
                        <button type="submit" class="enviar">Añadir</button>
                    </div>

                </form>

            </div>
             
        </div>
        
        <script type="text/javascript">
			// Inicialización de elementos y eventos cuando el documento se carga completamente
			$(document).ready(function() {
				console.log("AEGAE");
				$("#addAlum").submit(function() {
					return validateForm();
				});
			});
		</script>

    </body>
</html>