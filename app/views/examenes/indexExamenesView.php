<!DOCTYPE html>
<html>
<head>
	<title>Examenes</title>
	<link rel="stylesheet" href="./css/tables.css">
</head>
<body>
	<div id = contenido class = contenido>
		<!-- Tabla Examenes Teoricos-->
		<div class = "teoricos" style = "margin-top: 40px">
		<?php if($allExamenes["teoricos"] != null){
			?>	
			<h3>EXAMENES TEORICOS</h3>
			<table>
				<tr>
			    	<th>Fecha</th>
			        <th>Calificacion</th>
			        <th>nº Fallos</th>
		    	</tr>
		  	<?php foreach($allExamenes["teoricos"] as $num=>$examenT){
		  			echo "<tr>";
		  			echo "<td>". $examenT->getFecha(). "</td>";
		  			echo "<td>". $examenT->getCalificacion(). "</td>";
					echo "<td>". $examenT->getNFallos(). "</td>";
					echo "</tr>";
		  		}
			}?>
			</table>
		</div>

		<!-- Tabla Examenes Practicos-->
		<div class = "practicos" style = "margin-top: 40px">
		<?php if($allExamenes["circulacion"] != null || $allExamenes["pista"] != null){
			 ?>
			<h3>EXAMENES PRACTICOS</h3>
				<table>
					<tr>
						<th>Fecha</th>
						<th>Tipo de Examen</th>
						<th>Calificacion</th>
						<th>Faltas Leves</th>
						<th>Faltas Deficientes</th>
						<th>Faltas Eliminatorias</th>
					</tr>
			<?php if($allExamenes["circulacion"] != null){
				?>
				<?php foreach($allExamenes["circulacion"] as $num => $tupla){
						foreach($tupla as $Permiso=>$examenPC){
							echo "<tr>";
							echo "<td>". $examenPC->getFecha() ."</td>";
							echo "<td> Circulacion (". $Permiso. ")</td>";
							echo "<td>". $examenPC->getCalificacion(). "</td>";
							echo "<td>". $examenPC->getFaltasLeves(). "</td>";
							echo "<td>". $examenPC->getFaltasDeficientes(). "</td>";
							echo "<td>". $examenPC->getFaltasEliminatorias(). "</td>";
						}				
				}
			}
			if($allExamenes["pista"] != null){
				foreach($allExamenes["pista"] as $num => $examenPP){
					echo "<tr>";
					echo "<td>". $examenPP->getFecha() ."</td>";
					echo "<td> Pista </td>";
					echo "<td>". $examenPP->getCalificacion(). "</td>";
					echo "<td>". $examenPP->getFaltasLeves(). "</td>";
					echo "<td>". $examenPP->getFaltasDeficientes(). "</td>";
					echo "<td>". $examenPP->getFaltasEliminatorias(). "</td>";
				}
			}
			?></table><?php
		} ?>
		</div>
	<div>
</body>
</html>