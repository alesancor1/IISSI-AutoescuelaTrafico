<?php
//ESTA VISTA ES DE EJEMPLO PARA LOS ALUMNOS
foreach($allAlumnos as $num=>$alumnoObjeto){
	$allAlumnos[$num] = new Alumno($alumnoObjeto->DNI,
								$alumnoObjeto->NOMBRE,
								$alumnoObjeto->APELLIDOS,
								$alumnoObjeto->TELEFONO,
								$alumnoObjeto->FECHANACIMIENTO,
								$alumnoObjeto->CLASESPAGADAS,
								$alumnoObjeto->RECONOCIMIENTOMEDICO);
}
echo $allAlumnos[0] -> getDNI();
//print_r($allAlumnos);
?>