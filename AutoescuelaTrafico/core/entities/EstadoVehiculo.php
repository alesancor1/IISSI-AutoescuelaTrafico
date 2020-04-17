<?php
class EstadoVehiculo{
	
	const __default = self::ListoParaSuUso;
	
	const Averiado = 0;
	const EnTaller = 1;
	const ListoParaSuUso = 2;
	
	//La funcion que comprueba si una variable pertenece a las constantes del enumerado
	public static function isValid($state){
		if ($state == self::Averiado) return true;
		if ($state == self::EnTaller) return true;
		if ($state == self::ListoParaSuUso) return true;
		return false;
	}
	
	

}

//Darle el valor a la variable
//$variable = EstadoVehiculo::EnTaller; (Diria yo que es de esta forma)

?>