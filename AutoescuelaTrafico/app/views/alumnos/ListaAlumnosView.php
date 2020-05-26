<!DOCTYPE html>
<html>
	<head>
		<title> Lista Alumnos </title>
	</head>
	<body>
		<div class = "contenido" id = "contenido">
			
			<?php 
			foreach( $listaProf as $num=>$alumno){
				echo "<p>";	
				print_r($alumno);
				echo "</p>";
			}
			
			 ?>
			
		</div>
	</body>

</html>
