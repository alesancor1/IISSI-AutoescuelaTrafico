<!DOCTYPE html>
<html>
<title>Anuncios</title>

<h1>Anuncios</h1>
    <body>
    	<?php if($_SESSION["cuenta"][2] != 'Alumno'){?>
    	<div>
    		<form action='./index.php?controller=Anuncios&action=add' method='post'>
    			<input type='submit' name='añadirEntrada' value='Añadir Entrada'></form>
    		</form>
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
</html>