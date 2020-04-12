<?php
class Profesor extends Persona {

	private $salario;
	private $nSeguridadSocial;
	private $fechaContrato;

//	public function _construct($dni, $nombre, $apellidos, $telefono, $salario, $nSeguridadSocial, $fechaContrato) {
//		parent::_construct($dni, $nombre, $apellidos, $telefono);
//		$this -> salario = $salario;
//		$this -> nSeguridadSocial = $nSeguridadSocial;
//		$this -> fechaContrato = $fechaContrato;
//	}

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