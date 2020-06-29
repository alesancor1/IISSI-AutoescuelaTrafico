<?php
class PagoTasas extends BaseEntity{
	
	protected $id;
	protected $importe;
	protected $fecha;
	protected $oferta;
	
	public function create($line){
        $args = split(",", $line);
        return new PagoTasas($args[0],$args[1],$args[2],$args[3],$args[4]);
    }
	
	public function __construct($id, $importe, $fecha, $oferta){
		parent::__construct("PagoTasas");
		$this -> id = $id;
		$this -> importe = $importe;
		$this -> fecha = $fecha;
		$this -> oferta = $oferta;
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
     * Get importe
     *
     * @return VariableType
     */
    public function getImporte(){
        return $this->importe;
    }

	/**
     * Set importe
     *
     * @param VariableType $importe
     */
    public function setImporte($importe){
        $this->importe = $importe;
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
     * Get oferta
     *
     * @return VariableType
     */
    public function getOferta(){
        return $this->oferta;
    }

	/**
     * Set oferta
     *
     * @param VariableType $oferta
     */
    public function setOferta($oferta){
        $this->oferta = $oferta;
    }
}

?>