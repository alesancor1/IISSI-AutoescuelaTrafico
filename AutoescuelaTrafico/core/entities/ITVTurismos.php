<?php
class ITVTurismos extends ITV{
	
	protected $turismos;
	
	public function create($line){
        $args = split(",", $line);
        return new ITVTurismos($args[0],$args[1],$args[2],$args[3],$args[4],$args[5],$args[6]);
    }
	
	public function __construct($id, $fecha, $fechaExpira, $coste, $revision, $turismos){
		parent::__construct("ITVTurismos");
		$this -> id = $id;
		$this -> fecha = $fecha;
		$this -> fechaExpira = $fechaExpira;
		$this -> coste = $coste;
		$this -> revision = $revision;
		$this -> turismos = $turismos;
	}

	/**
     * Get turismos
     *
     * @return VariableType
     */
    public function getTurismos(){
        return $this->turismos;
    }

	/**
     * Set turismos
     *
     * @param VariableType $turismos
     */
    public function setTurismos($turismos){
        $this->turismos = $turismos;
    }
}

?>