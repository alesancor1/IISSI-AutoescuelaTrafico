<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/popup.css">
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <form action="?controller=Validator&action=validate" class="form-container" method = "post">

                    <h1 class = nuevo>NUEVO ACCESOWEB</h1>

                    <div class = "infoText">
                        <p>Introducir DNI del alumno al que se quiera asignar el nuevo accesoWeb.</p><br>
                        <p>¡Para alumnos a los que les haya caducado el acceso o bien nunca se les hubiese asignado!</p>
                    </div>

                    <div class = "inputText">
                        <label for="titulo"><b>DNI</b></label>
                        <input type="text" placeholder="DNI" name="dni" id="dni" pattern="[0-9]{8}[A-Z]{1}" oninput="validateDNI2();" required>
                    </div>

                    <div class = "botones">
                        <button type="button" class="volver" id='closePopup'> < Volver</button>
                        <button type="submit" class="enviar">Añadir</button>
                    </div>
                    <!-- para el ValidatorPHP -->
                    <input type="hidden" name = "validateForm" value = "accesoWebForm">
                    <input type="hidden" name = "callbackUri" value = "?controller=WebTest&action=enviar">

                </form>

            </div>
             
        </div>

    </body>
</html>