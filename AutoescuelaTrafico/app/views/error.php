<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8" content="width=device-width initial, initial-scale=1">
	<title>Página de error</title>
	<link rel="stylesheet" type="text/css" href="./css/errorPage.css">
	
</head>

<body>

<div class="errorTOP">
	<div class="errorCrash">
		<img class="errorImagen" src="./img/errorCrash.png" alt="Error al cargar la imagen. Hoy no es tu día ;("/>
	</div>
	
	<div class="errorMensaje">
		<p>Ha sucedido un error :(</p>
	</div>
		
	<!-- <div class="exclamacion">
		<img src="./img/exclamacionroja.png" alt="Error al cargar la imagen. Hoy no es tu día ;( />
	</div> -->

	<?php
		echo '<link rel="stylesheet" type="text/css" href="./css/errorPage.css">';
		echo '<div class="switchMensaje">';

switch($tipo){
	case "conexionDB": ?>
			<p>Ha ocurrido un error al conectarse al servidor de base de datos.</p>
	<?php ; break;
		
	case "notLoggedIn": ?>
			<p>Debes iniciar sesion para acceder a estas funciones.</p>
	<?php ; break;
		
	case "wrongLogin": ?>
		<p>No tienes acceso a esta función.</p>
		<?php ; break;
	
	default:?>
		<p>Error desconocido.</p>
	<?php ;
} 
	echo '</div>';
?>

<?php
	echo '<link rel="stylesheet" type="text/css" href="./css/errorPage.css">';
	
	$url = "location.href='./index.php';";
	
	echo '<input type="button" class="botonVolverAtrasError" onclick='.$url. ' value="Volver al inicio"/>'; ?>

	<?php
	exit();
	?>
</div>

</body>
</html>