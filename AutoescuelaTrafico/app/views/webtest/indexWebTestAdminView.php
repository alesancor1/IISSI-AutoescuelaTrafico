<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/webTestAdminView.css">
	</head>
	<body>
		<div class="contenido" id="contenido">


			<div class="toolbox">

				<h1>CREDENCIALES WEB TEST</h1>

				<!-- AÑADIR ALUMNO -->		
				<button class="nuevaEntrada" id='openPopup'><i class="fa fa-user-plus"></i></button>
				
				<form action="?controller=Validator&action=validate" method="POST">
					<input type="text" id="filtro" name="filtro" placeholder="Buscar un usuario">
					<input type="hidden" name="searchbutton">
					<!-- para el ValidatorPHP -->
                   	<input type="hidden" name = "validateForm" value = "webTestsFilter">
                    <input type="hidden" name = "callbackUri" value = "?controller=WebTest&action=indexRecursosWebTest">
				</form>			
			</div>
			<!--popup-->
			<?php require_once __DIR__."/addWebTestView.php";?>
			<script type="text/javascript" src="./js/popup.js"></script>

			
			<?php if ($recursosAdministrador != null) { ?>
			<table>
				<tr>
					<th>Usuario</th>
					<th>Clave</th>
					<th>Última renovación</th>
					<th>Fecha de caducidad</th>
					<th>Tiempo restante</th>
					<th></th>
				</tr>

					<?php foreach ($recursosAdministrador as $num => $accesoWeb) {
						echo "<tr>";
						echo "<td>" . $accesoWeb -> getUsuario() . "</td>";
						echo "<td>" . $accesoWeb -> getClavePorDefecto() . "</td>";
						echo "<td>" . $accesoWeb -> getFechaRenovacion() . "</td>";
						echo "<td>" . $accesoWeb -> getFechaCaducidad() . "</td>";
						echo "<td>" . $accesoWeb -> getTiempoRestante() . "</td>";
					?> 
						<td>
						<form class="renovar" id="" action="?controller=WebTest&action=renovar" method="POST">
						
							<input type="hidden" id="dni" name="dni" value="<?php echo $accesoWeb -> getUsuario(); ?>">
							<button type="submit" class="renovarAccesoWeb">RENOVAR</button>
						
						</form>
						</td>
					</tr>
						
			<?php	}
				}
				?>
			</table>
		</div>
	</body>
</html>