<!DOCTYPE html>
<html>
<title>Página principal</title>

<body>
<!-- Top navigation menu -->
<div class="topnav">
	<a class="faq" href="#faq"><i></i></a>
	<div class="search-container">
    	<form action="/action_page.php">
      	<input type="text" placeholder="Search.." name="search">
        	<button type="submit">Buscar<i class="fa fa-search"></i></button>
    	</form>
  	</div>
    <a class="logo" href="./index.php"><img src="" alt="Autoescuela tráfico"/> </a>
    
    <?php
    if(isset($_SESSION["cuenta"])){
        echo "<a class='cuenta' href='Anuncios.php'>Logeado como: ".$_SESSION["cuenta"][0]."</a>";

        echo "<form action='../public/index.php' method='post'>";
        echo "<input type='submit' name='cerrarSesion' value='Cerrar Sesion'></form>";
    }
    else{
        $url = "location.href='../public/index.php?controller=Login';";
        echo '<input type="button" onclick='.$url. ' value="Iniciar sesión"/>';
    }
    ?>
    
</div>

<!-- Banner -->
<div class="banner">
	<img src="banner.jpg" class="banner-img" alt=""/>
</div>

<!-- Botones -->
<div class="buttons">
	<div class="quienes_somos">
    	<a href="#quienes_somos"> ¿Quiénes somos?</a>
    </div>
    
    <div class="ofertas">
    	<a href="#ofertas"> Ofertas</a>
    </div>
    
    <div class="contacto">
    	<a href="#contacto"> Contacto</a>
    </div>
</div>

<!-- Quienes somos -->
<div class="quienes_somos" id="quienes_somos">
	<h2>QUIENES SOMOS</h2>
	<div class="slider">
    	
    </div>
    <div class="info">
    	<h3>The standard Lorem Ipsum passage, used since the 1500s</h3>
        <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
    </div>
</div>

<!-- Ofertas -->
<div class="ofertas" id="quienes_somos">
	<h2>OFERTAS</h2>
	<div class="permiso_a">
    	<h2>Permiso A</h2>
    	<img src= alt="">
        <p>Texto de permiso A</p>
    </div>
    <div class="permiso_b">
    	<h2>Permiso B</h2>
        <img src= alt="">
        <p>Texto de permiso B</p>
    </div>
</div>

<!-- Contacto -->
<div class="contacto" id="quienes_somos">
	<h2>CONTACTO</h2>
    <form action= >
    	<fieldset>
        	<legend>Contáctanos</legend>
            <label for="contact_name">Nombre:</label>
            <input type="text" id="contact_name" name="contact_name"><br>
            
            <label for="contact_email">Email:</label>
            <input type="email" id="contact_email" name="contact_email"><br>
            
            <label for="contact_phone">Teléfono:</label>
            <input type="tel" id="contact_phone" name="contact_phone"><br>
            
            <label for="contact_msg">Mensaje:</label>
            <input type="text" id="contact_msg" name="contact_msg"><br>
            
            <input type="button" value="Enviar"/>
        </fieldset>
    </form>
</div>

</body>
