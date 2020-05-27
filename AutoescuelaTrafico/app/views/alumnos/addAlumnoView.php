<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/addAnunciosView.css">
</head>
    <body>

    	<div class="overlay" id="overlay">
            <div class = "popup" id = "popup">
                <h1 class = nuevo>NUEVO ANUNCIO</h1>
                
                <form action="?controller=Alumnos&action=enviar" class="form-container" method = "post">

                    <div class = "titulo">
                        <label for="titulo"><b>DNI</b></label>
                        <input type="text" placeholder="DNI" name="dni" required>
                    </div>

                    <div class = "nombre">
                        <label for="nombre"><b>NOMBRE</b></label>
                        <input type="text" placeholder="Nombre del alumno" name="nombre" required>
                    </div>
                    
                    <div class = "apellidos">
                        <label for="apellidos"><b>APELLIDOS</b></label>
                        <input type="text" placeholder="Apellidos del alumno" name="apellidos" required>
                    </div>
                    
                    <div class = "fechaNacimiento">
                        <label for="fechaNacimiento"><b>Fecha de Nacimiento</b></label>
                        <input type="date" name="fechaNacimiento" required>
                    </div>
                    
                    <div class = "permiso">
                        <label for="permiso"><b>Permiso</b></label>
                        <select id="permiso" name="permiso">
                        	<option disabled selected>Seleccionar permiso</option>
                        	<option value="Permiso A2">Permiso A2</option>
                        	<option value="Permiso B">Permiso B</option>
                        </select>
                    </div>
                    
                    <div class = "oferta">
                        <label for="oferta"><b>Oferta</b></label>
                        <select id="oferta" name="oferta">
                        	<option disabled selected>Seleccionar oferta</option>
                        	<option value="1">Oferta 1</option>
                        	<option value="2">Oferta 2</option>
                        </select>
                    </div>

                    <div class = "botones">
                        <button type="button" class="volver" id='closePopup'> < Volver</button>
                        <button type="submit" class="añadir">Añadir</button>
                    </div>

                </form>

            </div>
             
        </div>

    </body>
</html>