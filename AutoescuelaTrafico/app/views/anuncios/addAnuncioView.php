<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/popup.css">
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <h1 class = nuevo>NUEVO ANUNCIO</h1>
                
                <form action="?controller=Anuncios&action=enviar" class="form-container" method = "post">

                    <div class = "inputText">
                        <label for="titulo"><b>TITULO</b></label>
                        <input type="text" placeholder="Titulo" name="titulo" maxlength="50" required>
                    </div>

                    <div class = "textarea">
                        <label for="descripcion"><b>DESCRIPCIÓN</b></label>
                        <textarea placeholder="Escribe aqui" name="descripcion" cols="30" rows="23" required></textarea>
                    </div>

                    <div class = "botones">
                        <button type="button" class="volver" id='closePopup'> < Volver</button>
                        <button type="submit" class="enviar">Enviar</button>
                    </div>
                    <!-- para el ValidatorPHP -->
                    <input type="hidden" name = "validateForm" value = "anunciosForm">
                    <input type="hidden" name = "callbackUri" value = "?controller=Anuncios&action=enviar">
                </form>

            </div>
             
        </div>

    </body>
</html>