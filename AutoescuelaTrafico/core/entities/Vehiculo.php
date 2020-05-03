<?php
class Vehiculo extends BaseEntity{
	
	
	protected $matricula;
	protected $estado;
	protected $modelo;

    public function __construct($child){
        parent::__construct($child);
    }

    public function getMatricula(){
        return $this->matricula;
    }


    public function setMatricula($matricula){
        $this->matricula = $matricula;
    }


    public function getEstado(){
        return $this->estado;
    }


    public function setEstado(EstadoVehiculo $estado){
    	
    	if (!EstadoVehiculo::isValid($estado)){
    		throw new InvalidArgumentException(
    			sprintf("'%s' no es un estado de vehiculo valido", (string)$estado)
			);
    	}
        $this->estado = $estado;
    }


    public function getModelo(){
        return $this->modelo;
    }


    public function setModelo($modelo){
        $this->modelo = $modelo;
    }
}

?>