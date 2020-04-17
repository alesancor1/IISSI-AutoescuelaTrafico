<?php
class Turismos extends Vehiculo{

	public function create($line){
        $args = split(",", $line);
		if (!EstadoVehiculo::isValid($args[2])){
    		throw new InvalidArgumentException(
    			sprintf("'%s' no es un estado de vehiculo valido", (string)$args[2])
			);
		}
        return new Turismos($args[1],$args[2],$args[3]);
    }
	
	public function __construct($matricula, $estado, $modelo){
		parent::__construct("Turismos");
		if (!EstadoVehiculo::isValid($estado)){
    		throw new InvalidArgumentException(
    			sprintf("'%s' no es un estado de vehiculo valido", (string)$estado)
			);
		}
		$this -> matricula = $matricula;
		$this -> estado = $estado;
		$this -> modelo = $modelo;
	}

}
?>