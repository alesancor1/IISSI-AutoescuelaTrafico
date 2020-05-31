<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Desglose general</title>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/indexDesgloseGeneral.css">

	</head>

	<body>
		<div class="contenido" id="contenido">

			<div class="filtros">

				<h1>Desglose general</h1>

				<form class="form" id="" action="?controller=Validator&action=validate" method="POST">
					<label for="mes"><b>Mes</b></label>
					<select id="mes" name="mes">
						<option value="">Mostrar todo</option>
						<option value="Enero">Enero</option>
						<option value="Febrero">Febrero</option>
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
					<input type="text" name="anyo" id="anyo" oninput="validateAnyo();">

					<button type="submit"><i class = "fa fa-arrow-right"></i></button>
					<!-- para el ValidatorPHP -->
                   	<input type="hidden" name = "validateForm" value = "desgloseFilter">
                    <input type="hidden" name = "callbackUri" value = "?controller=Administracion&action=getDesglose">
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
							echo "<td style = 'color:green'>" . ($desglose->PAGOCLASES == null ? " " : +$desglose->PAGOCLASES)  . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->PAGOTASAS == null ? " " : -$desglose->PAGOTASAS) . "</td>";
							echo "<td style = 'color:green'>" . ($desglose->MATRICULAS == null ? " " : +$desglose->MATRICULAS) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->REPARAT == null ? " " : -$desglose->REPARAT) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->REPARAM == null ? " " : -$desglose->REPARAM) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->ITVT == null ? " " : -$desglose->ITVT) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->ITVM == null ? " " : -$desglose->ITVM) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->SALARIOS == null ? " " : -$desglose->SALARIOS) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->SEGSEM == null ? " " : -$desglose->SEGSEM) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->SEGMENS == null ? " " : -$desglose->SEGMENS) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->SEGTRIM == null ? " " : -$desglose->SEGTRIM) . "</td>";
							echo "<td style = 'color:red'>" . ($desglose->SEGANU == null ? " " : -$desglose->SEGANU) . "</td>";
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