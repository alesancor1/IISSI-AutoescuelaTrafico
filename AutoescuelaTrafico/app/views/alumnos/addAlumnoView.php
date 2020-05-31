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
                
                <form id="addAlum" action="?controller=Validator&action=validate" class="form-container" method = "post">

                    <div class = "inputText">
                        <label for="titulo"><b>DNI</b></label>
                        <input id="dni" type="text" placeholder="DNI" name="dni" pattern="[0-9]{8}[A-Z]{1}"  required oninput="validateDNI();">
                        <!-- Para validaciones -->
                        <p class="validateDni" id ="validateDni"></p>
                    </div>

                    <div class = "inputText">
                        <label for="nombre"><b>NOMBRE</b></label>
                        <input id="nom" type="text" placeholder="Nombre del alumno" name="nombre" maxlength="20" required oninput="nombreValidation();">
                        <!-- Para validaciones -->
                        <p class="validateNombre"></p>
                    </div>
                    
                    <div class = "inputText">
                        <label for="apellidos"><b>APELLIDOS</b></label>
                        <input id="apell" type="text" placeholder="Apellidos del alumno" name="apellidos" maxlength="30" required oninput="apellidosValidation();">
                        <!-- Para validaciones -->
                        <p class="validateApellidos"></p>
                    </div>
                    
                    <div class = "inputDate">
                        <label for="fechaNacimiento"><b>Fecha de Nacimiento</b></label>
                        <input type="date" name="fechaNacimiento">
                    </div>
                    
                    <div class = "select">
                        <label for="permiso"><b>Permiso</b></label>
                        <select id="permiso" name="permiso">
                        	<option disabled selected>Seleccionar permiso</option>
                        	<option value="Permiso A2">Permiso A2</option>
                        	<option value="Permiso B">Permiso B</option>
                        </select>
                    </div>

                    <div class = "botones">
                        <button type="button" class="volver" id='closePopup'> < Volver</button>
                        <button type="submit" class="enviar">Añadir</button>
                    </div>
                    <!-- para el ValidatorPHP -->
                    <input type="hidden" name = "validateForm" value = "alumnosForm">
                    <input type="hidden" name = "callbackUri" value = "?controller=Alumnos&action=enviar">
                </form>

            </div>
             
        </div>
        
    </body>
</html>
