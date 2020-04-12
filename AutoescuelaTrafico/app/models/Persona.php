<?php

class Persona extends EntidadBase {

	private $dni;
	private $nombre;
	private $apellidos;
	private $telefono;

	public function _construct($dni, $nombre, $apellidos, $telefono) {
		$this -> dni = $dni;
		$this -> nombre = $nombre;
		$this -> apellidos = $apellidos;
		$this -> telefono = $telefono;
	}

	public function getDni() {
		return $this -> dni;
	}

	public function getNombre() {
		return $this -> nombre;
	}

	public function getApellidos() {
		return $this -> apellidos;
	}

	public function getTelefono() {
		return $this -> telefono;
	}

	public function setTelefono($telefono) {
		$this -> telefono = $telefono;
	}

}
?>