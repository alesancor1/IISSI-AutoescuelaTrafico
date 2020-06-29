<?php
class Circulacion extends Practico{
	
	public function create($line){
        $args = split(",", $line);
        return new Circulacion($args[2],$args[3],$args[4],$args[5],$args[6],$args[7]);
    }

	public function __construct($fecha, $alumno, $calificacion, $faltasLeves, $faltasDeficientes, $faltasEliminatorias){
		parent::__construct("Circulacion");
		$this -> fecha = $fecha;
		$this -> dniAlumno = $alumno;
		$this -> calificacion = $calificacion;
		$this -> faltasLeves = $faltasLeves;
		$this -> faltasDeficientes = $faltasDeficientes;
		$this -> faltasEliminatorias = $faltasEliminatorias;
	}

}

?>