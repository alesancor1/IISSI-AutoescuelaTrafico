<!DOCTYPE html>
<html>
<head>
	<title>Usos del PC</title>
	<link rel="stylesheet" href="./css/tables.css">
</head>
	
<body>
	<div id="contenido" class="contenido">
		
		<h1>Usos del PC 
			<?php if($verUsos!=null) echo $verUsos[0]->OID_PC; ?>
		</h1>
		
		<div class="ZONA FILTRO BOTONES">
			<p>FILTROS</p>
			
			<div>
				<button class="nuevaEntrada" id='openPopup'>AÑADIR</button>
			</div>
			
			<?php require_once __DIR__."/addUsoView.php";?>
			<script type="text/javascript" src="./js/popup.js"></script>
		</div>

		
		<div>
			
			<form class="" id="" action="?controller=Ordenadores&action=deleteUsos" method="POST">
				
				<button class="borrarSelec" type="submit">BORRAR</button>
			
				<table>
					<tr>
						<th>Alumno</th>
						<th>Fecha</th>
						<th>Hora de inicio</th>
						<th>Hora de fin</th>
						<th>Duración</th>
					</tr>
			
					<?php 
						if($verUsos!=null){
							echo "<input type='hidden' name='oidPc' id='oidPc' value='" . $verUsos[0]->OID_PC . "'>";
							foreach($verUsos as $num=>$uso){
								echo "<tr>";
								echo "<td><input type='checkbox' name='".$num."' id='".$num."' value='" . $uso->OID_U . "'>" 
								. $uso->APELLIDOS . " " . $uso->NOMBRE . "</td>";
								echo "<td>" . $uso->FECHA . "</td>";
								echo "<td>" . $uso->HORACOMIENZO . "</td>";
								echo "<td>" . $uso->HORAFIN . "</td>";
								if(preg_match("/^[0-9]{0},[0-9]{0,2}/", $uso->TIEMPOUSO)){
									echo "<td>0" . $uso->TIEMPOUSO  . " horas</td>";
								} else {
									echo "<td>" . $uso->TIEMPOUSO  . " horas</td>";
								}
								echo "<td>";
								echo "</input>";
								echo "</tr>";
							}
						}
					?>
				</table>
			</form>
		</div>
	</div>
	
</body>
</html>