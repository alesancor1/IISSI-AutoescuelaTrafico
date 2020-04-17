<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" type="text/css" href="./css/errorLogin.css">
	</head>

	<body>
	<?php
		if($error){
	?>
		<div class="overlay" id="overlay">
			<div class = "popup" id = "popup">
				<div class = "advertencia">
					<p>ADVERTENCIA</p>
				</div>
				
				<div class = "descripcion">
					<p>Error: Usuario o contraseña equivocados.</p>
					<p>Inténtelo de nuevo o contacte con la autoescuela.</p>
				</div>
				
				<div class = "boton">
					<button type="button" class="aceptar" id='closePopup'>
						ACEPTAR
					</button>
				</div>
			</div>
		</div>
		
		

		<?php } ?>

		<form action="?controller=Login&action=login" method="post">
			<div class="container">
				<label for="uname">Usuario</label></br>
				<input type="text" placeholder="Inserte su usuario" name="uname" required>
				</br>

				<label for="psw">Contraseña</label></br>
				<input type="password" placeholder="Inserte su contraseña" name="psw" required>
				</br>

				<button type="submit">
					Iniciar sesión
				</button></br>

				<button type="button" class="volverLogin" onclick="location.href='../../AutoescuelaTrafico/public/index.php';">
					volver
				</button>
			</div>
		</form>

	</body>

</html>