<!DOCTYPE html>
<!DOCTYPE html>
<html>
	<title>Lista Calificaciones</title>

	<head>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>

	<body>
		<div class ="contenido" id ="contenido">
			<ul class="tabs">

				<li>
					<a href="#tab1"><span class="tab-text">Alumnos</span></a>
				</li>
				<li>
					<a href="#tab2"><span class="tab-text">Último examen</span></a>
				</li>
			</ul>

			<div class="secciones">


				<article id="tab1">
					<h1>CALIFICACIONES DE LOS ALUMNOS</h1>
					<?php
					foreach ($resultado as $alumno => $examenes) {
						echo "<button class='accordionContent'>" . $alumno . "</button>";
						echo "<div class='panel'>";
						echo "<table style = 'width:100%'>";
					
							foreach ($examenes as $num => $examen) {
								echo "<tr>";
									echo "<td>" . $examen -> TIPO . "</td>";
									echo "<td>" . $examen -> FECHA . "</td>";
									echo "<td>" . $examen -> CALIFICACION . "</td>";
								echo "</tr>";
							}
						echo "</table>";
						echo "</div>";
					}
					?>
				</article>

				<?php
				if(isset($resultado2)){
				?>

				<article id="tab2">
					<h1>Último examen</h1>
					<table>
						<tr>
							<th>Apellidos</th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Tipo</th>
							<th>Calificacion</th>
						</tr>

						<?php
						foreach ($resultado2 as $alumno => $examen) {
							echo "<tr>";
							echo "<td>" . $examen -> APELLIDOS . "</td>";
							echo "<td>" . $examen -> NOMBRE . "</td>";
							echo "<td>" . $examen -> FECHA . "</td>";
							echo "<td>" . $examen -> TIPO . "</td>";
							echo "<td>" . $examen -> CALIFICACION . "</td>";
							echo "</tr>";
						}
						?>
					</table>
				</article>
				<?php } ?>

			</div>
		</div>

	<!-- SCRIPT DE TABS Y ACORDEON -->
	<script src="./js/accordionAndTabs.js"></script>

	</body>

</html>