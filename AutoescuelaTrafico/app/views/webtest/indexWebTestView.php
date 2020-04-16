<!DOCTYPE html>
<html>
<!-- Archivo base para probar las consultas, faltan la seleccion de alumnos, edicion, etc -->

<head>
	<title>CREDENCIALES WEB TEST</title>
</head>

<body>
<div class="filter">
	<p>Aqui iria algun tipo de filtro</p>
</div>
<div class="searchBar">
	<form action="">
		<input type="text" placeholder="Search" name="search">
		<button type="submit" name="searchbutton" value="fav_SearchIcon">BOTON</button>
	</form>
</div>

<div class="page_buttons">
	<a href="#" class="previous">&#8249;</a>
	<a href="#" class="next">&#8250;</a>
</div>

<div class="setting_button">
	<p>Aqui iria el boton de settings y el filtrado mediante php de si se ha accedido a esta funcionalidad</p>
</div>


<table>
	<tr>
    	<th>Usuario</th>
        <th>Clave</th>
        <th>Última renovación</th>
        <th>Fecha de caducidad</th>
        <th>Tiempo restante</th>
    </tr>
    
    <?php
    	foreach($recursosAdministrador as $num=>$accesoWeb){
    		echo "<tr>";
			echo "<td>" . $accesoWeb->getUsuario() . "</td>";
			echo "<td>" . $accesoWeb->getClavePorDefecto() . "</td>";
			echo "<td>" . $accesoWeb->getFechaRenovacion() . "</td>";
			echo "<td>" . $accesoWeb->getFechaCaducidad() . "</td>";
			echo "<td>" . $accesoWeb->getTiempoRestante() . "</td>";
			echo "</tr>";
    	}

    ?>

</table>
</body>
</html>