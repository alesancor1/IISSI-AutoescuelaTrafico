<?php
class SegurosTurismos extends BaseEntity{
	
	protected $id;
	protected $companyia;
	protected $tipoSeguro;
	protected $fechaContrato;
	protected $tipoCuota;
	protected $importeCuota;
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
}

?>