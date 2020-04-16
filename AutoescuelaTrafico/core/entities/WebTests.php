<?php
class WebTests extends BaseEntity{
	
	protected $id;
	protected $estado;
	
	public function create($line){
        $args = split(",", $line);
        return new WebTests($args[0],$args[1],$args[2]);
    }
	
	public function __construct($id, $estado){
		parent::__construct("WebTests");
		$this -> id = $id;
		$this -> estado = $estado;
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
     * Get estado
     *
     * @return VariableType
     */
    public function getEstado(){
        return $this->estado;
    }

	/**
     * Set estado
     *
     * @param VariableType $estado
     */
    public function setEstado($estado){
        $this->estado = $estado;
    }
}

?>