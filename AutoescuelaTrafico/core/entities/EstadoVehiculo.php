<?php
class EstadoVehiculo{
	
	const __default = self::ListoParaSuUso;
	
	const Averiado = 0;
	const EnTaller = 1;
	const ListoParaSuUso = 2;
	
	public static function isValid($state){
		if ($state == self::Averiado) return true;
		if ($state == self::EnTaller) return true;
		if ($state == self::ListoParaSuUso) return true;
		return false;
	}

}

//$variable = EstadoVehiculo::EnTaller;  ?¿

?>