<?php
class Oferta extends BaseEntity{
	
	protected $id;
	protected $precio;
	protected $nClasesContenidas;
	protected $nIntentosExamenes;
	protected $web;
	
	public function create($line){
        $args = split(",", $line);
        return new Oferta($args[0],$args[1],$args[2],$args[3],$args[4],$args[5]);
    }
	
	public function __construct($id, $precio, $nClasesContenidas, $nIntentosExamenes, $web){
		parent::__construct("Oferta");
		$this -> id = $id;
		$this -> precio = $precio;
		$this -> nClasesContenidas = $nClasesContenidas;
		$this -> nIntentosExamens = $nIntentosExamenes;
		$this -> web = $web;
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
     * Get precio
     *
     * @return VariableType
     */
    public function getPrecio(){
        return $this->precio;
    }

	/**
     * Set precio
     *
     * @param VariableType $precio
     */
    public function setPrecio($precio){
        $this->precio = $precio;
    }

	/**
     * Get nClasesContenidas
     *
     * @return VariableType
     */
    public function getNClasesContenidas(){
        return $this->nClasesContenidas;
    }

	/**
     * Set nClasesContenidas
     *
     * @param VariableType $nClasesContenidas
     */
    public function setNClasesContenidas($nClasesContenidas){
        $this->nClasesContenidas = $nClasesContenidas;
    }

	/**
     * Get nIntentosExamenes
     *
     * @return VariableType
     */
    public function getNIntentosExamenes(){
        return $this->nIntentosExamenes;
    }

	/**
     * Set nIntentosExamenes
     *
     * @param VariableType $nIntentosExamenes
     */
    public function setNIntentosExamenes($nIntentosExamenes){
        $this->nIntentosExamenes = $nIntentosExamenes;
    }

	/**
     * Get web
     *
     * @return VariableType
     */
    public function getWeb(){
        return $this->web;
    }

	/**
     * Set web
     *
     * @param VariableType $web
     */
    public function setWeb($web){
        $this->web = $web;
    }
}

?>