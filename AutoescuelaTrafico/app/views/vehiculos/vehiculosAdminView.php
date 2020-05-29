<!DOCTYPE html>
<html>
	
<head>
	<title>Vehiculos información</title>
	<link rel="stylesheet" href="./css/tables.css">
	<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style> body{ background: white; }</style>
</head>

<body>
	
	<div class="contenido" id="contenido">
				
		<?php if ($infoVehiculos!=null){
			foreach ($infoVehiculos as $num => $infoVehiculo) {
				echo "<button class='accordionContent'>" . $infoVehiculo->MODELO . "</button>";
				
				echo "<div class='panel'>";
				
				echo "MATRICULA: " . $infoVehiculo->MATRICULA . "<br>";
				echo "ESTADO: " . $infoVehiculo->ESTADO . "<br>";
				echo "TIPO DE SEGURO: " . ($infoVehiculo->TIPOSEGURO !=null ? $infoVehiculo->TIPOSEGURO : " - ") . "<br>";
				echo "FECHA ULTIMA ITV: " . $infoVehiculo->FECHA . "<br>";
				echo "RESULTADO ULTIMA ITV: " . $infoVehiculo->REVISION . "<br>";
				echo "TIPO DE CUOTA: " . ($infoVehiculo->TIPOCUOTA !=null ? $infoVehiculo->TIPOCUOTA : " - ") . "<br>";
				echo "IMPORTE DE LA CUOTA: " . ($infoVehiculo->IMPORTECUOTA !=null ? $infoVehiculo->IMPORTECUOTA : " - ") . "<br><br>";
			
			?>
				
					
				<?php
				if ($infoReparaciones!=null) {
			
					foreach ($infoReparaciones as $matricula => $reparaciones) {
						if ($matricula == $infoVehiculo->MATRICULA) {
							
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
	<script type="text/javascript" src="./js/accordionAndTabs.js"></script>

</body>
</html>