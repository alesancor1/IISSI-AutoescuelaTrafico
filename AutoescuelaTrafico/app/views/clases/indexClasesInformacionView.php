<!DOCTYPE html>
<html>
<title>Tutorias</title>
	
<body>
	<div id="contenido" class="contenido">
		
		<h1>Información clases</h1>
		
		<div>
			<table>
				<tr>
					<th>Clases (ID)</th>
					<th>Fechas</th>
					<th>Hora</th>
					<th>Clases pagadas</th>
				</tr>
			
			<?php 
				if($clasesInformacion!=null){
					echo $_SESSION["paginator"]->createLinks(4,'');
					foreach($clasesInformacion as $num => $clase){
						echo "<tr>";
						echo "<td>" . $clase->OID_C . "</td>";
						echo "<td>" . $clase->FECHA . "</td>";
						echo "<td>" . $clase->HORAINICIO . "</td>";
						echo "<td>" . $clase->CANTIDAD . "</td>";
						echo "</tr>";
					}
				}
			?>

			</table>
		</div>
	</div>
	
</body>
</html>