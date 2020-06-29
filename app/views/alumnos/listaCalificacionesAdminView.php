<!DOCTYPE html>
<html>
	<title>Lista calificaciones</title>

	<head>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>

	<body>
		<div class ="contenido" id ="contenido">
			<ul class="tabs">

				<li>
					<a href="#tab1"><span class="tab-text">Teóricas</span></a>
				</li>
				<li>
					<a href="#tab2"><span class="tab-text">Prácticas circulación</span></a>
				</li>
				<li>
					<a href="#tab3"><span class="tab-text">Prácticas pista</span></a>
				</li>
			</ul>

			<div class="secciones">
			<!-- TAB DE TEORIA -->
				<article id="tab1">
					<h1>Calificaciones teóricas</h1>
					<?php
					if(!empty($teoricoA)){
					?>
					<h3 style="font-size: 16px; margin: 30px 0 0 20px">APTOS</h3>
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
					else echo "<h3 style='font-size: 16px; margin: 30px 0 0 20px'>No hay examenes APTOS</h3>";
					if(!empty($teoricoN)){
					?>
					<h3 style="font-size: 16px; margin: 30px 0 0 20px">NO APTOS</h3>
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
					else echo "<h3 style='font-size: 16px; margin: 30px 0 0 20px'>No hay examenes NO APTOS</h3>";?>
				</article>
				<!-- TAB DE CIRCULACION -->
				<article id="tab2">
					<h1>Calificaciones prácticas circulación</h1>
					<?php
					if(!empty($circulacionA)){
					?>
					<h3 style="font-size: 16px; margin: 30px 0 0 20px">APTOS</h3>
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
					else echo "<h3 style='font-size: 16px; margin: 30px 0 0 20px'>No hay examenes APTOS</h3>";
					if(!empty($circulacionN)){
					?>
					<h3 style="font-size: 16px; margin: 30px 0 0 20px">NO APTOS</h3>
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
					else echo "<h3 style='font-size: 16px; margin: 30px 0 0 20px'>No hay examenes NO APTOS</h3>";?>
				</article>
				<!-- TAB DE PISTA -->
				<article id="tab3">
					<h1>Calificaciones prácticas pista</h1>
					<?php
					if(!empty($pistaA)){
					?>
					<h3 style="font-size: 16px; margin: 30px 0 0 20px">APTOS</h3>
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
					else echo "<h3 style='font-size: 16px; margin: 30px 0 0 20px'>No hay examenes APTOS</h3>";
					if(!empty($pistaN)){
					?>
					<h3 style="font-size: 16px; margin: 30px 0 0 20px">NO APTOS</h3>
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
					else echo "<h3 style='font-size: 16px; margin: 30px 0 0 20px'>No hay examenes NO APTOS</h3>";?>
				</article>
			</div>
		</div>

		<!-- SCRIPT DE TABS Y ACORDEON -->
		<script src="./js/accordionAndTabs.js"></script>

	</body>

</html>