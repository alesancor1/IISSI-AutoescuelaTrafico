<!DOCTYPE html>
<html>
<head>
	<!-- PERSONALIZAR ESTE CSS -->
    <link rel="stylesheet" type="text/css" href="./css/popup.css">
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <h1 class ="nuevo">NUEVO TALLER</h1>
                
                <form action="?controller=Validator&action=validate" class="form-container" method = "post">
					
					<div class="inputText">
						<label for="nombreTaller"><b>Nombre del taller</b></label>
						<input type="text" placeholder="Inserte el nombre" name="nombreTaller" id="nombreTaller" maxlength="20" required>
					</div><br>
					
					<div class="inputText">
						<label for="direccionTaller"><b>Dirección del taller</b></label>
						<input type="text" placeholder="Introduzca la dirección" name="direccionTaller" id="direccionTaller" maxlength="20" required>
					</div><br>
					
                    <div class = "inputText">
                        <label for="telefono"><b>Nº de teléfono</b></label>
                        <input type="text" placeholder="Inserte el número de teléfono" name="telefono" id="telefono" pattern="[0-9]{9}" oninput="validateTelefono();" required>
                    </div><br>

                    <div class = "botones">
                        <button type="button" class="volver" id='closePopup'> < Volver</button>
                        <button type="submit" class="enviar">Enviar</button>
                    </div>
                    <!-- para el ValidatorPHP -->
                    <input type="hidden" name = "validateForm" value = "talleresForm">
                    <input type="hidden" name = "callbackUri" value = "?controller=Vehiculos&action=addTaller">

                </form>

            </div>
             
        </div>

    </body>
</html>