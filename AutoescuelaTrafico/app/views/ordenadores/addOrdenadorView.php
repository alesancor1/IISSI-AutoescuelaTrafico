<!DOCTYPE html>
<html>
<head>
	<!-- PERSONALIZAR ESTE CSS -->
    <link rel="stylesheet" type="text/css" href="./css/addAnunciosView.css">
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <h1 class ="nuevo">NUEVO ORDENADOR</h1>
                
                <form action="?controller=Ordenadores&action=add" class="form-container" method = "post">
					
					<div class="estadoPc">
						<label for="estadoPc"><b>Estado del PC</b></label>
						<input type="text" placeholder="Estado del equipo" name="estadoPc" id="estadoPc" required>
					</div>
					
					<div class="modelo">
						<label for="modelo"><b>Modelo del PC</b></label>
						<input type="text" placeholder="Modelo del equipo" name="modelo" id="modelo" required>
					</div>
					
                    <div class = "so">
                        <label for="so"><b>Sistema operativo del PC</b></label>
                        <input type="text" placeholder="S.O." name="so" id="so" required>
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