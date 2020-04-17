<?php
class SegurosTurismos extends BaseEntity{
	
	protected $motocicleta;
	
	public function create($line){
        $args = split(",", $line);
        return new SegurosMotciletas($args[0],$args[1],$args[2],$args[3],$args[4],$args[5],$args[6],$args[7]);
    }
	
	public function __construct($id, $companyia, $tipoSeguro, $fechaContrato, $tipoCuota, $importeCuota, $motocicleta){
		parent::__construct("SegurosMotocicletas");
		$this -> id = $id;
		$this -> companyia = $companya;
		$this -> tipoSeguro = $tipoSeguro;
		$this -> fechaContrato = $fechaContrato;
		$this -> tipoCuota = $tipoCuota;
		$this -> importeCuota = $importeCuota;
		$this -> motocicleta = $motocicleta;
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
}

?>