<!DOCTYPE html>
<html>
	<head>
		<title> Lista Alumnos </title>
		<link rel="stylesheet" href="./css/tables.css">

	</head>
	<body>
		<div class = "contenido" id = "contenido">


		<div class="ZONA FILTRO BOTONES">
			
			<div>
				<button class="nuevaEntrada" id='openPopup' >AÑADIR ALUMNO</button>
			</div>
			
				<?php require_once __DIR__."/addAlumnoView.php";?>
				<script type="text/javascript" src="./js/popup.js"></script>
			</div>


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
				
			<form class="" id="" action="?controller=Alumnos&action=borrar" method="POST">
			
				<table>
					<?php
					foreach ($listaAdmin as $num => $alumno) { ?>
					<tr>
						<td>
						<label><input type="checkbox" name="<?php echo "cbox" . $num ?>" id="<?php echo "cbox" . $num ?>" value="<?php echo $alumno->getDni();?>"> <?php echo $alumno -> getApellidos() . ", " . $alumno ->getNombre() . " - " . $alumno -> getDni() . "<br>"; ?> </label><br>
						</td>
					<?php } ?>
					</tr>
				</table>
				
				<input type="submit" value="Borrar seleccion">
				
			</form>							
			
		<?php	} ?>
			
			<?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons');?>
		</div>
	</body>

</html>
