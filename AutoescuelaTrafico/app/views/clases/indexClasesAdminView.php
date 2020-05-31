<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<title>Gestión de clases</title>

	</head>
	<body>
		<div class ="contenido" id ="contenido">
			<ul class="tabs">
				
				<li>
					<a href="#tab1"><span class="tab-text">Horario</span></a>
				</li>
				<li>
					<a href="#tab2"><span class="tab-text">Gestión</span></a>
				</li>
			</ul>

			<div class="secciones">
				
				<?php 
					//	Comprobamos que este setteada la variable
					//	para generar el html
				?>
				
				<article id="tab1">
					<h1>HORARIO</h1>
					<p>
						AQUI IRIA EL HORARIO
					</p>
				</article>
				
				<?php 
					if(isset($gestionClases)){ 
						//print_r($gestionClases); ?>
					<article id="tab2">
						<h1>GESTION CLASES</h1>
						<table>
							<tr>
								<th>Alumno</th>
								<th>Días sin dar clase</th>
								<th>Última clase</th>
								<th>Profesor</th>
							</tr>
						
						<?php foreach($gestionClases as $num=>$row){
							echo "<tr>";
							echo "<td>" . $row->ALUMNO . "</td>";
							echo "<td>" . $row->DIASSINCLASE . "</td>";
							echo "<td>" . $row->FECHAULTIMACLASE . "</td>";
							echo "<td>" . $row->PROFESOR . "</td>";
							echo "</tr>";
						} ?>
						</table>
					</article>
				<?php } ?>
				
				
			</div>
		</div>

		<script type="text/javascript" src="./js/accordionAndTabs.js"></script>

	</body>

</html>