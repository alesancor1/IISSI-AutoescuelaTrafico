<!DOCTYPE html>
<html>
	
<head>
	<title>Vehiculos información</title>
	<!-- PERSONALIZAR ESTE CSS -->
    <!-- <link rel="stylesheet" type="text/css" href="./css/addAnunciosView.css"> -->
</head>

<body>
	
	<div class="contenido" id="contenido">
		
		<?php if ($infoVehiculos!=null){
			foreach ($infoVehiculos as $num => $infoVehiculo) {
				echo $infoVehiculo->MODELO . "<br>";
				echo $infoVehiculo->MATRICULA . "<br>";
				echo $infoVehiculo->ESTADO . "<br>";
				echo $infoVehiculo->COMPAÑIA . "<br>";
				echo $infoVehiculo->TIPOSEGURO . "<br>";
				echo $infoVehiculo->FECHA . "<br>";
				echo $infoVehiculo->REVISION . "<br>";
				echo $infoVehiculo->TIPOCUOTA . "<br>";
				echo $infoVehiculo->IMPORTECUOTA . "<br><br>";
			}
		}
		
		?>
		
	</div>

	
</body>


</html>