<?php

class Alumno extends Persona {

	private $fechaNacimiento;
	private $clasesPagadas;
	private $RMedico;

	public function _construct($dni, $nombre, $apellidos, $telefono, $fechaNacimiento, $clasesPagadas, $RMedico) {
		parent::_construct($dni, $nombre, $apellidos, $telefono);
		$this -> fechaNacimiento = $fechaNacimiento;
		$this -> clasesPagadas = $clasesPagadas;
		$this -> RMedico = $RMedico == "Valido" ? new RMedicoEnum(RMedicoEnum::valido) : new RMedicoEnum(RMedicoEnum::noValido);
	}

	public function getFechaNacimiento() {
		return $this -> fechaNacimiento;
	}
	
	public function getClasesPagadas() {
		return $this -> clasesPagadas;
	}

	public function getRMedico() {
		return $this -> RMedico;
	}
	
	// ToDo: Añade/elimina clases 
}
?>