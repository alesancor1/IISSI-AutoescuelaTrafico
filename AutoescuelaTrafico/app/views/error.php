<?php
echo "Ha sucedido un error :(";
echo "<div>";
switch($tipo){
	case "conexionDB": echo "ha ocurrido un error al conectarse al servidor de base de datos."; break;
	case "notLoggedIn": echo "debes iniciar sesion para acceder a estas funciones."; break;
	default: echo "error desconocido";
}
echo "</div>";

$url = "location.href='./index.php';";
echo '<div><input type="button" onclick='.$url. ' value="Volver al inicio"/></div>';
exit();
?>