<?php
class Practico extends Examen{
	
	protected $faltasLeves;
	protected $faltasDeficientes;
	protected $faltasEliminatorias;
	
	public function __construct($child){
		parent::__construct($child);
	}


	/**
     * Get faltasLeves
     *
     * @return VariableType
     */
    public function getFaltasLeves(){
        return $this->faltasLeves;
    }

	/**
     * Set faltasLeves
     *
     * @param VariableType $faltasLeves
     */
    public function setFaltasLeves($faltasLeves){
        $this->faltasLeves = $faltasLeves;
    }

	/**
     * Get faltasDeficientes
     *
     * @return VariableType
     */
    public function getFaltasDeficientes(){
        return $this->faltasDeficientes;
    }

	/**
     * Set faltasDeficientes
     *
     * @param VariableType $faltasDeficientes
     */
    public function setFaltasDeficientes($faltasDeficientes){
        $this->faltasDeficientes = $faltasDeficientes;
    }

	/**
     * Get faltasEliminatorias
     *
     * @return VariableType
     */
    public function getFaltasEliminatorias(){
        return $this->faltasEliminatorias;
    }

	/**
     * Set faltasEliminatorias
     *
     * @param VariableType $faltasEliminatorias
     */
    public function setFaltasEliminatorias($faltasEliminatorias){
        $this->faltasEliminatorias = $faltasEliminatorias;
    }
}

?>