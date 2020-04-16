<?php
class PagoClases extends BaseEntity{
	
	protected $id;
	protected $alumno;
	protected $fecha;
	protected $importe;
	protected $cantidad;
	
	public function create($line){
        $args = split(",", $line);
        return new PagoClases($args[0],$args[1],$args[2],$args[3],$args[4],$args[5]);
    }
	
	public function __construct($id, $alumno, $fecha, $importe, $cantidad){
		parent::__construct("PagoClases");
		$this -> id = $id;
		$this -> alumno = $alumno;
		$this -> fecha = $fecha;
		$this -> importe = $importe;
		$this -> cantidad = $cantidad;
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
     * Get alumno
     *
     * @return VariableType
     */
    public function getAlumno(){
        return $this->alumno;
    }

	/**
     * Set alumno
     *
     * @param VariableType $alumno
     */
    public function setAlumno($alumno){
        $this->alumno = $alumno;
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
     * Get cantidad
     *
     * @return VariableType
     */
    public function getCantidad(){
        return $this->cantidad;
    }

	/**
     * Set cantidad
     *
     * @param VariableType $cantidad
     */
    public function setCantidad($cantidad){
        $this->cantidad = $cantidad;
    }
}

?>