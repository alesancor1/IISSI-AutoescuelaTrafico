<!DOCTYPE html>
<html>

<body>

<div class='errorTOP'>
	
	<h1>HA SUCEDIDO UN ERROR :(</h1>
	<img class="errorImagen" src="./img/errorCrash.png" alt="Error al cargar la imagen. Hoy no es tu día ;("/>

<?php
switch($tipo){
	case "conexionDB": ?>
		<div class="errorConexionDB">
			<p>Ha ocurrido un error al conectarse al servidor de base de datos.</p>
		</div> 
		<?php ; break;
		
	case "notLoggedIn": ?>
		<div class="errorNotLoggedIn">
			<p>Debes iniciar sesion para acceder a estas funciones.</p>
		</div>
	<?php ; break;
		
	case "wrongLogin": ?>
		<div class="errorWrongLogin">
			<p>No tienes acceso a esta funcion.</p>
		</div>
		<?php ; break;
	
	default:?>
		<div class="errorWrongLogin">
			<p>Error desconocido.</p>
		</div>
		<?php ;
} ?>

<?php
	$url = "location.href='./index.php';"; ?>
	<div class="botonVolverAtrásError">
	<?php echo '<input type="button" onclick='.$url. ' value="Volver al inicio"/>' ?>
	</div>

	<?php
	exit();
	?>
</div>

</body>
</html>