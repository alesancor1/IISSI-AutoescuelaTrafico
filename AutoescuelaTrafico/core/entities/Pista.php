<?php
class Pista extends Practico{
	
	public function __construct($fecha, $calificacion, $faltasLeves, $faltasDeficientes, $faltasEliminatorias){
		parent::__construct("Practico");
		$this -> fecha = $fecha;
		$this -> calificacion = $calificacion;
		$this -> faltasLeves = $faltasLeves;
		$this -> faltasDeficientes = $faltasDeficientes;
		$this -> faltasEliminatorias = faltasEliminatorisas;
	}

} 

?>