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
			<form id="login" name="login" action="?controller=Validator&action=validate" method="post" class = "form-container">

				<div class = "imagen">
					<h3 class = "title">AUTOESCUELA</br>TRAFICO<h3><img class = "logo" src = "./img/autoescuela.png" alt = "logo">
				</div>

				<div class=usr-container>
					<label for="uname">Usuario</label></br>
					<input type="text" id="uname" placeholder="Inserte su usuario" name="uname" required oninput="userValidation();">
					<!--Para los errores-->
					<p class="errorUName" id="errorUName"></p>
				</div>
				

				<div class=psw-container>
					<label for="psw">Contraseña</label></br>
					<input type="password" id="psw" placeholder="Inserte su contraseña" name="psw" required oninput="passwordValidation();">
					<!--Para los errores-->
					<p class="errorPsw" id="errorPsw"></p>
				</div>

				<div class=botones>
					<button type="submit">
						Iniciar sesión
					</button></br>
					<button type="button" class="volverLogin" onclick="location.href='./index.php'">
						< volver
					</button>
				</div>
				<!-- para el ValidatorPHP -->
				<input type="hidden" name = "validateForm" value = "loginForm">
				<input type="hidden" name = "callbackUri" value = "?controller=Login&action=login">
			</form>
		</div>
	</body>
</html>