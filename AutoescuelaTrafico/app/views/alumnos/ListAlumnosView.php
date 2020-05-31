<!DOCTYPE html>
<html>
	<head>
		<title> Lista Alumnos </title>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" type="text/css" href="./css/listAlumnosProfView.css">
	</head>
	<body>
		<div class = "contenido" id = "contenido">
		
			<div class="filtros">
				<h1>Lista de alumnos:</h1>
				<form class="filtroForm" name="" id="filtroForm" action="?controller=Validator&action=validate" method="POST">
					<input type="text" id="filtro" name="filtro" placeholder="Nombre, apellidos o DNI" oninput="setCustomValidity('');
						var res = validateFormListAlumnosView();
						res.length==0 ? setCustomValidity('') :  setCustomValidity(res);">
					<input type="submit" hidden>
					<!-- para el ValidatorPHP -->
                    <input type="hidden" name = "validateForm" value = "alumnosFilterProf">
                    <input type="hidden" name = "callbackUri" value = "?controller=Alumnos&action=listaProfesor">
                    <input type="hidden" name = "callbackError" value = "?controller=Alumnos&action=listaProfesor">
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
		
		<!-- <script type="text/javascript">
			$(document).ready(function(){
				$("#filtroForm").submit(function(){
					return validateFormListAlumnosView();
				})
			});
		</script> -->
		
	</body>
</html>
