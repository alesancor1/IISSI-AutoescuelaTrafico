<?php

class AccesoWeb extends BaseEntity {
	
    public function create($line){
        $args = split(",", $line);
        return new AccesoWeb($args[0],$args[1],$args[2],$args[3], $args[4]);
    }

	private $usuario;
	private $clavePorDefecto;
	private $fechaRenovacion;
	private $fechaCaducidad;
	private $tiempoRestante;


	public function __construct($usuario, $clavePorDefecto, $fechaRenovacion, $fechaCaducidad, $tiempoRestante) {
		parent::__construct("AccesoWeb");
		$this -> usuario = $usuario;
		$this -> clavePorDefecto = $clavePorDefecto;
		$this -> fechaRenovacion = $fechaRenovacion;
		$this -> fechaCaducidad = $fechaCaducidad;
		$this -> tiempoRestante = $tiempoRestante;
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
        return $this->clavePorDefecto;
    }

	/**
     * Get FechaRenovacion
     *
     * @return VariableType
     */
    public function getFechaRenovacion(){
        return $this->fechaRenovacion;
    }


	/**
     * Get FechaCaducidad
     *
     * @return VariableType
     */
    public function getFechaCaducidad(){
        return $this->fechaCaducidad;
    }

	/**
     * Get TiempoRestante
     *
     * @return VariableType
     */
    public function getTiempoRestante(){
        return $this->tiempoRestante;
    }

}

?>