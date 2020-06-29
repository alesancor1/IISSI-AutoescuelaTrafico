<?php
class ReparacionesMotocicletas extends Reparaciones{
	
	protected $motocicleta;
	
	public function create($line){
        $args = split(",", $line);
        return new ReparacionMotocicletas($args[0],$args[1],$args[2],$args[3],$args[4],$args[5],$args[6]);
    }
	
	public function __construct($id, $descripcion, $fecha, $coste, $taller, $motocicleta){
		parent::__construct("ReparacionesMotocicletas");
		$this -> id = $id;
		$this -> descripcion = $descripcion;
		$this -> fecha = $fecha;
		$this -> coste = $coste;
		$this -> motocicleta = $motocicleta;
		$this -> taller = $taller;
	}


	/**
     * Get motocicleta
     *
     * @return VariableType
     */
    public function getMotocicleta(){
        return $this->motocicleta;
    }

	/**
     * Set motocicleta
     *
     * @param VariableType $motocicleta
     */
    public function setMotocicleta($motocicleta){
        $this->motocicleta = $motocicleta;
    }
}

?>