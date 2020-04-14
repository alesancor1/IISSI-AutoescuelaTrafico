<?php

class AccesoWeb extends BaseEntity {
	
	private $usuario;
	private $clavePorDefecto;
	private $fechaRenovacion;
	private $fechaCaducidad;


	public function _construct($usuario, $clavePorDefecto, $fechaRenovacion, $fechaCaducidad) {
		
		$this -> usuario = $usuario;
		$this -> clavePorDefecto = $clavePorDefecto;
		$this -> fechaRenovacion = $fechaRenovacion;
		$this -> fechaCaducidad = $fechaCaducidad;
	}


	/**
     * Get usuario
     *
     * @return VariableType
     */
    public function getUsuario(){
        return $this->usuario;
    }

	/**
     * Get ClavePorDefecto
     *
     * @return VariableType
     */
    public function getClavePorDefecto(){
        return $this->ClavePorDefecto;
    }

	/**
     * Get FechaRenovacion
     *
     * @return VariableType
     */
    public function getFechaRenovacion(){
        return $this->FechaRenovacion;
    }


	/**
     * Get FechaCaducidad
     *
     * @return VariableType
     */
    public function getFechaCaducidad(){
        return $this->FechaCaducidad;
    }

}

?>