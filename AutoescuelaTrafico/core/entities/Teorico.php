<?php
class Teorico extends Examen{
	
    public function create($line){
        $args = split(",", $line);
        return new Teorico($args[0],$args[1],$args[2],$args[3],$args[4]);
    }

	protected $id;
	protected $nFallos;
	
	public function __construct($id, $fecha, $alumno, $calificacion, $nFallos){
		parent::__construct("Teorico");
		$this -> fecha = $fecha;
		$this -> calificacion = $calificacion;
		$this -> id = $id;
		$this -> nFallos = $nFallos;
        $this -> dniAlumno = $alumno;
		
			
	}
	
	/**
     * Get id
     *
     * @return VariableType
     */
    public function getId(){
        return $this->id;
    }

	/**
     * Set id
     *
     * @param VariableType $id
     */
    public function setId($id){
        $this->id = $id;
    }

	/**
     * Get nFallos
     *
     * @return VariableType
     */
    public function getNFallos(){
        return $this->nFallos;
    }

	/**
     * Set nFallos
     *
     * @param VariableType $nFallos
     */
    public function setNFallos($nFallos){
        $this->nFallos = $nFallos;
    }
}

?>