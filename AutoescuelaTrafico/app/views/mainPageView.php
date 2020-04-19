<!DOCTYPE html>
<html>

<title>Autoescuela Tráfico</title>

<head>
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"/>
	<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
    <link rel="stylesheet" href="./css/mainPage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<div class = wrapper>

    <!----------------------------------------------------------------
      Top navigation menu 
    ------------------------------------------------------------------>
    <div class="topnav">

    	<div class = faq onclick='document.getElementById("quienes_somos").scrollIntoView({behavior: "smooth"})'>
            <i class="fa fa-question-circle-o"></i>
        </div>

    	<div class="search-container">
        	<form action="">
          	<input type="text" placeholder="Search.." name="search">
            	<button type="submit"><i class="fa fa-search"></i></button>
        	</form>
      	</div>

        <h1 class = 'heading'>Autoescuela Tráfico </h1>
        
        <div class = sesion>       
        <?php if(isset($_SESSION["cuenta"])){ ?>
            <div class = logedAs onclick="location.href = '?controller=Anuncios'">
                <form action = './index.php' method = post>
                    <p>Logeado como: <?php echo $_SESSION["cuenta"][0]?></p>     
                    <button type='submit' name = 'logout'><i class="fa fa-sign-out"></i></button>
                </form>
            </div> <?php
        }
        else{ ?>
            <button class = login onclick="location.href='?controller=Login'">Iniciar Sesion</button> <?php
        } ?>
        </div>    
    </div>

    <!----------------------------------------------------------------
      Banner 
    ------------------------------------------------------------------>
    <div class="banner">
    	<img src="banner.jpg" class="banner-img" alt="Banner"/>
    </div>

    <!----------------------------------------------------------------- 
      Botones 
    ------------------------------------------------------------------->
    <div class="buttons">
    	<div class="btn">
        	<p> ¿Quiénes somos?</p>
            <button onclick = 'document.getElementById("quienes_somos").scrollIntoView({behavior: "smooth"})'>v</button>
        </div>
        
        <div class="btn">
        	<p>Ofertas</p>
            <button onclick = 'document.getElementById("ofertas").scrollIntoView({behavior: "smooth"})'>v</button>
        </div>
        
        <div class="btn">
        	<p>Contacto</p>
            <button onclick = 'document.getElementById("contacto").scrollIntoView({behavior: "smooth"})'>v</button>
        </div>
    </div>

    <!----------------------------------------------------------------
      Quienes somos 
    ------------------------------------------------------------------>
    <div class="quienes_somos" id="quienes_somos">
    	<h2>QUIENES SOMOS</h2>
    	<div class="slider">
        	<p>Aqui va un slider</p>
        </div>
        <div class="info">
        	<h3>The standard Lorem Ipsum passage, used since the 1500s</h3>
            <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
        </div>
    </div>

    <!----------------------------------------------------------------
      ofertas 
    ------------------------------------------------------------------>
    <div class="ofertas" id="ofertas">
    	<h2>OFERTAS</h2>
    	<div class="permiso_a">
        	<h2>Permiso A</h2>
        	<img src="" alt="">
            <p>Texto de permiso A</p>
        </div>
        <div class="permiso_b">
        	<h2>Permiso B</h2>
            <img src="" alt="">
            <p>Texto de permiso B</p>
        </div>
    </div>

    <!----------------------------------------------------------------
      Contacto 
    ------------------------------------------------------------------>
    <div class="contacto" id="contacto">
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

    <!----------------------------------------------------------------
      mapa 
    ------------------------------------------------------------------>
    <div class = "ubicacion">
        <p>SEVILLA:</br>Calle</br>41919 (Sevilla)</br> tlf: 9XXXXXXXX</br> email: *****@***.com</p>
        <img src = ./img/autoescuela.png>
        <div id="mapid" class = "map"></div>
    </div>
     
    <script>
    	var mymap = L.map('mapid').setView([37.3848963,-6.0114024], 13);
    </script>

</div>
</body>
