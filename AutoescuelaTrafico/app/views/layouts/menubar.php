<!DOCTYPE html>
<html>
	<head>

		<meta charset="UTF-8">
		<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="./css/menubar.css">

		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="./js/menubar.js"></script>
	</head>

	<body>
		<div class="wrapper">

			<div class="close" onclick = "toggleNav(this)" id = "toggleButton">
				<i class="fas fa-chevron-right" id="toggleButtonArrow"></i>
			</div>

			<div class="sidebar">
				<div class="sidebar_inner" id = "mySidebar">
					<!-- Datos del usuario -->
					<div class="profile_info">
						<div class="icon">
							<i class="fas fa-user-circle"></i>
						</div>
						<p>Ingresado como:</p>
						<?php
							if(isset($_SESSION['cuenta'])){
								echo "<p>".$_SESSION['cuenta'][0]."</p>";
						?>
					</div>
					
					<ul class="siderbar_menu">
						<li>
						<?php
							$tipoUsuario = $_SESSION['cuenta'][2];
							switch ($tipoUsuario) {
								case 'Alumno': ?>
								<li>
									<a href="?controller=Examenes">
									<div class="icon">
										<i class="fas fa-clipboard"></i>
									</div>
									<div class='title'>
										<p>Exámenes</p>
									</div></a>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-chalkboard-teacher"></i>
									</div>
									<div class='title'>
										<p>Clases</p>
									</div>
									<div class="arrow" id = arrow>
										<i class="fas fa-chevron-down"></i>
									</div></a>
									<ul class="accordion">
										<li>
											<a href="?controller=Clases&action=indexClasesInformacion">Información</a>
										</li>
										<li>
											<a href="?controller=Clases&action=indexClasesTutorias">Tutorías</a>
										</li>
									</ul>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-check-circle"></i>
									</div>
									<div class='title'>
										<p>WebTest</p>
									</div>
									<div class="arrow" id = arrow>
										<i class="fas fa-chevron-down"></i>
									</div></a>
									<ul class="accordion">
										<li>
											<a href="?controller=WebTest&action=indexInformacionWebTest">Información</a>
										</li>
										<li>
											<a href="google.es">Ir al sitio</a>
										</li>
									</ul>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-bell"></i>
									</div>
									<div class='title'>
										<p>Notificaciones</p>
									</div>
									<div class="arrow" id = arrow>
										<i class="fas fa-chevron-down"></i>
									</div></a>
									<ul class="accordion">
										<li>
											<a href="?controller=Anuncios&action=index">Anuncios</a>
										</li>
										<li>
											<a href="MENSAJES">Mensajes</a>
										</li>
									</ul>
								</li>
								
								<?php break; 
								case 'Profesor':?>
								<li>
									<a href="?controller=Clases&action=HORARIOS">
									<div class="icon">
										<i class="fas fa-calendar"></i>
									</div>
									<div class='title'>
										<p>Horario</p>
									</div></a>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-user-graduate"></i>
									</div>
									<div class='title'>
										<p>Alumnos</p>
									</div>
									<div class="arrow" id = arrow>
										<i class="fas fa-chevron-down"></i>
									</div></a>
									<ul class="accordion">
										<li>
											<a href="?controller=Alumnos&action=PONER METODO">Lista</a>
										</li>
										<li>
											<a href="?controller=Alumnos&action=PONER METODO">Calificaciones</a>
										</li>
									</ul>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-bell"></i>
									</div>
									<div class='title'>
										<p>Notificaciones</p>
									</div>
									<div class="arrow" id = arrow>
										<i class="fas fa-chevron-down"></i>
									</div></a>
									<ul class="accordion">
										<li>
											<a href="?controller=Notificaciones&action=PONER METODO">Anuncios</a>
										</li>
										<li>
											<a href="google.es">Ir al sitio</a>
										</li>
									</ul>
								</li>
								
								
								<?php break;
								case 'Administrador':?>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-user-graduate"></i>
									</div>
									<div class='title'>
										<p>Alumnado</p>
									</div>
									<div class="arrow" id = arrow>
										<i class="fas fa-chevron-down"></i>
									</div></a>
									<ul class="accordion">
										<li>
											<a href="?controller=Alumnos&action=LISTADO">Lista</a>
										</li>
										<li>
											<a href="?controller=Alumnos&action=PONER METODO">Calificaciones</a>
										</li>
									</ul>
								</li>
								
								<li>
									<a href="A LISTADO DE PROFESORES">
									<div class="icon">
										<i class="fas fa-user-tie"></i>
									</div>
									<div class='title'>
										<p>Profesorado</p>
									</div></a>
								</li>
								
								<li>
									<a href="A ClasesController metodo de horarios para administrador">
									<div class="icon">
										<i class="fas fa-chalkboard-teacher"></i>
									</div>
									<div class='title'>
										<p>Clases</p>
									</div></a>
								</li>
								
								<li>
									<a href="A VehiculosController">
									<div class="icon">
										<i class="fas fa-car"></i>
									</div>
									<div class='title'>
										<p>Vehículos</p>
									</div></a>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-boxes"></i>
									</div>
									<div class='title'>
										<p>Recursos</p>
									</div>
									<div class="arrow" id = arrow>
										<i class="fas fa-chevron-down"></i>
									</div></a>
									<ul class="accordion">
										<li>
											<!-- Creo que es otro metodo -->
											<a href="?controller=WebTest&action=indexInformacionWebTest">Web Test</a>
										</li>
										<li>
											<a href="A ORDENADORES">Ordenadores</a>
										</li>
									</ul>
								</li>
								
								<li>
									<a href="A Administracion">
									<div class="icon">
										<i class="fas fa-toolbox"></i>
									</div>
									<div class='title'>
										<p>Administracion</p>
									</div></a>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-bell"></i>
									</div>
									<div class='title'>
										<p>Notificaciones</p>
									</div>
									<div class="arrow" id = arrow>
										<i class="fas fa-chevron-down"></i>
									</div></a>
									<ul class="accordion">
										<li>
											<a href="?controller=Anuncios&action=index">Anuncios</a>
										</li>
										<li>
											<a href="MENSAJES">Mensajes</a>
										</li>
									</ul>
								</li>
								<?php break; 
                		} ?>
						</li>
					</ul>		
					<?php } ?>         
					<div class="logout_btn">
						<form action = './index.php' method = post>   
                    		<button type='submit' name = 'logout'><i class="fa fa-sign-out"></i></button>
                		</form>
					</div>

				</div>
			</div>
	</body>
</html>