<!DOCTYPE html>
<html>
<head>
	<title>Tutorias</title>
	<link rel="stylesheet" href="./css/tables.css">
</head>
	
<body>
	<div id="contenido" class="contenido">
		<div style="margin-top: 40px">	
			<h1>HORAS DE TUTORIA</h1>
			
			<div>
				<table>
					<tr>
						<th>Profesor</th>
						<th>Horario</th>
					</tr>
				
				<?php 
					if($tutoriasInformacion!=null){
						foreach($tutoriasInformacion[0] as $num=>$tutoria){
							echo "<tr>";
							echo "<td>" . $tutoria->APELLIDOS . ", " . $tutoria->NOMBRE . "</td>";
							echo "<td>" . $tutoria->HORA . ", " . $tutoria->FECHA . "</td>";
							echo "</tr>";
						}
					}
				?>
				</table>
				<?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons');?>

			</div>
		</div>
	</div>
	
</body>
</html>