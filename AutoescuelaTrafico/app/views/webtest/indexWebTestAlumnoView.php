<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="./css/tables.css">
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
						<th>fechaRenovacion</th>
						<th>fechaCaducidad</th>
						<th>tiempoRestante</th>
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