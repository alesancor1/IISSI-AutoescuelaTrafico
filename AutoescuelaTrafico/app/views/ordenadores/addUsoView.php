<!DOCTYPE html>
<html>
<head>
	<!-- PERSONALIZAR ESTE CSS -->
    <link rel="stylesheet" type="text/css" href="./css/popup.css">
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <h1 class ="nuevo">AÑADIR USO</h1>
                
                <form action="?controller=Ordenadores&action=addUso" class="form-container" method = "post">
					
					<div class="inputText">
						<label for="dni"><b>DNI del alumno</b></label>
						<input type="text" placeholder="99999999X" name="dni" id="dni" pattern="[0-9]{7}[A-Z]{1}" oninput="validateDNI2();">
					</div>
					
					<div class="inputDate">
						<label for="fechaUso"><b>Fecha de uso</b></label>
						<input type="date" name="fechaUso" required>
					</div>
					
					<div class="inputTime">
						<label for="horaComienzo"><b>Hora de comienzo</b></label>
						<input type="time" name="horaComienzo" required>
					</div>
					
					<div class="inputTime">
						<label for="horaFin"><b>Hora de fin</b></label>
						<input type="time" name="horaFin" required>
					</div>
					
					<div class="select">
						<label for="estadoPc"><b>Nuevo estado del PC</b></label>
						<select id="estadoPc" name="estadoPc">
							<option disabled selected>Seleccione el estado</option>
							<option value="Nuevo">Nuevo</option>
							<option value="BuenEstado">Buen estado</option>
							<option value="Aceptable">Aceptable</option>
							<option value="MalEstado">Mal estado</option>
						</select>
					</div>
					
					<?php
						if($verUsos!=null){
							echo "<input type='hidden' name='oidPc' id='oidPc' value='" . $verUsos[0]->OID_PC . "'>";
						}
					?>
					
                    <div class = "botones">
                        <button type="button" class="volver" id='closePopup'> < Volver</button>
                        <button type="submit" class="enviar">Enviar</button>
                    </div>

                </form>

            </div>
             
        </div>

    </body>
</html>