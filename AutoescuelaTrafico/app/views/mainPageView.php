<!DOCTYPE html>
<html>

<title>Autoescuela Tráfico</title>

<head>
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"/>
	<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>
    <link rel="stylesheet" href="./css/mainPage.css">
    <link rel="stylesheet" href="./css/mainPageMobile.css">
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
                    <p><?php echo $_SESSION["cuenta"][0]?></p>     
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
    	<img src="./img/banner.png" class="banner-img" alt="Banner"/>
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
    	<h2>¿QUIÉNES SOMOS?</h2>

    	<div class="slider">
        	<div class="mySlides fade">
                <img src="./img/slider1.png">
            </div>

            <div class="mySlides fade">
                <img src="./img/slider2.png">
            </div>

            <div class="mySlides fade">
                <img src="./img/slider3.png">
            </div>

            <!--botones del slider-->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>

            <!--circulitos-->
            <div style="text-align:center">
              <span class="dot" onclick="currentSlide(1)"></span>
              <span class="dot" onclick="currentSlide(2)"></span>
              <span class="dot" onclick="currentSlide(3)"></span>
            </div>
        </div>
        <div class="info">
        	<h3>Autoescuela Tráfico</h3>
            <p>El centro de formacion Autoescuela Tráfico es un centro de formación vial, que pretende contribuir enseñando educación vial para evitar los accidentes de tráfico. Así como promover actividades  para la mejora de la Logística y el Transporte. Esta iniciativa responde a una inquietud por participar en algo que nos atañe a todos. Queremos ayudar a solucionar estos problemas, desde el ámbito de la sensibilización, la innovación y la educación en valores. Pretendemos ser un referente y liderar proyectos que desde el ámbito de la innovación y la formación contribuyan a la mejora de la Seguridad Vial, del Medio Ambiente, la Logística y el Transporte.</p>
        </div>
    </div>

    <!--Script del slider-->
    <script type="text/javascript" src="./js/slideshow.js"></script>
    <!----------------------------------------------------------------
      ofertas 
    ------------------------------------------------------------------>
    <div class="ofertas" id="ofertas">
    	<h2 class = "ofertasTitle">OFERTAS</h2>
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
        <form action= >
        	<fieldset>
            	<legend>Contáctanos</legend>
                <input type="text" id="contact_name" name="contact_name" placeholder="Su nombre"><br>
                
                <input type="email" id="contact_email" name="contact_email" placeholder="Su email"><br>
                
                <input type="tel" id="contact_phone" name="contact_phone" placeholder="Su teléfono"><br>
                
                <textarea id="contact_msg" name="contact_msg" placeholder="Su mensaje"></textarea><br>
                
                <input type="submit" value="Enviar"/>
            </fieldset>
        </form>
    </div>

    <!----------------------------------------------------------------
      mapa 
    ------------------------------------------------------------------>
    <div class = "ubicacion">
        <p>SEVILLA:</br></br>Calle</br>41919 (Sevilla)</br></br> tlf: 9XXXXXXXX</br> email: *****@***.com</p>
        <div class = logo>
            <img src = ./img/autoescuela.png>
            <h2>AUTOESCUELA</br>TRÁFICO</h2>
        </div>
        <div id="mapid" class = "map"></div>
    </div>

    <div class = footer>
    </div>
     
    <script type="text/javascript" src="./js/map.js"></script>

</div>
</body>
