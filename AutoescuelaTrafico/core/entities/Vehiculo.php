<?php
class Vehiculo extends BaseEntity{
	
	protected $matricula;
	protected $estado;
	protected $modelo;

    public function __construct($child){
        parent::__construct($child);
    }
	/**
     * Get matricula
     *
     * @return VariableType
     */
    public function getMatricula(){
        return $this->matricula;
    }

	/**
     * Set matricula
     *
     * @param VariableType $matricula
     */
    public function setMatricula($matricula){
        $this->matricula = $matricula;
    }

	/**
     * Get estado
     *
     * @return VariableType
     */
    public function getEstado(){
        return $this->estado;
    }

	/**
     * Set estado
     *
     * @param VariableType $estado
     */
    public function setEstado(EstadoVehiculo $estado){
    	if (!EstadoVehiculo::isValid($estado)){
    		throw new InvalidArgumentException(
    			sprintf("'%s' no es un estado de vehiculo valido", (string)$estado)
			);
    	}
        $this->estado = $estado;
    }

	/**
     * Get modelo
     *
     * @return VariableType
     */
    public function getModelo(){
        return $this->modelo;
    }

	/**
     * Set modelo
     *
     * @param VariableType $modelo
     */
    public function setModelo($modelo){
        $this->modelo = $modelo;
    }
}

?>