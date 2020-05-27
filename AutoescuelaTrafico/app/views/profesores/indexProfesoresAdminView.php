<!DOCTYPE html>
<html>
	
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Profesorado</title>
		<style>
			/* ACORDEON */
			.accordionContent {
				background-color: #87B9C7;
				color: #fff;
				cursor: pointer;
				padding: 18px;
				width: 100%;
				border: none;
				text-align: left;
				outline: none;
				font-size: 15px;
				transition: 0.4s;
			}

			.accordionContent .active, .accordionContent:hover {
				background-color: #037FB2;
			}

			.panel {
				padding: 0 18px;
				background-color: white;
				max-height: 0;
				overflow: hidden;
				transition: max-height 0.2s ease-out;
			}
		</style>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	</head>

	<body>

		<div class="contenido" id="contenido">
			<h1>Profesores:</h1>
			
			<div>
				<button class="nuevaEntrada" id="openPopup">Añadir</button>
			</div>
			
			<?php require_once __DIR__."/addProfesorView.php";?>
			<script type="text/javascript" src="./js/popup.js"></script>
			
			<?php
				if($infoProfesores!=null){
					foreach($infoProfesores as $num=>$profesor){
						echo "<button class='accordionContent'>" . $profesor->getApellidos() . ", " . $profesor->getNombre() . "</button>";
						echo "<div class='panel'>";
						echo "<p>DNI: " . $profesor->getDni() . "</p>";
						echo "<p>Fecha contrato: " . $profesor->getFechaContrato() . "</p>";
						echo "<p>Teléfono: " . $profesor->getTelefono() . "</p>";
						echo "<p>Salario mensual: " . $profesor->getSalario() . "</p>";
						echo "<p>Nº SS: " . $profesor->getNSeguridadSocial() . "</p>";
						echo "<p>Permisos que imparte:</p>";
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
		
		
		<!-- Acordeon -->
		<script>
			var acc = document.getElementsByClassName("accordionContent");
			var i;

			for ( i = 0; i < acc.length; i++) {
				acc[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.maxHeight) {
						panel.style.maxHeight = null;
					} else {
						panel.style.maxHeight = panel.scrollHeight + "px";
					}
				});
			}
		</script>
	</body>

</html>