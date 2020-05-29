<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Desglose general</title>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	</head>

	<body>
		<div class="contenido" id="contenido">

			<h1>Desglose general</h1>

			<!-- CORREGIR PARA ESTE -->
			<div class="filtros">
				<form class="" id="" action="?controller=Vehiculos&action=getUsosYTalleres" method="POST">
					<label for="filtro">Busque alumnos o vehículos (modelo o matricula):</label>
					<input type="text" id="filtro" name="filtro">
					<input type="submit" hidden>
				</form>
			</div>
			
			<div>
				<p><?php echo $desgloseGeneral; ?></p>
			</div>

			<table>
				<tr>
					<th>Alumno</th>
					<th>Vehículos usados</th>
				</tr>

				<?php
				foreach ($usosPorAlumno as $key => $usos) {
					echo "<tr>";
					echo "<td>" . $key . "</td>";
					echo "<td>";
					foreach ($usos as $uso) {
						echo $uso -> MODELO . ", " . $uso -> MATRICULA . "<br>";
					}
					echo "</td>";
					echo "</tr>";
				}
				?>
			</table>

		</div>
		<!-- ACCORDION AND TABS -->
		<script type="text/javascript" src="./js/accordionAndTabs.js"></script>

	</body>
</html>