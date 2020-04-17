<?php
class Reparaciones extends BaseEntity{
	
	protected $id;
	protected $descripcion;
	protected $fecha;
	protected $coste;
	protected $taller;
	
	public function __construct($child){
		parent::__construct($child);
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
     * Get descripcion
     *
     * @return VariableType
     */
    public function getDescripcion(){
        return $this->descripcion;
    }

	/**
     * Set descripcion
     *
     * @param VariableType $descripcion
     */
    public function setDescripcion($descripcion){
        $this->descripcion = $descripcion;
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
     * Get coste
     *
     * @return VariableType
     */
    public function getCoste(){
        return $this->coste;
    }

	/**
     * Set coste
     *
     * @param VariableType $coste
     */
    public function setCoste($coste){
        $this->coste = $coste;
    }

	/**
     * Get taller
     *
     * @return VariableType
     */
    public function getTaller(){
        return $this->taller;
    }

	/**
     * Set taller
     *
     * @param VariableType $taller
     */
    public function setTaller($taller){
        $this->taller = $taller;
    }
}

?>