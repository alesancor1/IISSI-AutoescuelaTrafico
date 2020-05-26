<?php
class Profesor extends Persona {

	private $salario;
	private $nSeguridadSocial;
	private $fechaContrato;
	
	public function create($line){
        $args = split(",", $line);
        return new Profesor($args[0],$args[1],$args[2],$args[3],$args[4],$args[5],$args[6]);
    }

	public function __construct($dni, $nombre, $apellidos, $fechaContrato, $telefono, $salario,$nSeguridadSocial) {
		$this -> dni = $dni;
		$this -> nombre = $nombre;
		$this -> apellidos = $apellidos;
		$this -> telefono = $telefono;		
		$this -> salario = $salario;
		$this -> nSeguridadSocial = $nSeguridadSocial;
		$this -> fechaContrato = $fechaContrato;
	}

	public function getSalario() {
		return $this -> salario;
	}

	public function setSalario($salario) {
		$this -> salario = $salario;
	}

	public function getNSeguridadSocial() {
		return $this -> nSeguridadSocial;
	}

	public function setNSeguridadSocial($nSeguridadSocial) {
		$this -> nSeguridadSocial = $nSeguridadSocial;
	}

	public function getFechaContrato() {
		return $this -> fechaContrato;
	}

	public function setFechaContrato($fechaContrato) {
		$this -> fechaContrato = $fechaContrato;
	}

}
?>