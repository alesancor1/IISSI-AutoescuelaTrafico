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

.sidebar .bg_shadow{
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background: #000;
  z-index: 998;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s ease;
}

.sidebar_inner {
  width: 250px;
  position: fixed;
  top: 0;
  left: 0;
  height: 100vh;
  background: #5558c9;
  z-index: 999;
  transition: all 0.3s ease;
}

.main_container {
  margin-left: 250px;
  width: calc(100% - 250px);
   transition: all 0.3s ease;
}

.sidebar_inner .profile_info {
  padding: 20px;
  text-align: center;
}

.sidebar_inner .profile_info .profile_img {
  width: 100px;
  margin: 0 auto 5px;
}

.sidebar_inner .profile_info .profile_img img {
  width: 100%;
  display: block;
}

.sidebar_inner .profile_info .profile_data .name {
  font-size: 18px;
  color: #fff;
  margin-bottom: 5px;
  font-family: 'Trade Winds';
}

.sidebar_inner .profile_info .profile_data span {
  color: #c4dcff;
}

.sidebar_inner .siderbar_menu{
      height: 490px;
    overflow: auto;
}

.sidebar_inner .siderbar_menu > li > a {
  padding: 12px 20px;
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
}

.sidebar .logout_btn button{
	cursor:pointer;
  position: absolute;
  bottom: 20px;
  left: 20px;
  width: 210px;
  border: 1px solid #fff;
  color: #3d3d79;
  border-radius: 3px;
  font-weight: 600;
  padding: 8px;
  text-align: center;
  transition: all 0.3s ease;
  font-size:18px;
}

.sidebar .logout_btn button:hover{
  background: #fff;
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

/*.navbar{
  background: #fff;
  height: 50px;
  width: 100%;
  box-shadow: 0 3px 5px rgba(0,0,0,0.125);
  display: flex;
  align-items: center;
  padding: 0 20px;
}*/

/*.navbar*/ 

/*	Hay que pegar la hamburguer a la barra o convertirlo en solapa */
.hamburger{
  font-size: 25px;
  position:absolute;
  right:0;
  cursor: pointer;
  margin-right: 50px;
  color: #5558c9;
  display: block;
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
  height: 100px;
}

.siderbar_menu > li.active .arrow{
  transform: rotate(180deg);
  transition: all 0.3s ease;
}


@media (max-width: 1024px) {
  .sidebar_inner{
    left: -115%;
    transition: all 0.5s ease;
  }
  .navbar .hamburger,
  .sidebar_inner .close{
    display: block;
  }
  .content .item{
    width: 47%;
  }
  .wrapper.active .sidebar_inner{
  left: 0;
  transition: all 0.5s ease;
}
}

@media (max-width: 528px) {
  .content .item{
    width: 100%;
  }
}
		</style>

		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script>
			$(document).ready(function() {
				$(".siderbar_menu li").click(function() {
					$(".siderbar_menu li").removeClass("active");
					$(this).addClass("active");
				});

				$(".hamburger").click(function() {
					$(".wrapper").addClass("active");
				});

				$(".close, .bg_shadow").click(function() {
					$(".wrapper").removeClass("active");
				});
			});
		</script>
	</head>

	<body>
		<div class="navbar">
       		<div class="hamburger">
       			<i class="fas fa-bars"></i>
       		</div>
       		
       </div>
		<div class="wrapper">
			<div class="sidebar">
				<div class="sidebar_inner">
					<!-- Datos del usuario -->
					<div class="profile_info">
						<div class="icon">
							<i class="fas fa-user"></i>
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
								<li class="active">
									<a href="?controller=Examenes">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Exámenes</p>
									</div></a>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Clases</p>
									</div>
									<div class="arrow">
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
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>WebTest</p>
									</div>
									<div class="arrow">
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
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Notificaciones</p>
									</div>
									<div class="arrow">
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
								<li class="active">
									<a href="?controller=Clases&action=HORARIOS">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Horario</p>
									</div></a>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Alumnos</p>
									</div>
									<div class="arrow">
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
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Notificaciones</p>
									</div>
									<div class="arrow">
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
								
								<li class="active">
									<a href="#">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Alumnado</p>
									</div>
									<div class="arrow">
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
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Profesorado</p>
									</div></a>
								</li>
								
								<li>
									<a href="A ClasesController metodo de horarios para administrador">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Clases</p>
									</div></a>
								</li>
								
								<li>
									<a href="A VehiculosController">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Vehículos</p>
									</div></a>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Recursos</p>
									</div>
									<div class="arrow">
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
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Administracion</p>
									</div></a>
								</li>
								
								<li>
									<a href="#">
									<div class="icon">
										<i class="fas fa-user"></i>
									</div>
									<div class='title'>
										<p>Notificaciones</p>
									</div>
									<div class="arrow">
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
					<div class="close">
						<i class="fas fa-times"></i>
					</div>
                
					<div class="logout_btn">
						<form action = './index.php' method = post>   
                    		<button type='submit' name = 'logout'><i class="fa fa-sign-out"></i></button>
                		</form>
					</div>

				</div>
			</div>
	</body>
</html>