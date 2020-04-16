<?php
class Pista extends Practico{
	
	public function create($line){
        $args = split(",", $line);
        return new Pista($args[1],$args[2],$args[3],$args[4],$args[5],$args[6]);
    }
	public function __construct($fecha, $alumno, $calificacion, $faltasLeves, $faltasDeficientes, $faltasEliminatorias){
		parent::__construct("Practico");
		$this -> fecha = $fecha;
		$this -> dniAlumno = $alumno;
		$this -> calificacion = $calificacion;
		$this -> faltasLeves = $faltasLeves;
		$this -> faltasDeficientes = $faltasDeficientes;
		$this -> faltasEliminatorias = $faltasEliminatorias;
	}

} 

?>