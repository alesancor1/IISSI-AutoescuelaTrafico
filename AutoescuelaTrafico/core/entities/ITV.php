<?php
class ITV extends BaseEntity{
		
	protected $id;
	protected $fecha;
	protected $fechaExpira;
	protected $coste;
	protected $revision;
	
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
     * Get fechaExpira
     *
     * @return VariableType
     */
    public function getFechaExpira(){
        return $this->fechaExpira;
    }

	/**
     * Set fechaExpira
     *
     * @param VariableType $fechaExpira
     */
    public function setFechaExpira($fechaExpira){
        $this->fechaExpira = $fechaExpira;
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
     * Get revision
     *
     * @return VariableType
     */
    public function getRevision(){
        return $this->revision;
    }

	/**
     * Set revision
     *
     * @param VariableType $revision
     */
    public function setRevision($revision){
        $this->revision = $revision;
    }
}

?>