<!DOCTYPE html>
<html>
	
<head>
	<title>Vehiculos información</title>
	<link rel="stylesheet" href="./css/tables.css">
</head>

<body>
	
	<div class="contenido" id="contenido">
		
		<?php if ($infoVehiculos!=null){
			foreach ($infoVehiculos as $num => $infoVehiculo) {
				echo "MODELO: " . $infoVehiculo->MODELO . "<br>";
				echo "MATRICULA: " . $infoVehiculo->MATRICULA . "<br>";
				echo "ESTADO: " . $infoVehiculo->ESTADO . "<br>";
				echo "TIPO DE SEGURO: " . ($infoVehiculo->TIPOSEGURO !=null ? $infoVehiculo->TIPOSEGURO : " - ") . "<br>";
				echo "FECHA ULTIMA ITV: " . $infoVehiculo->FECHA . "<br>";
				echo "RESULTADO ULTIMA ITV: " . $infoVehiculo->REVISION . "<br>";
				echo "TIPO DE CUOTA: " . ($infoVehiculo->TIPOCUOTA !=null ? $infoVehiculo->TIPOCUOTA : " - ") . "<br>";
				echo "IMPORTE DE LA CUOTA: " . ($infoVehiculo->IMPORTECUOTA !=null ? $infoVehiculo->IMPORTECUOTA : " - ") . "<br><br>";
			
			?>
				<table>
					
				<?php
				if ($infoReparaciones!=null) { ?>
					<tr>
						<th>Fecha</th>
						<th>Descripcion</th>
						<th>Importe</th>
						<th>Taller</th>
					</tr>
			
				<?php
					foreach ($infoReparaciones as $num => $infoReparacione) {
						if ($infoReparacione->MATRICULA == $infoVehiculo->MATRICULA) {
					?>		<tr>
								<td><?php echo $infoReparacione->FECHA ?></td>
								<td><?php echo $infoReparacione->DESCRIPCION ?></td>
								<td><?php echo $infoReparacione->COSTE ?></td>
								<td><?php echo $infoReparacione->TALLER ?></td>
							</tr>
				  <?php }
					}
				} ?>
				</table>
				
			<?php	
			}
		} ?>
		
	</div>

</body>
</html>