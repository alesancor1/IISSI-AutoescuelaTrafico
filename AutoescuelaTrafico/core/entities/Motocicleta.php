<?php
class Motocicleta extends Vehiculo{
	
	private $cc;
	
	public function _construct($matricula, $estado, $modelo, $cc){
		
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