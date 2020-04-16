<?php
class ITVMotocicletas extends BaseEntity{
	
	protected $id;
	protected $fecha;
	protected $fechaExpira;
	protected $coste;
	protected $revision;
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