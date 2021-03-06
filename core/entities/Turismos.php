<?php
class Turismos extends Vehiculo{

	public function create($line){
        $args = split(",", $line);
        return new Turismos($args[1],$args[2],$args[3]);
    }
	
	public function _construct($matricula, EstadoVehiculo $estado, $modelo){
		parent::__construct("Turismos");
		// La parte nueva, aplica el isValid para comprobar si el parametro que se mete es del enumerado
		// en otro caso mete excepcion
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