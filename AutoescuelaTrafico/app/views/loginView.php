<!DOCTYPE html>
<html>

<body>
<?php
if($error){?>
	<script>alert("Nombre de usuario o contraseña incorrectos");</script>
<?php } ?>
<form action="?controller=Login&action=login" method="post">
	<div class="container">
    	<label for="uname">Usuario</label></br>
		<input type="text" placeholder="Inserte su usuario" name="uname" required></br>
        
        <label for="psw">Contraseña</label></br>
        <input type="password" placeholder="Inserte su contraseña" name="psw" required></br>
        
        <button type="submit">Iniciar sesión</button></br>
        
        <button type="button" class="volverLogin" onclick="location.href='../../AutoescuelaTrafico/public/index.php';">volver</button>
	</div>
</form>

</body>

</html>