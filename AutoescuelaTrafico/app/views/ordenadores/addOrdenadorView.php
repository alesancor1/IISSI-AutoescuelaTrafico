<!DOCTYPE html>
<html>
	<head>
		<!-- PERSONALIZAR ESTE CSS -->
		<link rel="stylesheet" type="text/css" href="./css/popup.css">
	</head>
	<body>

		<div class="overlay" id="overlay">
			<div class = "popup" id = "popup">
				<h1 class ="nuevo">NUEVO ORDENADOR</h1>

				<form action="?controller=Validator&action=validate" class="form-container" method = "post">

					<div class="select">
						<label for="estadoPc"><b>Nuevo estado del PC</b></label>
						<select id="estadoPc" name="estadoPc">
							<option disabled selected value = "Nuevo">Seleccione el estado</option>
							<option value="Nuevo">Nuevo</option>
							<option value="BuenEstado">Buen estado</option>
							<option value="Aceptable">Aceptable</option>
							<option value="MalEstado">Mal estado</option>
						</select>
					</div>

					<div class="inputText">
						<label for="modelo"><b>Modelo del PC</b></label>
						<input type="text" placeholder="Modelo del equipo" name="modelo" id="modelo" maxlength="25" required oninput="validationModeloPc();">
					</div>

					<div class = "inputText">
						<label for="so"><b>Sistema operativo del PC</b></label>
						<input type="text" placeholder="S.O." name="so" id="so" maxlength="25" required oninput="validationSO();">
					</div>

					<div class = "botones">
						<button type="button" class="volver" id='closePopup'>
							< Volver
						</button>
						<button type="submit" class="enviar">
							Enviar
						</button>
					</div>
					<!-- para el ValidatorPHP -->
                    <input type="hidden" name = "validateForm" value = "ordenadoresForm">
                    <input type="hidden" name = "callbackUri" value = "?controller=Ordenadores&action=addPc">

				</form>

			</div>

		</div>

	</body>
</html>