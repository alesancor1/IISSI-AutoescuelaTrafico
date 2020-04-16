<?php
class SegurosTurismos extends BaseEntity{
	
	protected $id;
	protected $companyia;
	protected $tipoSeguro;
	protected $fechaContrato;
	protected $tipoCuota;
	protected $importeCuota;
	protected $turismo;
	
	public function create($line){
        $args = split(",", $line);
        return new SegurosTurismos($args[0],$args[1],$args[2],$args[3],$args[4],$args[5],$args[6],$args[7]);
    }
	
	public function __construct($id, $companyia, $tipoSeguro, $fechaContrato, $tipoCuota, $importeCuota, $turismo){
		parent::__construct("SegurosTurismos");
		$this -> id = $id;
		$this -> companyia = $companya;
		$this -> tipoSeguro = $tipoSeguro;
		$this -> fechaContrato = $fechaContrato;
		$this -> tipoCuota = $tipoCuota;
		$this -> importeCuota = $importeCuota;
		$this -> turismo = $turismo;
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
     * Get companyia
     *
     * @return VariableType
     */
    public function getCompanyia(){
        return $this->companyia;
    }

	/**
     * Set companyia
     *
     * @param VariableType $companyia
     */
    public function setCompanyia($companyia){
        $this->companyia = $companyia;
    }

	/**
     * Get tipoSeguro
     *
     * @return VariableType
     */
    public function getTipoSeguro(){
        return $this->tipoSeguro;
    }

	/**
     * Set tipoSeguro
     *
     * @param VariableType $tipoSeguro
     */
    public function setTipoSeguro($tipoSeguro){
        $this->tipoSeguro = $tipoSeguro;
    }

	/**
     * Get fechaContrato
     *
     * @return VariableType
     */
    public function getFechaContrato(){
        return $this->fechaContrato;
    }

	/**
     * Set fechaContrato
     *
     * @param VariableType $fechaContrato
     */
    public function setFechaContrato($fechaContrato){
        $this->fechaContrato = $fechaContrato;
    }

	/**
     * Get tipoCuota
     *
     * @return VariableType
     */
    public function getTipoCuota(){
        return $this->tipoCuota;
    }

	/**
     * Set tipoCuota
     *
     * @param VariableType $tipoCuota
     */
    public function setTipoCuota($tipoCuota){
        $this->tipoCuota = $tipoCuota;
    }

	/**
     * Get importeCuota
     *
     * @return VariableType
     */
    public function getImporteCuota(){
        return $this->importeCuota;
    }

	/**
     * Set importeCuota
     *
     * @param VariableType $importeCuota
     */
    public function setImporteCuota($importeCuota){
        $this->importeCuota = $importeCuota;
    }

	/**
     * Get turismo
     *
     * @return VariableType
     */
    public function getTurismo(){
        return $this->turismo;
    }

	/**
     * Set turismo
     *
     * @param VariableType $turismo
     */
    public function setTurismo($turismo){
        $this->turismo = $turismo;
    }
}

?>