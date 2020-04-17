<?php
class ITVMotocicletas extends ITV{
	
	protected $motocicleta;
	
	public function create($line){
        $args = split(",", $line);
        return new ITVMotocicletas($args[0],$args[1],$args[2],$args[3],$args[4],$args[5],$args[6]);
    }
	
	public function __construct($id, $fecha, $fechaExpira, $coste, $revision, $motocicleta){
		parent::__construct("ITVMotocicletas");
		$this -> id = $id;
		$this -> fecha = $fecha;
		$this -> fechaExpira = $fechaExpira;
		$this -> coste = $coste;
		$this -> revision = $revision;
		$this -> motocicleta = $motocicleta;
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