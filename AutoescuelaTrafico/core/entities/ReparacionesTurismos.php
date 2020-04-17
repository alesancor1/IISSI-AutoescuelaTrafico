<?php
class ReparacionesTurismos extends Reparaciones{
	
	protected $turismo;
	
	public function create($line){
        $args = split(",", $line);
        return new ReparacionesTurismos($args[0],$args[1],$args[2],$args[3],$args[4],$args[5],$args[6]);
    }
	
	public function __construct($id, $descripcion, $fecha, $coste, $turismo, $taller){
		parent::__construct("ReparacionesTurismos");
		$this -> id = $id;
		$this -> descripcion = $descripcion;
		$this -> fecha = $fecha;
		$this -> coste = $coste;
		$this -> turismo = $turismo;
		$this -> taller = $taller;
	}

	/**
     * Get turismo
     *
     * @return VariableType
     */
    public function getTurismo(){
        return $this->turismo;
    }

	/**
     * Set turismo
     *
     * @param VariableType $turismo
     */
    public function setTurismo($turismo){
        $this->turismo = $turismo;
    }
}

?>