<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" type="text/css" href="./css/loginPage.css">
	</head>
	<body>

	<!---------------------------------------------
	VENTANA DEL POPUP
	----------------------------------------------->
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
					<button type="button" class="aceptar" onclick = "location.href='?controller=Login'">
						ACEPTAR
					</button>
				</div>
			</div>
		</div>	
		<script type="text/javascript" src="./js/popup.js"></script>

	<!--COMPRUEBA SI TE EQUIVOCASTE-->
		<?php if($error){
		?>	<script type="text/javascript">
					overlay.classList.add('active');
					popup.classList.add('active');
			</script><?php
		}?>



	<!-----------------------------------------------
	LOGIN FORM
	------------------------------------------------->
	<div class = "form-overlay">
		<form action="?controller=Login&action=login" method="post" class = "form-container">

			<div class = "imagen">
				<h3 class = "title">AUTOESCUELA</br>TRAFICO<h3>
				<img class = "logo" src = "./img/autoescuela.png" alt = "logo">
			</div>

			<div class=usr-container>
				<label for="uname">Usuario</label></br>
				<input type="text" placeholder="Inserte su usuario" name="uname" required>
			</div>

			<div class=psw-container>
				<label for="psw">Contraseña</label></br>
				<input type="password" placeholder="Inserte su contraseña" name="psw" required>
			</div>

			<div class=botones>
				<button type="submit">Iniciar sesión</button></br>
				<button type="button" class="volverLogin" onclick="location.href='./index.php'">< volver</button>
			</div>
		</form>
	</div>

</body>
</html>