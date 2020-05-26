<!DOCTYPE html>
<head>
	<style>
		.credenciales {
			width: 100%;
			padding: 1%;
			border: 1%;
		}
	</style>
</head>

<html>

	<body>
		<div class="contenido" id="contenido">
			<h1>WEB TEST INFORMACION</h1>
			<div class="">
				<p>
					Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
				</p>
			</div>

			<?php
			$check = $informacionAlumno != null;
			$data = $informacionAlumno[0];
			?>
			<div class="credenciales">
				<div class="usuario">
					<p>
						Usuario: <?php
						if ($check)
							echo $data -> getUsuario();
						?>
					</p>
				</div>
				<div class="clave">
					<p>
						Clave por defecto: <?php
						if ($check)
							echo $data -> getClavePorDefecto();
						?>
					</p>
				</div>
				<div class="fechaRenovacion">
					<p>
						Fecha de última renovación: <?php
						if ($check)
							echo $data -> getFechaRenovacion();
						?>
					</p>
				</div>
				<div class="fechaCaducidad">
					<p>
						Fecha de caducidad: <?php
						if ($check)
							echo $data -> getFechaCaducidad();
						?>
					</p>
				</div>
				<div class="tiempoRestante">
					<p>
						Tiempo restante: <?php
						if ($check)
							echo $data -> getTiempoRestante();
						?>
					</p>
				</div>
			</div>

			<div>
				<img src="">FOTO</img>
			</div>
		</div>
	</body>
</html>