<!DOCTYPE html>
<html>
	
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Profesorado</title>
		<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
		<link rel="stylesheet" type="text/css" href="./css/indexProfesoresAdminView.css">
		<link rel="stylesheet" type="text/css" href="./css/tables.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<style> body{ background: white; }</style>
	</head>

	<body>

		<div class="contenido" id="contenido">
			
			<div style="position: relative; margin-bottom: 10px">
				<h1 style="margin: 50px 0 0 30px; transform: none; left:0;">Profesores:</h1>
				<button class="nuevaEntrada" id="openPopup"><i class="fa fa-user-plus"></i></button>
			</div>
			
			<?php require_once __DIR__."/addProfesorView.php";?>
			<script type="text/javascript" src="./js/popup.js"></script>
			
			<div class=accordionProf>
			<?php
				if($infoProfesores!=null){
					foreach($infoProfesores as $num=>$profesor){
						$botonEliminar = "<span class='eliminarProf' onclick=document.getElementById('deleteProf".$num."').submit()>X</span>";
						echo "<button class='accordionContent'>" . $profesor->getApellidos() . ", " . $profesor->getNombre() . $botonEliminar . "</button>";
						
						echo "<div class='panel'>";
						echo "<table>";
						echo "<tr><td><b>DNI:</b></td><td> " . $profesor->getDni() . "</td></tr>";
						echo "<tr><td><b>Fecha contrato:</b></td><td>  " . $profesor->getFechaContrato() . "</td></tr>";
						echo "<tr><td><b>Teléfono:</b></td><td>  " . $profesor->getTelefono() . "</td></tr>";
						echo "<tr><td><b>Salario mensual:</b></td><td>  " . $profesor->getSalario() . "</td></tr>";
						echo "<tr><td><b>Nº SS:</b></td><td>  " . $profesor->getNSeguridadSocial() . "</td></tr>";
						echo "<tr><td><b>Permisos que imparte:</b></td><td> ";
						echo "<ul>";
						foreach($permisosImpartidos as $num1=>$permisoImpartido){
							if ($profesor -> getDni() == $permisoImpartido -> DNI) {
								echo "<li>" . $permisoImpartido -> TIPOPERMISO . "</li>";
							}
						}
						echo "</ul></td></tr></table>";

						echo "<form class='' id='deleteProf".$num."' action='?controller=Profesores&action=deleteProfesor' method='POST'>";
						echo "<input type='hidden' id='dni' name='dni' value='" . $profesor->getDni() . "'>";
						echo "<input type='hidden' id='nombre' name='nombre' value='" . $profesor->getNombre() . "'>";
						echo "<input type='hidden' id='fechaContrato' name='fechaContrato' value='" . $profesor->getFechaContrato() . "'>";
						echo "<input type='hidden' id='telefono' name='telefono' value='" . $profesor->getTelefono() . "'>";
						echo "<input type='hidden' id='salario' name='salario' value='" . $profesor->getSalario() . "'>";
						echo "<input type='hidden' id='nss' name='nss' value='" . $profesor->getNSeguridadSocial() . "'>";
						echo "</form>";
						echo "</div>";
					}	
				}
			?>
			</div>
		</div>
		
		<!-- imprime errores de validacion en servidor -->
		<?php if(isset($_SESSION["errores"])){ ?>
			<div class = "errorMessage">
		<?php foreach($_SESSION["errores"] as $error){
				   echo $error;			  
			}
			unset($_SESSION["errores"]); ?>	
		</div> <?php
		} ?>
		
		<!-- Acordeon -->
		<script type="text/javascript" src="./js/accordionAndTabs.js"></script>
	</body>

</html>