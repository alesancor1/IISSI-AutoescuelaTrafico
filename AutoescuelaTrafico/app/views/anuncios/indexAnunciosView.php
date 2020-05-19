<!DOCTYPE html>
<html>
<title>Anuncios</title>

<head>
    <link rel="stylesheet" type="text/css" href="./css/indexAnunciosView.css">
</head>
<body>
        <div class = contenido id = contenido>
            <h1 class = title>Anuncios</h1>
            	<?php if($_SESSION["cuenta"][2] != 'Alumno'){?>
            	<div>
            		<button class="nuevaEntrada" id='openPopup'>Nueva Entrada</button>
            	</div>
                <?php require_once __DIR__."/addAnuncioView.php";?>
                <script type="text/javascript" src="./js/popup.js"></script><?php
            	}?>

            <?php
                $limit      = ( isset( $_GET['limit'] ) ) ? $_GET['limit'] : 2;
                $page       = ( isset( $_GET['page'] ) ) ? $_GET['page'] : 0;
                $links      = ( isset( $_GET['links'] ) ) ? $_GET['links'] : 7;
                $Paginator = new Paginator($allAnuncios);
                $anuncios = $Paginator -> getData($limit, $page);
                echo $Paginator->createLinks( $links, 'paginacion' );
            ?>
                <?php foreach($anuncios->data as $num=>$anuncio){
                ?>  <div class = anuncio>
                        <?php echo "<h3>".$anuncio->getTitulo()."</h3>"?>
                        <?php echo "<p class = fecha>".$anuncio->getFecha()."</p>"?>
                        <?php echo "<p class = texto>".$anuncio->getTexto()."</p>"?>
                    </div><?php
                }?>
        </div>
</body>
    
</html>