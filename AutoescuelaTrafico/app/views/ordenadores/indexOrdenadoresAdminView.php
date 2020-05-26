<!DOCTYPE html>
<html>
<head>
	<title>Ordenadores</title>
	<link rel="stylesheet" href="./css/tables.css">
</head>
	
<body>
	<div id="contenido" class="contenido">
		
		<h1>Ordenadores</h1>
		
		<p>FILTROS</p>
		
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
						echo "<td>" . $ordenador->TIEMPOUSO  . "</td>";
						echo "<td><a href=''>X</a></td>";
						echo "</tr>";
					}
				}
			?>
			</table>
		</div>
	</div>
	
</body>
</html>