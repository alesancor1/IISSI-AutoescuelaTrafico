<?php
class WebTest extends EstadoWeb{
	
	private $estado;
	
	public function _construct($estado){
		$this -> estado = $estado;
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
}

?>