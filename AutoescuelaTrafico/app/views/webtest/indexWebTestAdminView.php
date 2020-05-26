<!DOCTYPE html>
<html>
	<!-- Archivo base para probar las consultas, faltan la seleccion de alumnos, edicion, etc -->

	<body>
		<div class="contenido" id="contenido">

			<h1>CREDENCIALES WEB TEST</h1>

			<div class="searchBar">
				<form action="" method="POST">
					<input type="text" id="filtro" name="filtro" placeholder="Introduzca un usuario">
					<button type="submit" name="searchbutton">
						Buscar
					</button>
				</form>
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
				if ($recursosAdministrador != null) {
					foreach ($recursosAdministrador as $num => $accesoWeb) {
						echo "<tr>";
						echo "<td>" . $accesoWeb -> getUsuario() . "</td>";
						echo "<td>" . $accesoWeb -> getClavePorDefecto() . "</td>";
						echo "<td>" . $accesoWeb -> getFechaRenovacion() . "</td>";
						echo "<td>" . $accesoWeb -> getFechaCaducidad() . "</td>";
						echo "<td>" . $accesoWeb -> getTiempoRestante() . "</td>";
						echo "</tr>";
					}
				}
				?>
			</table>
		</div>
	</body>
</html>