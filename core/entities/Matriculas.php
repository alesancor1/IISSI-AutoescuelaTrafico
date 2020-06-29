<?php
class Matriculacion extends BaseEntity{
	
	protected $id;
	protected $fecha;
	protected $permisoMatriculado;
	protected $alumno;
	protected $oferta;
	
	public function create($line){
        $args = split(",", $line);
        return new Matriculacion($args[1],$args[2],$args[3],$args[4],$args[5]);
    }
	
	public function __construct($id, $fecha, $permisoMatriculado, $alumno, $oferta){
		parent::__construct("Matriculas");
		$this -> id = $id;
		$this -> fecha = $fecha;
		$this -> permisoMatriculado = $permisoMatriculado;
		$this -> alumno = $alumno;
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
     * Get permisoMatriculado
     *
     * @return VariableType
     */
    public function getPermisoMatriculado(){
        return $this->permisoMatriculado;
    }

	/**
     * Set permisoMatriculado
     *
     * @param VariableType $permisoMatriculado
     */
    public function setPermisoMatriculado($permisoMatriculado){
        $this->permisoMatriculado = $permisoMatriculado;
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