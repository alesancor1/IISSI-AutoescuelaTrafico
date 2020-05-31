<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="./css/tables.css">
	<title>WebTest alumno</title>
</head>

<html>

	<body>
		<div class="contenido" id="contenido">
			<div style="margin-top: 50px">
				<h1>WEB TEST INFORMACION</h1>

				<?php
				$check = $informacionAlumno != null;
				$data = $informacionAlumno[0];
				?>

				<table>
					<tr>
						<th>Usuario</th>
						<th>Clave</th>
						<th>Fecha de renovacion</th>
						<th>Fecha de caducidad</th>
						<th>Tiempo restante</th>
					</tr>
					<tr>
						<td class="usuario">
							<?php
							if ($check)
								echo $data -> getUsuario();
							?>
						</td>
						<td class="clave">
							<?php
							if ($check)
								echo $data -> getClavePorDefecto();
							?>
						</td>
						<td class="fechaRenovacion">
							<?php
							if ($check)
								echo $data -> getFechaRenovacion();
							?>
						</td>
						<td class="fechaCaducidad">
							<?php
							if ($check)
								echo $data -> getFechaCaducidad();
							?>
						</td>
						<td class="tiempoRestante">
							<?php
							if ($check)
								echo $data -> getTiempoRestante();
							?>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>