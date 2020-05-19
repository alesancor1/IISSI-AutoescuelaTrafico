<!DOCTYPE html>
<html>
	<head>

		<meta charset="UTF-8">
		<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

		<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,600,700|Trade+Winds&display=swap');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Montserrat';
}

body{
  font-size: 14px;
  letter-spacing: 1px;
}
.wrapper{
  display: flex;
  width: 100%;
}

.sidebar{
  position: relative;
}

.sidebar_inner {
  width: 50px;
  position: fixed;
  top: 0;
  left: 0;
  height: 100vh;
  background: #5558c9;
  transition: all 0.3s ease;
}

.sidebar_inner .profile_info {
  padding: 20px;
  text-align: left;
}
.sidebar_inner .profile_info .icon{
	position: absolute;
	left: 9px;
	top: 15px;
	font-size: 40px;
	color: #c4dcff;
}
.sidebar_inner .profile_info p{
	white-space: nowrap;
 	overflow: hidden;
 	margin-left: 50px;
	color: #c4dcff;
	font-weight: 800;
}
.sidebar_inner .siderbar_menu{
    height: 490px;
    overflow-x: hidden;
    overflow-y: auto;
}

.sidebar_inner .siderbar_menu > li > a {
  padding: 12px 15px;
  display: flex;
  align-items: center;
  position: relative;
  margin-bottom: 1px;
  color: #c4dcff;
}

.sidebar_inner .siderbar_menu > li > a .icon {
  font-size: 25px;
  margin-right: 15px;
}

.sidebar_inner .siderbar_menu > li.active > a,
.sidebar_inner .siderbar_menu > li > a:hover{
  background: #3d3d79;
  color: #fff;
}

.sidebar_inner .siderbar_menu > li > a .arrow{
  position: absolute;
  top: 20px;
  right: 20px;
  transition: all 0.3s ease;
  visibility: hidden;
}

.sidebar .logout_btn button{
  cursor:pointer;
  position: absolute;
  bottom: 20px;
  left: 20px;
  border: none;
  color: #c4dcff;
  text-align: left;
  transition: all 0.3s ease;
  font-size:30px;
  background-color: transparent;
}

.sidebar .logout_btn button:hover{
  color: #3d3d79;
}

.sidebar_inner .close{
    position: absolute;
    top: 5px;
    right: 15px;
    font-size: 25px;
    color: #fff;
  cursor: pointer;
  display: block;
}

.sidebar_inner .close:hover,
.navbar .hamburger:hover{
  opacity: 0.7;
}

.accordion{
  background: #6f6fc7;
  padding-left: 50px;
  height: 0px;
  transition: all 0.3s ease;
  overflow: hidden;
}

.accordion li a{
  display: block;
  color: #c4dcff;
  padding: 12px 0;
  padding-left: 10px;
}

.accordion li:last-child a{
  border-bottom: 0px;
}

.accordion li a:hover,
.accordion li a.active{
  color: #fff;
}

.siderbar_menu > li.active .accordion{
  height: 90px;
}

.siderbar_menu > li.active .arrow{
  transform: rotate(180deg);
  transition: all 0.3s ease;
}
.close{
	padding-right: 3px;
	background-color: #5558c9;
	position: absolute;
	height: 100%;
	left: 50px;
	top: 0;
	color: white;
	transition: all 0.3s ease;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	z-index: 10;
}
.contenido{
	margin-left: 75px;
	transition: all 0.3s ease;
	z-index: 100;
}
@media screen and (max-width: 700px){
	.contenido{
		z-index: 0;
	}
}

		</style>

		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script>
			/*acordeones desplegables*/
			$(document).ready(function() {
				$(".siderbar_menu li").click(function() {
					var width = getComputedStyle(document.getElementById("mySidebar")).width;
					var arrows = document.getElementsByClassName("arrow");
					if(width.localeCompare("50px")==0){
						document.getElementById("toggleButtonArrow").className = "fas fa-chevron-left";
						document.getElementById("mySidebar").style.width = "250px";
						document.getElementById("toggleButton").style.left = "250px";
						for(var i = 0; i<arrows.length; i++)
							arrows[i].style.cssText = "visibility: visible; transition: all 0.3s ease;";
						if(window.innerWidth>=700)
							document.getElementById("contenido").style.marginLeft = "275px";
					}
					$(".siderbar_menu li").removeClass("active");
					$(this).addClass("active");
				});
			});

			/*boton de abrir/cerrar*/
			function toggleNav(x){
				var width = getComputedStyle(document.getElementById("mySidebar")).width;
				var arrows = document.getElementsByClassName("arrow");
				if(width.localeCompare("50px")==0){
					document.getElementById("toggleButtonArrow").className = "fas fa-chevron-left";
					document.getElementById("mySidebar").style.width = "250px";
					document.getElementById("toggleButton").style.left = "250px";
					for(var i = 0; i<arrows.length; i++)
						arrows[i].style.cssText = "visibility: visible; transition: all 0.3s ease;";
					if(window.innerWidth>=700)
						document.getElementById("contenido").style.marginLeft = "275px";
				}
				else{
					$(".siderbar_menu li").removeClass("active");
					document.getElementById("toggleButtonArrow").className = "fas fa-chevron-right";
					document.getElementById("mySidebar").style.width = "50px";
					document.getElementById("toggleButton").style.left = "50px";
					for(var i = 0; i<arrows.length; i++)
						arrows[i].style.cssText  = "visibility: hidden; transition: none;";
					document.getElementById("contenido").style.marginLeft = "75px";
					}
				}
		</script>
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