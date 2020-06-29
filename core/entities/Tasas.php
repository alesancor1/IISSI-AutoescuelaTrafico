<?php
class Tasas extends BaseEntity{
	
	protected $codigo;
	protected $tramite;
	protected $descripcion;
	protected $importe;
	
	public function create($line){
        $args = split(",", $line);
        return new Tasas($args[0],$args[1],$args[2],$args[3],$args[4]);
    }
	
	public function __construct($codigo, $tramite, $descripcion, $importe){
		parent::__construct("Tasas");
		$this -> codigo = $codigo;
		$this -> tramite = $tramite;
		$this -> descripcion = $descripcion;
		$this -> importe = $importe;
	}


	/**
     * Get codigo
     *
     * @return VariableType
     */
    public function getCodigo(){
        return $this->codigo;
    }

	/**
     * Set codigo
     *
     * @param VariableType $codigo
     */
    public function setCodigo($codigo){
        $this->codigo = $codigo;
    }

	/**
     * Get tramite
     *
     * @return VariableType
     */
    public function getTramite(){
        return $this->tramite;
    }

	/**
     * Set tramite
     *
     * @param VariableType $tramite
     */
    public function setTramite($tramite){
        $this->tramite = $tramite;
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
}

?>