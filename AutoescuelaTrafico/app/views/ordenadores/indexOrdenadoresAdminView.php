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
					<th></th>
				</tr>
			
			<?php 
				if($recursosOrdenadores!=null){
					foreach($recursosOrdenadores as $num=>$ordenador){
						echo "<tr>";
						if(empty($ordenador->APELLIDOS)){
							echo "<td>" . $ordenador->PC . "</td>";
							echo "<td>" . $ordenador->ESTADOPC . "</td>";
							echo "<td>-</td>";
							echo "<td>-</td>";
							echo "<td>-</td>";
							echo "<td>-</td>";
							echo "<td>-</td>";
							echo "<td>";
						} else {
							echo "<td>" . $ordenador->PC . "</td>";
							echo "<td>" . $ordenador->ESTADOPC . "</td>";
							echo "<td>" . $ordenador->APELLIDOS . " - " . $ordenador->NOMBRE . "</td>";
							echo "<td>" . $ordenador->FECHA . "</td>";
							echo "<td>" . $ordenador->HORACOMIENZO . "</td>";
							echo "<td>" . $ordenador->HORAFIN . "</td>";
							echo "<td>" . $ordenador->TIEMPOUSO  . " horas</td>";
							echo "<td>";
						}
						echo "<form action='?controller=Ordenadores&action=deletePc' method='post'>";
						echo "<input type='hidden' name='oidPc' id='oidPc' value='" . $ordenador->PC . "'>";
						echo "<button type='submit' class='eliminarPc'>X</button>";
						echo "</form>";
						
						echo "<form action='?controller=Ordenadores&action=verUsos' method='post'>";
						echo "<input type='hidden' name='oidPc' id='oidPc' value='" . $ordenador->PC . "'>";
						echo "<button type='submit' class='verUsos'>Usos</button>";
						echo "</form>";
						
						echo "</td>";
						echo "</tr>";
					}
				}
			?>
			</table>
		</div>
	</div>
	
</body>
</html>