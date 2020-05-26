<!DOCTYPE html>
<html>

	<body>

		<div class="contenido" id="contenido">

			<?php
			if ($infoProfesores != null) {
				foreach ($infoProfesores as $num => $profesor) {
					echo $profesor -> getApellidos() . ", " . $profesor -> getNombre() . "<br>";
					echo "DNI: " . $profesor -> getDni() . "<br>";
					echo "Fecha contrato: " . $profesor -> getFechaContrato() . "<br>";
					echo "Telefono: " . $profesor -> getTelefono() . "<br>";
					echo "Salario mensual: " . $profesor -> getSalario() . "<br>";
					echo "Nº SS: " . $profesor -> getNSeguridadSocial() . "<br>";
					echo "<br>";

					echo "Permisos que imparte el profesor " . $profesor -> getApellidos() . ", " . $profesor -> getNombre() . " :" . "<br>";
					foreach ($permisosImpartidos as $num1 => $permisoImpartido) {

						if ($profesor -> getDni() == $permisoImpartido -> DNI) {
							echo $permisoImpartido -> TIPOPERMISO . "<br>";
						}
					}
					echo "<br>";

				}
			}
			?>
		</div>
	</body>

</html>