<?php
class Teorico extends Examen{
	
	protected $id;
	protected $nFallos;
	
	public function __construct($fecha, $calificacion, $id, $nFallos){
		parent::__construct("Teorico");
		$this -> fecha = $fecha;
		$this -> calificacion = $calificacion;
		$this -> id = $id;
		$this -> nFallos = $nFallos;
		
			
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