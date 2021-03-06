<!DOCTYPE html>
<html>
	<head>
		<title> Lista alumnos </title>
		<link rel="stylesheet" href="./css/tables.css">
		<link rel="stylesheet" href="./css/listAlumnosAdminView.css">
	</head>

	<body>
		<div class = "contenido" id = "contenido">

		<!-- DATOS Y BOTON DE BORRAR -->
			<div class="data">

				<h1 class="titleList">Lista de alumnos</h1>

				<!-- AÑADIR ALUMNO -->
				<button class="nuevaEntrada" id='openPopup' ><i class="fa fa-user-plus"></i></button>
				<?php require_once __DIR__."/addAlumnoView.php";?>
				<script type="text/javascript" src="./js/popup.js"></script>

				<!-- COLLAPSE SELECT DE FILTRO -->
					<?php $limit = isset($_GET["limit"]) ? '&limit='.$_GET["limit"] : '' ?>
					<form class="" id="" <?php echo 'action=?controller=Alumnos&action=listaAdministrador'.$limit?> method="POST">			
						<select class="permiso" id="permiso" name="permiso" onchange="this.form.submit()">
							<option disabled selected>Filtrar por permiso</option>
							<option value="">Todos</option>
							<option value="A2">Permiso A2</option>
							<option value="B">Permiso B</option>
						</select>
					</form>

				<form class="" id="" action="?controller=Alumnos&action=borrar" method="POST">			
					<!-- borrar seleccion-->
					<button class="borrarSelec" type="submit"><i class="fa fa-trash"></i></button> 					
					<table>
						<tr>
							<th style="border-radius: 20px 20px 0 0">Alumnos</th>
						</tr>
						
					<?php if ($listaAdmin != null) {	
						foreach ($listaAdmin as $num => $alumno) { ?>
						<tr>
							<td>
							<label><input type="checkbox" name="<?php echo "cbox" . $num ?>" id="<?php echo "cbox" . $num ?>" value="<?php echo $alumno->getDni();?>"> <?php echo $alumno -> getApellidos() . ", " . $alumno ->getNombre() . " - " . $alumno -> getDni() . "<br>"; ?> </label><br>
							</td>
						</tr>
						<?php } ?>
					</table>				
				</form>	
			</div>						
			
		<?php	} ?>		
			<?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons');?>

			<!-- imprime errores de validacion en servidor -->
			<?php if(isset($_SESSION["errores"])){ ?>
				<div class = "errorMessage">
			<?php foreach($_SESSION["errores"] as $error){
					   echo $error;			  
				}
				unset($_SESSION["errores"]); ?>	
			</div> <?php
			} ?>
		</div>
		
		
		
	</body>

</html>
