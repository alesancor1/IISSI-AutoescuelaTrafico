<!DOCTYPE html>
<html>
	
<head>
	<title>Vehiculos información</title>
	<link rel="stylesheet" href="./css/tables.css">
	<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
	<link rel="stylesheet" type="text/css" href="./css/vehiculosAdminView.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style> body{ background: white; }</style>
</head>

<body>
	
	<div class="contenido" id="contenido">
		<h1 style="margin: 50px 0 0 30px; transform: none; left:0;">Vehículos:</h1>
		
		<div class="accordionVehiculo">
			<?php if ($infoVehiculos!=null){
				foreach ($infoVehiculos as $num => $infoVehiculo) {
					echo "<button class='accordionContent'>" . $infoVehiculo->MODELO . "</button>";
					
					echo "<div class='panel'>";
					
					echo "<p><b>MATRICULA:</b> " . $infoVehiculo->MATRICULA . "</p>";
					echo "<p><b>ESTADO:</b> " . $infoVehiculo->ESTADO . "</p>";
					echo "<p><b>TIPO DE SEGURO:</b> " . ($infoVehiculo->TIPOSEGURO !=null ? $infoVehiculo->TIPOSEGURO : " - ") . "</p>";
					echo "<p><b>FECHA ULTIMA ITV:</b> " . $infoVehiculo->FECHA . "</p>";
					echo "<p><b>RESULTADO ULTIMA ITV:</b> " . $infoVehiculo->REVISION . "</p>";
					echo "<p><b>TIPO DE CUOTA:</b> " . ($infoVehiculo->TIPOCUOTA !=null ? $infoVehiculo->TIPOCUOTA : " - ") . "</p>";
					echo "<p><b>IMPORTE DE LA CUOTA:</b> " . ($infoVehiculo->IMPORTECUOTA !=null ? $infoVehiculo->IMPORTECUOTA : " - ") . "</p><br>";				
				?>
									
					<?php
					if ($infoReparaciones!=null) {
						foreach ($infoReparaciones as $matricula => $reparaciones) {
							if ($matricula == $infoVehiculo->MATRICULA) {
							echo '<h4 style="margin: 0 0 5px 70px; transform: none; left:0;">Reparaciones:</h4>';

							echo "<table>";
						
								echo "<tr>
									<th>Fecha</th>
									<th>Descripcion</th>
									<th>Importe</th>
									<th>Taller</th>
								</tr>";
								
							
							foreach ($reparaciones as $reparacion) {
							?>
								<tr>
									<td><?php echo $reparacion->FECHA ?></td>
									<td><?php echo $reparacion->DESCRIPCION ?></td>
									<td><?php echo $reparacion->COSTE ?></td>
									<td><?php echo $reparacion->TALLER ?></td>
								</tr>
								
						<?php	}
						}
							
						?>	
								
					  <?php 
						}
						echo "</table><br>";
					} ?>				
					
				<?php
				 	echo "</div>";
				}
			} ?>
		</div>
		
	</div>
	<script type="text/javascript" src="./js/accordionAndTabs.js"></script>

</body>
</html>