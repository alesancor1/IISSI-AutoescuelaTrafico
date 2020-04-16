<?php
class ReparacionesMotocicletas extends BaseEntity{
	
	protected $id;
	protected $descripcion;
	protected $fecha;
	protected $coste;
	protected $motocicleta;
	protected $taller;
	
	public function create($line){
        $args = split(",", $line);
        return new ReparacionMotocicletas($args[0],$args[1],$args[2],$args[3],$args[4],$args[5],$args[6]);
    }
	
	public function __construct($id, $descripcion, $fecha, $coste, $motocicleta, $taller){
		parent::__construct("ReparacionesMotocicletas");
		$this -> id = $id;
		$this -> descripcion = $descripcion;
		$this -> fecha = $fecha;
		$this -> coste = $coste;
		$this -> motocicleta = $motocicleta;
		$this -> taller = $taller;
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