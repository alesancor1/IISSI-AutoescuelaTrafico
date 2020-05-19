<!DOCTYPE html>
<html>
<title>Tutorias</title>
	
<body>
	<div id="contenido" class="contenido">
		
		<h1>Tutorias del alumno</h1>
		
		<div>
			<table>
				<tr>
					<th>Profesor</th>
					<th>Horario</th>
				</tr>
			<?php 
				if($tutoriasInformacion!=null){
					foreach($tutoriasInformacion[0] as $num=>$tutoria){
						//	Habria que parsear los datos a la clase Tutoria en el modelo
						echo "<tr>";
						echo "<td>" . $tutoria->APELLIDOS . ", " . $tutoria->NOMBRE . "</td>";
						echo "<td>" . $tutoria->HORA . ", " . $tutoria->FECHA . "</td>";
						echo "</tr>";
					}
				}
			?>

			</table>
		</div>
	</div>
	
</body>
</html>