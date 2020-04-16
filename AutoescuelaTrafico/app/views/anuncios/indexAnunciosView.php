<!DOCTYPE html>
<html>
<title>Anuncios</title>

<h1>Anuncios</h1>

<script type="text/javascript" src="./js/popup.js"></script>

    <body>
    	<?php if($_SESSION["cuenta"][2] != 'Alumno'){?>
    	<div>
    		<button class="nuevaEntrada" onclick='openPopup("addAnuncio")'>Nueva Entrada</button>
    	</div><?php
    	}?>

        <?php foreach($allAnuncios as $num=>$anuncio){
        ?>  <div>
                <?php echo "<h3>".$anuncio->getTitulo()."</h3>"?>
                <?php echo "<p>".$anuncio->getTexto()."</p>"?>
                <?php echo "<p>".$anuncio->getFecha()."</p>"?>
            </div><?php
        }?>
    </body>
    <?php require_once __DIR__."/addAnuncioView.php";?>
    
</html>