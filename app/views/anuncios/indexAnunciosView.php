<!DOCTYPE html>
<html>

<head>
	<title>Anuncios</title>
    <link rel="stylesheet" type="text/css" href="./css/indexAnunciosView.css">
</head>
<body>
        <div class ="contenido" id ="contenido">
            <h1 class ="title">Anuncios</h1>
            	<?php if($_SESSION["cuenta"][2] != 'Alumno'){?>
            	<div>
            		<button class="nuevaEntrada" id='openPopup'>Nueva Entrada</button>
            	</div>
                <?php require_once __DIR__."/addAnuncioView.php";?>
                <script type="text/javascript" src="./js/popup.js"></script><?php
            	}?>
                <?php echo $_SESSION["paginator"]->createLinks(4,'paginatorButtons')?>
                <?php foreach($allAnuncios as $num=>$anuncio){
                ?>  <div class = anuncio>
                        <?php echo "<h3>".$anuncio->getTitulo()."</h3>"?>
                        <?php echo "<p class = fecha>".$anuncio->getFecha()."</p>"?>
                        <?php echo "<p class = texto>".$anuncio->getTexto()."</p>"?>
                    </div><?php
                }?>
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
</body>
    
</html>