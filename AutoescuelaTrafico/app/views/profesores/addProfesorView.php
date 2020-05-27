<!DOCTYPE html>
<html>
<head>
	<!-- PERSONALIZAR ESTE CSS -->
    <link rel="stylesheet" type="text/css" href="./css/addAnunciosView.css">
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <h1 class ="nuevo">NUEVO PROFESOR</h1>
                
                <form action="?controller=Profesores&action=addProfesor" class="form-container" method = "post">
					
					<div class="dni">
						<label for="dni"><b>DNI</b></label>
						<input type="text" placeholder="Inserte el DNI" name="dni" id="dni" required>
					</div>
					
					<div class="nombre">
						<label for="nombre"><b>Nombre</b></label>
						<input type="text" placeholder="Introduzca el nombre" name="nombre" id="nombre" required>
					</div>
					
                    <div class = "apellidos">
                        <label for="apellidos"><b>Apellidos</b></label>
                        <input type="text" placeholder="Inserte los apellidos" name="apellidos" id="apellidos" required>
                    </div>
                    
                    <div class = "fechaContrato">
                        <label for="fechaContrato"><b>Fecha de contrato</b></label>
                        <input type="date" name="fechaContrato" id="fechaContrato" required>
                    </div>
                    
                    <div class = "telefono">
                        <label for="telefono"><b>Nº de teléfono</b></label>
                        <input type="text" placeholder="Inserte el nº de tlf." name="telefono" id="telefono" required>
                    </div>
                    
                    <div class = "salario">
                        <label for="salario"><b>Salario</b></label>
                        <input type="text" placeholder="Inserte el salario" name="salario" id="salario" required>
                    </div>
                    
                    <div class = "nss">
                        <label for="nss"><b>Nº de la Seguridad Social</b></label>
                        <input type="text" placeholder="Inserte el Nº SS" name="nss" id="nss" required>
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