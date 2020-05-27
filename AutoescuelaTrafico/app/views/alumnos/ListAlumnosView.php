<!DOCTYPE html>
<html>
	<head>
		<title> Lista Alumnos </title>
		<link rel="stylesheet" href="./css/tables.css">

	</head>
	<body>
		<div class = "contenido" id = "contenido">
			
			<h1>Lista de alumnos:</h1>
			<br>
			
		<table>
			<?php 
				foreach( $listaProf as $num=>$alumno) { ?>
				<tr>
					<td>
					<?php echo $alumno -> getApellidos() . ", " . $alumno ->getNombre() . " - " . $alumno -> getDni() . "<br>"; ?>
					</td>
				</tr>
				<?php } ?>
			</table>
			
			<?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons');?>
		</div>
	</body>
</html>
