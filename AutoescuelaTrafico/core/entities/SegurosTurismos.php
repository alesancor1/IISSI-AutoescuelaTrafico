<?php
class SegurosTurismos extends BaseEntity{
	
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