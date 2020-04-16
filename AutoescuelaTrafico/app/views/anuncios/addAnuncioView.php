<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/addAnunciosView.css">
</head>
    <body>
    	<div class="form-popup" id="addAnuncio">
              <form action="" class="form-container">

                <div class = "titulo">
                    <label for="titulo"><b>TITULO</b></label>
                    <input type="text" placeholder="Titulo" name="titulo" required>
                </div>

                <div class = "descripcion">
                    <label for="descripcion"><b>DESCRIPCIÓN</b></label>
                    <textarea placeholder="Escribe aqui" name="descripcion" cols="50" rows="24" required></textarea>
                </div>

                <div class = "botones">
                    <button type="button" class="volver" onclick="closePopup('addAnuncio')"> < Volver</button>
                    <button type="submit" class="enviar">Enviar</button>
                </div>
            </form>
        </div>

    </body>
</html>