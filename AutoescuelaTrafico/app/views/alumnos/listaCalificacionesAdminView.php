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
					<a href="#tab1"><span class="tab-text">Teoricas</span></a>
				</li>
				<li>
					<a href="#tab2"><span class="tab-text">Practicas circulacion</span></a>
				</li>
				<li>
					<a href="#tab3"><span class="tab-text">Practicas pista</span></a>
				</li>
			</ul>

			<div class="secciones">

				<article id="tab1">
					<h1>Calificaciones teoricas</h1>
					<?php
					if(!empty($teoricoA)){
					?>
					<p>APTOS</p>
					<table>
						<tr>
							<th>Apellidos</th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Num Fallos</th>
						</tr>
						<?php
						foreach ($teoricoA as $num => $examen) {
							echo "<tr>";
							echo "<td>" . $examen -> APELLIDOS . "</td>";
							echo "<td>" . $examen -> NOMBRE . "</td>";
							echo "<td>" . $examen -> FECHA . "</td>";
							echo "<td>" . $examen -> NFALLOS . "</td>";
							echo "</tr>";
						}
						?>
					</table>
					<?php } 
					else echo "No hay examenes APTOS";
					if(!empty($teoricoN)){
					?>
					<p>NO APTOS</p>
					<table>
						<tr>
							<th>Apellidos</th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Num Fallos</th>
						</tr>
						<?php
						foreach ($teoricoN as $num => $examen) {
							echo "<tr>";
							echo "<td>" . $examen -> APELLIDOS . "</td>";
							echo "<td>" . $examen -> NOMBRE . "</td>";
							echo "<td>" . $examen -> FECHA . "</td>";
							echo "<td>" . $examen -> NFALLOS . "</td>";
							echo "</tr>";
						}
						?>
					</table>
					<?php } 
					else echo "No hay examenes NO APTOS";?>
				</article>

				<article id="tab2">
					<h1>Calificaciones practicas circulacion</h1>
					<?php
					if(!empty($circulacionA)){
					?>
					<p>APTOS</p>
					<table>
						<tr>
							<th>Apellidos</th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Faltas leves/deficientes/eliminatorias</th>
						</tr>
						<?php
						foreach ($circulacionA as $num => $examen) {
							echo "<tr>";
							echo "<td>" . $examen -> APELLIDOS . "</td>";
							echo "<td>" . $examen -> NOMBRE . "</td>";
							echo "<td>" . $examen -> FECHA . "</td>";
							echo "<td>" . $examen -> FALTASLEVES . "/" . $examen -> FALTASDEFICIENTES . "/" . $examen -> FALTASELIMINATORIAS ."</td>";
							echo "</tr>";
						}
						?>
					</table>
					<?php }
					else echo "No hay examenes APTOS";
					if(!empty($circulacionN)){
					?>
					<p>NO APTOS</p>
					<table>
						<tr>
							<th>Apellidos</th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Faltas leves/deficientes/eliminatorias</th>
						</tr>
						<?php
						foreach ($circulacionN as $num => $examen) {
							echo "<tr>";
							echo "<td>" . $examen -> APELLIDOS . "</td>";
							echo "<td>" . $examen -> NOMBRE . "</td>";
							echo "<td>" . $examen -> FECHA . "</td>";
							echo "<td>" . $examen -> FALTASLEVES . "/" . $examen -> FALTASDEFICIENTES . "/" . $examen -> FALTASELIMINATORIAS ."</td>";
							echo "</tr>";
						}
						?>
					</table>
					<?php } 
					else echo "No hay examenes NO APTOS";?>
				</article>
				<article id="tab3">
					<h1>Calificaciones practicas pista</h1>
					<?php
					if(!empty($pistaA)){
					?>
					<p>APTOS</p>
					<table>
						<tr>
							<th>Apellidos</th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Faltas leves/deficientes/eliminatorias</th>
						</tr>
						<?php
						foreach ($pistaA as $num => $examen) {
							echo "<tr>";
							echo "<td>" . $examen -> APELLIDOS . "</td>";
							echo "<td>" . $examen -> NOMBRE . "</td>";
							echo "<td>" . $examen -> FECHA . "</td>";
							echo "<td>" . $examen -> FALTASLEVES . "/" . $examen -> FALTASDEFICIENTES . "/" . $examen -> FALTASELIMINATORIAS ."</td>";
							echo "</tr>";
						}
						?>
					</table>
					<?php }
					else echo "No hay examenes APTOS";
					if(!empty($pistaN)){
					?>
					<p>NO APTOS</p>
					<table>
						<tr>
							<th>Apellidos</th>
							<th>Nombre</th>
							<th>Fecha</th>
							<th>Faltas leves/deficientes/eliminatorias</th>
						</tr>
						<?php
						foreach ($pistaN as $num => $examen) {
							echo "<tr>";
							echo "<td>" . $examen -> APELLIDOS . "</td>";
							echo "<td>" . $examen -> NOMBRE . "</td>";
							echo "<td>" . $examen -> FECHA . "</td>";
							echo "<td>" . $examen -> FALTASLEVES . "/" . $examen -> FALTASDEFICIENTES . "/" . $examen -> FALTASELIMINATORIAS ."</td>";
							echo "</tr>";
						}
						?>
					</table>
					<?php } 
					else echo "No hay examenes NO APTOS";?>
				</article>
			</div>
		</div>

		<!-- SCRIPT DE TABS Y ACORDEON -->
		<script src="./js/accordionAndTabs.js"></script>

	</body>

</html>