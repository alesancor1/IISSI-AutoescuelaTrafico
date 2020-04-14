<?php
class Vehiculo extends BaseEntity{
	
	protected $matricula;
	protected $estado;
	protected $modelo;

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
    public function setEstado($estado){
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