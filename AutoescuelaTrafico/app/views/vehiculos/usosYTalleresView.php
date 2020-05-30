<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Usos y talleres</title>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
		<link rel="stylesheet" type="text/css" href="./css/vehiculosAdminView.css">
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
					
					<div class="filtros">
						<h1>Usos de vehículos</h1>
						<form class="" id="" action="?controller=Vehiculos&action=getUsosYTalleres" method="POST">
							<label for="filtro"></label>
							<input type="text" id="filtro" name="filtro" placeholder="Busque por alumno o vehículo">
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
									
					<div class="filtros">
						<h1>Talleres</h1>
						<button class="nuevaEntrada" id="openPopup"><i class="fa fa-plus"></i></button>
					</div>
					
					<?php require_once __DIR__."/addTallerView.php";?>
					<script type="text/javascript" src="./js/popup.js"></script>
					
					<div class="accordionVehiculo">
					<?php if($talleres!=null) {
						foreach($talleres as $num=>$taller){
							$botonEliminar = "<span class='eliminarTaller' onclick=document.getElementById('deleteTaller".$num."').submit()>X</span>";

							echo "<button class='accordionContent'>" . $taller->NOMBRE . $botonEliminar . "</button>";
							echo "<div class='panel'>";
							echo "<p><b>Dirección:</b> " . $taller->DIRECCION . "</p>";
							echo "<p><b>Teléfono:</b> " . $taller->TELEFONO . "</p>";
							echo "<form class='' id='deleteTaller".$num."' action='?controller=Vehiculos&action=deleteTaller' method='POST'>";
							echo "<input type='hidden' id='nombreTaller' name='nombreTaller' value='" . $taller->NOMBRE . "'>";
							echo "<input type='hidden' id='direccionTaller' name='direccionTaller' value='" . $taller->DIRECCION . "'>";
							echo "<input type='hidden' id='telefonoTaller' name='telefonoTaller' value='" . $taller->TELEFONO . "'>";
							echo "</form>";
							echo "</div>";
						}
					}?>
					</div>
				</article>
			</div>

		</div>
		<!-- ACCORDION AND TABS -->
		<script type="text/javascript" src="./js/accordionAndTabs.js"></script>

	</body>
</html>