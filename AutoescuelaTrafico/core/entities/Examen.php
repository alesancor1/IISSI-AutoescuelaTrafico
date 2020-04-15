<?php
class Examen extends BaseEntity{
	
	protected $fecha;
	protected $calificacion;
	
	public function __construct($child){
		parent::__construct($child);
	}
	

	/**
     * Get fecha
     *
     * @return VariableType
     */
    public function getFecha(){
        return $this->fecha;
    }

	/**
     * Set fecha
     *
     * @param VariableType $fecha
     */
    public function setFecha($fecha){
        $this->fecha = $fecha;
    }

	/**
     * Get calificacion
     *
     * @return VariableType
     */
    public function getCalificacion(){
        return $this->calificacion;
    }

	/**
     * Set calificacion
     *
     * @param VariableType $calificacion
     */
    public function setCalificacion($calificacion){
        $this->calificacion = $calificacion;
    }
}

?>