<!DOCTYPE html>
<html>
	<head>
		<title> Lista Alumnos </title>
		<link rel="stylesheet" href="./css/tables.css">

	</head>
	<body>
		<div class = "contenido" id = "contenido">

			<?php
			if ($listaAdmin != null) {
							
			echo "<h1>Lista de alumnos</h1>";
			?>
			<form class="" id="" action="?controller=Alumnos&action=listaAdministrador" method="POST">
				
				<select id="permiso" name="permiso" onchange="this.form.submit()">
					<option disabled selected>Filtrar por permiso</option>
					<option value="">Todos</option>
					<option value="A2">Permiso A2</option>
					<option value="B">Permiso B</option>
				</select>				
			</form>
				
				<form class="" id="" action="ACCIONDEBORRARDELCONTROLADORALUMNOS" method="POST">
			
				<table>
					<?php
					foreach ($listaAdmin as $num => $alumno) { ?>
					<tr>
						<td>
						<label><input type="checkbox" id="<?php echo "cbox" . $num ?>" value="on"> <?php echo $alumno -> getApellidos() . ", " . $alumno ->getNombre() . " - " . $alumno -> getDni() . "<br>"; ?> </label><br>
						</td>
					<?php } ?>
					</tr>
				</table>
			</form>
			
		<?php	} ?>
			
			<?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons');?>
		</div>
	</body>

</html>
