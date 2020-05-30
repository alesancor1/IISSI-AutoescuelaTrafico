<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" type="text/css" href="./css/loginPage.css">
		<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js" type="text/javascript"></script> -->
	</head>
	<body>

		<!---------------------------------------------
		VENTANA DEL POPUP
		----------------------------------------------->
		<div class="overlay" id="overlay">
			<div class = "popup" id = "popup">
				<div class = "advertencia">
					<p>
						ADVERTENCIA
					</p>
				</div>

				<div class = "descripcion">
					<p>
						Error: Usuario o contraseña equivocados.
					</p>
					<p>
						Inténtelo de nuevo o contacte con la autoescuela.
					</p>
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
		?>
		<script type="text/javascript">
			overlay.classList.add('active');
			popup.classList.add('active');
		</script><?php
		}
		?>

		<!-----------------------------------------------
		LOGIN FORM
		------------------------------------------------->
		<div class = "form-overlay">
			<form id="login" name="login" action="?controller=Login&action=login" method="post" class = "form-container">

				<div class = "imagen">
					<h3 class = "title">AUTOESCUELA</br>TRAFICO<h3><img class = "logo" src = "./img/autoescuela.png" alt = "logo">
				</div>

				<div class="usr-container">
					<label for="uname">Usuario</label></br>
					<input type="text" id="uname" placeholder="Inserte su usuario" name="uname" required oninput="userValidation();">
				</div>

				<div class="psw-container">
					<label for="psw">Contraseña</label></br>
					<input type="password" id="psw" placeholder="Inserte su contraseña" name="psw" required oninput="passwordValidation();">
				</div>

				<div class="botones">
					<button type="submit">
						Iniciar sesión
					</button></br>
					<button type="button" class="volverLogin" onclick="location.href='./index.php'">
						< volver
					</button>
				</div>
			</form>
		</div>

		<!-- <script type="text/javascript">
			// Inicialización de elementos y eventos cuando el documento se carga completamente
			$(document).ready(function() {

				$("#login").on("submit",(function() {

					return validateForm();
				});
			});
		</script> -->

	</body>
</html>