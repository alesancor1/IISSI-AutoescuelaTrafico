<!DOCTYPE html>
<html>
<head>
	<!-- PERSONALIZAR ESTE CSS -->
    <link rel="stylesheet" type="text/css" href="./css/popup.css">
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <h1 class ="nuevo">NUEVO PROFESOR</h1>
                
                <form class="addProfesorForm" id="addProfesorForm" action="?controller=Profesores&action=addProfesor" class="form-container" method = "post">
					
					<div class="inputText">
						<label for="dni"><b>DNI</b></label>
						<input type="text" placeholder="Inserte el DNI" name="dni" id="dni" pattern="[0-9]{8}[A-Z]{1}" oninput="validateDNI2();" required>
					</div>
					
					<div class="inputText">
						<label for="nombre"><b>Nombre</b></label>
						<input type="text" placeholder="Introduzca el nombre" name="nombre" id="nombre" maxlength="20" oninput="validateNombre2();" required>
					</div>
					
                    <div class = "inputText">
                        <label for="apellidos"><b>Apellidos</b></label>
                        <input type="text" placeholder="Inserte los apellidos" name="apellidos" id="apellidos" maxlength="30" oninput="validateApellidos2();" required>
                    </div>
                    
                    <div class = "inputDate">
                        <label for="fechaContrato"><b>Fecha de contrato</b></label>
                        <input type="date" name="fechaContrato" id="fechaContrato" required>
                    </div>
                    
                    <div class = "inputText">
                        <label for="telefono"><b>Nº de teléfono</b></label>
                        <input type="text" placeholder="Inserte el nº de tlf." name="telefono" id="telefono" pattern="[0-9]{9}" oninput="validateTelefono();"required>
                    </div>
                    
                    <div class = "inputText">
                        <label for="salario"><b>Salario</b></label>
                        <input type="text" placeholder="Inserte el salario" name="salario" id="salario" max="5000" required>
                    </div>
                    
                    <div class = "inputText">
                        <label for="nss"><b>Nº de la Seguridad Social</b></label>
                        <input type="text" placeholder="Inserte el Nº SS" name="nss" id="nss" pattern="[0-9]{2} [0-9]{10}" required>
                    </div>

                    <div class = "botones">
                        <button type="button" class="volver" id='closePopup'> < Volver</button>
                        <button type="submit" class="enviar">Enviar</button>
                    </div>

                </form>

            </div>
             
        </div>

    </body>
</html>