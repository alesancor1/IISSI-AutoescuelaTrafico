<!DOCTYPE html>
<html>
<head>
	<title>Ordenadores</title>
	<link rel="stylesheet" href="./css/tables.css">
</head>
	
<body>
	<div id="contenido" class="contenido">
		
		<h1>Ordenadores</h1>
		
		<div class="ZONA FILTRO BOTONES">
			<p>FILTROS</p>
			
			<div>
				<button class="nuevaEntrada" id='openPopup'>AÑADIR</button>
			</div>
			
			<?php require_once __DIR__."/addOrdenadorView.php";?>
			<script type="text/javascript" src="./js/popup.js"></script>
		</div>

		
		<div>
			<table>
				<tr>
					<th>Ordenador</th>
					<th>Estado</th>
					<th>Último alumno</th>
					<th>Fecha</th>
					<th>Hora inicio</th>
					<th>Hora de fin</th>
					<th>Tiempo de uso</th>
					<th>ELIMINACION</th>
				</tr>
			
			<?php 
				if($recursosOrdenadores!=null){
					foreach($recursosOrdenadores as $num=>$ordenador){
						echo "<tr>";
						echo "<td>" . $ordenador->PC . "</td>";
						echo "<td>" . $ordenador->ESTADOPC . "</td>";
						echo "<td>" . $ordenador->APELLIDOS . ", " . $ordenador->NOMBRE . "</td>";
						echo "<td>" . $ordenador->FECHA . "</td>";
						echo "<td>" . $ordenador->HORACOMIENZO . "</td>";
						echo "<td>" . $ordenador->HORAFIN . "</td>";
						echo "<td>" . $ordenador->TIEMPOUSO  . " horas</td>";
						echo "<td>";
						echo "<form action='?controller=Ordenadores&action=delete' method='post'>";
						echo "<input type='hidden' name='oidPc' id='oidPc' value='" . $ordenador->PC . "'>";
						echo "<button type='submit' class='eliminarPc'>X</button>";
						echo "</form>";
					}
				}
			?>
			</table>
		</div>
	</div>
	
</body>
</html>