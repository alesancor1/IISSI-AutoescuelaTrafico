<?php
class Talleres extends BaseEntity{
	
	protected $nombre;
	protected $direccion;
	protected $telefono;
	
	public function create($line){
        $args = split(",", $line);
        return new Talleres($args[0],$args[1],$args[2],$args[3]);
    }
	
	public function __construct($nombre, $direccion, $telefono){
		parent::__construct("Talleres");
		$this -> nombre = $nombre;
		$this -> direccion = $direccion;
		$this -> telefono = $telefono;
	}


	/**
     * Get nombre
     *
     * @return VariableType
     */
    public function getNombre(){
        return $this->nombre;
    }

	/**
     * Set nombre
     *
     * @param VariableType $nombre
     */
    public function setNombre($nombre){
        $this->nombre = $nombre;
    }

	/**
     * Get direccion
     *
     * @return VariableType
     */
    public function getDireccion(){
        return $this->direccion;
    }

	/**
     * Set direccion
     *
     * @param VariableType $direccion
     */
    public function setDireccion($direccion){
        $this->direccion = $direccion;
    }

	/**
     * Get telefono
     *
     * @return VariableType
     */
    public function getTelefono(){
        return $this->telefono;
    }

	/**
     * Set telefono
     *
     * @param VariableType $telefono
     */
    public function setTelefono($telefono){
        $this->telefono = $telefono;
    }
}

?>