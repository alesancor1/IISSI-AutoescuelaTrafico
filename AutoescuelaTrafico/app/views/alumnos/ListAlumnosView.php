<!DOCTYPE html>
<html>
	<head>
		<title> Lista Alumnos </title>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/listAlumnosProfView.css">
		<script src="./js/validacionListAlumnosView.js" type="text/javascript"></script>
	</head>
	<body>
		<div class = "contenido" id = "contenido">
		
			<div class="filtros">
				<h1>Lista de alumnos:</h1>
				<form class="filtroForm" id="filtroForm" action="?controller=Alumnos&action=listaProfesor" method="POST">
					<input type="text" id="filtro" name="filtro" placeholder="Nombre, apellidos o DNI">
					<input type="submit" hidden>
				</form>
			</div>
			
			<table>
				<tr>
					<th style="border-radius: 20px 20px 0 0">Alumnos</th>
				</tr>
				<?php 
				if($listaProf!=null){
					foreach( $listaProf as $num=>$alumno) { ?>
				<tr>
					<td>
					<?php echo $alumno -> getApellidos() . ", " . $alumno ->getNombre() . " - " . $alumno -> getDni() . "<br>"; ?>
					</td>
				</tr>
				<?php } 
				}?>
			</table>
			
			<?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons');?>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#filtroForm").submit(function(){
					return validateFormListAlumnosView();
				})
			});
		</script>
		
	</body>
</html>
