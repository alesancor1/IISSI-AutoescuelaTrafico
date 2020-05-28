<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Usos y talleres</title>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	</head>

	<body>
		<div class="contenido" id="contenido">

			<ul class="tabs">

				<li>
					<a href="#tab1"><span class="tab-text">Usos</span></a>
				</li>

				<li>
					<a href="#tab2"><span class="tab-text">Talleres</span></a>
				</li>

			</ul>

			<div class="secciones">
				<article id="tab1">
					<h1>Usos de vehículos</h1>
					
					<div class="filtros">
						<form class="" id="" action="?controller=Vehiculos&action=getUsosYTalleres" method="POST">
							<label for="filtro">Busque alumnos o vehículos (modelo o matricula):</label>
							<input type="text" id="filtro" name="filtro">
							<input type="submit" hidden>
						</form>
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
				</article>

				<article id="tab2">
					<h1>Talleres</h1>
					
					<div>
						<button class="nuevaEntrada" id="openPopup">Añadir</button>
					</div>
					
					<?php require_once __DIR__."/addTallerView.php";?>
					<script type="text/javascript" src="./js/popup.js"></script>
					
					<?php
						foreach($talleres as $taller){
							echo "<button class='accordionContent'>" . $taller->NOMBRE . "</button>";
							echo "<div class='panel'>";
							echo "<p>Dirección: " . $taller->DIRECCION . "</p>";
							echo "<p>Teléfono: " . $taller->TELEFONO . "</p>";
							echo "<form class='' id='' action='?controller=Vehiculos&action=deleteTaller' method='POST'>";
							echo "<input type='hidden' id='nombreTaller' name='nombreTaller' value='" . $taller->NOMBRE . "'>";
							echo "<input type='hidden' id='direccionTaller' name='direccionTaller' value='" . $taller->DIRECCION . "'>";
							echo "<input type='hidden' id='telefonoTaller' name='telefonoTaller' value='" . $taller->TELEFONO . "'>";
							echo "<button type='submit' class='eliminarTaller'>X</button>";
							echo "</form>";
							echo "</div>";
						}
					?>
				</article>
			</div>

		</div>
		<!-- ACCORDION AND TABS -->
		<script type="text/javascript" src="./js/accordionAndTabs.js"></script>

	</body>
</html>