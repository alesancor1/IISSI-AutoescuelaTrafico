<!DOCTYPE html>
<html>
	
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Profesorado</title>
		<link rel="stylesheet" type="text/css" href="./css/accordionAndTabs.css">
		<link rel="stylesheet" type="text/css" href="./css/indexProfesoresAdminView.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<style> body{ background: white; }</style>
	</head>

	<body>

		<div class="contenido" id="contenido">
			<h1 style="margin: 50px 0 0 30px">Profesores:</h1>
			
			<div>
				<button class="nuevaEntrada" id="openPopup">Añadir</button>
			</div>
			
			<?php require_once __DIR__."/addProfesorView.php";?>
			<script type="text/javascript" src="./js/popup.js"></script>
			
			<div class=accordionProf>
			<?php
				if($infoProfesores!=null){
					foreach($infoProfesores as $num=>$profesor){
						echo "<button class='accordionContent'>" . $profesor->getApellidos() . ", " . $profesor->getNombre() . "</button>";
						echo "<div class='panel'>";
						echo "<p><b>DNI:</b> " . $profesor->getDni() . "</p>";
						echo "<p><b>Fecha contrato:</b> " . $profesor->getFechaContrato() . "</p>";
						echo "<p><b>Teléfono:</b> " . $profesor->getTelefono() . "</p>";
						echo "<p><b>Salario mensual:</b> " . $profesor->getSalario() . "</p>";
						echo "<p><b>Nº SS:</b> " . $profesor->getNSeguridadSocial() . "</p>";
						echo "<p><b>Permisos que imparte:</b></p>";
						echo "<ul>";
						foreach($permisosImpartidos as $num1=>$permisoImpartido){
							if ($profesor -> getDni() == $permisoImpartido -> DNI) {
								echo "<li>" . $permisoImpartido -> TIPOPERMISO . "</li>";
							}
						}
						echo "</ul>";
						echo "<form class='' id='' action='?controller=Profesores&action=deleteProfesor' method='POST'>";
						echo "<input type='hidden' id='dni' name='dni' value='" . $profesor->getDni() . "'>";
						echo "<input type='hidden' id='nombre' name='nombre' value='" . $profesor->getNombre() . "'>";
						echo "<input type='hidden' id='fechaContrato' name='fechaContrato' value='" . $profesor->getFechaContrato() . "'>";
						echo "<input type='hidden' id='telefono' name='telefono' value='" . $profesor->getTelefono() . "'>";
						echo "<input type='hidden' id='salario' name='salario' value='" . $profesor->getSalario() . "'>";
						echo "<input type='hidden' id='nss' name='nss' value='" . $profesor->getNSeguridadSocial() . "'>";
						echo "<button type='submit' class='eliminarProfesor'>X</button>";
						echo "</form>";
						echo "</div>";
					}	
				}
			?>
			</div>
		</div>		
		<!-- Acordeon -->
		<script type="text/javascript" src="./js/accordionAndTabs.js"></script>
	</body>

</html>