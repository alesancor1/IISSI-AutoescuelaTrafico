<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Desglose general</title>
		<link rel="stylesheet" href="./css/tables.css">

	</head>

	<body>
		<div class="contenido" id="contenido">

			<h1>Desglose general</h1>

			<!-- CORREGIR PARA ESTE -->
			<div class="filtros">
				<form class="" id="" action="?controller=Administracion&action=getDesglose" method="POST">
					<label for="mes"><b>Mes</b></label>
					<select id="mes" name="mes">
						<option value="">Mostrar todo</option>
						<option value="1">Enero</option>
						<option value="2">Febrero</option>
						<option value="3">Marzo</option>
						<option value="4">Abril</option>
						<option value="5">Mayo</option>
						<option value="6">Junio</option>
						<option value="7">Julio</option>
						<option value="8">Agosto</option>
						<option value="9">Septiembre</option>
						<option value="10">Octubre</option>
						<option value="11">Noviembre</option>
						<option value="12">Diciembre</option>					
					</select>
					
					<label for="anyo"><b>Año</b></label>
					<input type="text" name="anyo" id="anyo">

					<input type="submit">
				</form>
			</div>
			
			<div>
				<table>
					<tr>
						<th>Mes</th>
						<th>Año</th>
						<th>Pago clases</th>
						<th>Pago tasas</th>
						<th>Matriculación</th>
						<th>Reparaciones turismos</th>
						<th>Reparaciones motocicletas</th>
						<th>ITV turismos</th>
						<th>ITV motocicletas</th>
						<th>Salarios</th>
						<th>Seguro semanal</th>
						<th>Seguro mensual</th>
						<th>Seguro trimestral</th>
						<th>Seguro anual</th>
					</tr>
					
					<?php
					 
					if($desgloseGeneral!=null){
						foreach($desgloseGeneral as $desglose){
							echo "<tr>";
							echo "<td>" . $desglose->MES . "</td>";
							echo "<td>" . $desglose->ANYO . "</td>";
							echo "<td>" . $desglose->PAGOCLASES . "</td>";
							echo "<td>" . $desglose->PAGOTASAS . "</td>";
							echo "<td>" . $desglose->MATRICULAS . "</td>";
							echo "<td>" . $desglose->REPARAT . "</td>";
							echo "<td>" . $desglose->REPARAM . "</td>";
							echo "<td>" . $desglose->ITVT . "</td>";
							echo "<td>" . $desglose->ITVM . "</td>";
							echo "<td>" . $desglose->SALARIOS . "</td>";
							echo "<td>" . $desglose->SEGSEM . "</td>";
							echo "<td>" . $desglose->SEGMENS . "</td>";
							echo "<td>" . $desglose->SEGTRIM . "</td>";
							echo "<td>" . $desglose->SEGANU . "</td>";
							echo "</tr>";
						}
					}
					
					?>
				</table>
				
				<?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons');?>
			</div>
			
		</div>


	</body>
</html>