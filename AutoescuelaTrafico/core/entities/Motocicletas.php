<?php
class Motocicletas extends Vehiculo{
	
	private $cc;
	
	public function create($line){
        $args = split(",", $line);
        return new Motocicletas($args[1],$args[2],$args[3]);
    }
	
	public function _construct($matricula, EstadoVehiculo $estado, $modelo, $cc){
		parent::__construct("Motocicletas");
		// La parte nueva, aplica el isValid para comprobar si el parametro que se mete es del enumerado
		// en otro caso mete excepcion (Borrar despues)
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



    public function getCc(){
        return $this->cc;
    }


    public function setCc($cc){
        $this->cc = $cc;
    }
}

?>