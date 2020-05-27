<!DOCTYPE html>
<html>
	<head>
		<title>Lista Calificaciones</title>
	</head>
	<body>
		<div class="contenido" id="contenido">
			<h1>CALIFICACIONES DE ALUMNOS</h1>
			<?php
			// foreach ($listaAlumnos as $num => $alumno) {
			//
			// }
			foreach ($listaAlumnos as $num => $alumno) {
				echo "<br>";
				echo "<br>";
				foreach ($resultado[$alumno -> getNombre() . " " . $alumno -> getApellidos()] as $num => $dentro) {
					echo "<br>";
					print_r($dentro);
				}
			}
			?>
		</div>
	</body>
</html>