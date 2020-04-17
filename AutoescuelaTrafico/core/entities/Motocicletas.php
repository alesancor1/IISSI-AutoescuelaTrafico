<?php
class Motocicletas extends Vehiculo{
	
	private $cc;
	
	public function create($line){
        $args = split(",", $line);
		if (!EstadoVehiculo::isValid($args[2])){
    		throw new InvalidArgumentException(
    			sprintf("'%s' no es un estado de vehiculo valido", (string)$estado)
			);
		}
        return new Motocicletas($args[1],$args[2],$args[3]);
    }
	
	public function _construct($matricula, $estado, $modelo, $cc){
		parent::__construct("Motocicletas");
		if (!EstadoVehiculo::isValid($estado)){
    		throw new InvalidArgumentException(
    			sprintf("'%s' no es un estado de vehiculo valido", (string)$estado)
			);
		}
		$this -> matricula = $matricula;
		$this -> estado = $estado;
		$this -> modelo = $modelo;
		$this -> cc = $cc;
		
	}


	/**
     * Get cc
     *
     * @return VariableType
     */
    public function getCc(){
        return $this->cc;
    }

	/**
     * Set cc
     *
     * @param VariableType $cc
     */
    public function setCc($cc){
        $this->cc = $cc;
    }
}

?>