<!DOCTYPE html>
<html>
<title>Anuncios</title>

<h1>Anuncios</h1>

    <body>
    	<?php if($_SESSION["cuenta"][2] != 'Alumno'){?>
    	<div>
    		<button class="nuevaEntrada" id='openPopup'>Nueva Entrada</button>
    	</div>
        <?php require_once __DIR__."/addAnuncioView.php";?>
        <script type="text/javascript" src="./js/popup.js"></script><?php
    	}?>

        <?php foreach($allAnuncios as $num=>$anuncio){
        ?>  <div>
                <?php echo "<h3>".$anuncio->getTitulo()."</h3>"?>
                <?php echo "<p>".$anuncio->getTexto()."</p>"?>
                <?php echo "<p>".$anuncio->getFecha()."</p>"?>
            </div><?php
        }?>
    </body>
    
</html>