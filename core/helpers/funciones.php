<?php
class funciones {

	public static function redirect($controlador = DEFAULT_CONTROLLER, $accion = DEFAULT_ACTION) {
		header("Location:index.php?controller=" . $controlador . "&action=" . $accion);
	}

	// Compara dos fechas, si son iguales da la primera
	public static function dateComparator($dat1, $dat2) {

		list($day1, $month1, $year1) = split('[/.-]', $dat1);
		list($day2, $month2, $year2) = split('[/.-]', $dat2);
		
		if($year1 == $year2) {
			if($month1 == $month2){
				if($day1 == $day2){
					$res = $dat1;
				}
				elseif($year1 > $year2) $res = $dat1;
				else $res = $dat2;
			}
			elseif ($year1 > $year2) $res = $dat1;
			else $res = $dat2;
		}
		elseif($year1 > $year2) $res = $dat1;
		else $res = $dat2;

		return $res;
	}

}
?>