<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Gastos alumnos</title>
		<link rel="stylesheet" href="./css/tables.css">

	</head>

	<body>
		<div class="contenido" id="contenido">

			<h1 style="margin-top: 50px">Gastos alumnos</h1>
			
			<table>
				<tr>
					<th>DNI</th>
					<th>Apellidos</th>
					<th>Nombre</th>
					<th>Matrículas</th>
					<th>Clases</th>
					<th>Total</th>
				</tr>
				
				<?php
					if($gastosAlumnos!=null){
						foreach($gastosAlumnos as $gasto){
							echo "<tr>";
							echo "<td>" . $gasto->DNI . "</td>";
							echo "<td>" . $gasto->APELLIDOS . "</td>";
							echo "<td>" . $gasto->NOMBRE . "</td>";
							echo "<td>" . $gasto->COSTEMATRICULAS . "</td>";
							echo "<td>" . $gasto->COSTECLASES . "</td>";
							echo "<td>" . $gasto->TOTAL . "</td>";
							echo "</tr>";
						}
					}
				?>
			</table>
			<?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons');?>
		</div>
	</body>
</html>