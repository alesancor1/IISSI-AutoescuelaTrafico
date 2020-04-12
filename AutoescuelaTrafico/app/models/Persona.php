<?php

class Persona extends BaseEntity {

	private $dni;
	private $nombre;
	private $apellidos;
	private $telefono;

//	public function _construct($dni, $nombre, $apellidos, $telefono) {
//		$this -> dni = $dni;
//		$this -> nombre = $nombre;
//		$this -> apellidos = $apellidos;
//		$this -> telefono = $telefono;
//	}

	public function __construct($table, $adapter){
		parent::__construct($table, $adapter);
	}

	public function getDni() {
		return $this -> dni;
	}

	public function setDni($dni) {
		$this -> dni = $dni;
	}

	public function getNombre() {
		return $this -> nombre;
	}

	public function setNombre($nombre) {
		$this -> nombre = $nombre;
	}

	public function getApellidos() {
		return $this -> apellidos;
	}

	public function setApellidos($apellidos) {
		$this -> apellidos = $apellidos;
	}

	public function getTelefono() {
		return $this -> telefono;
	}

	public function setTelefono($telefono) {
		$this -> telefono = $telefono;
	}

}
?>