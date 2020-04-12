<?php
class AlumnosModel extends BaseModel {

	private $table;

	public function __construct($adapter) {
		$this -> table = "Alumnos";
		parent::__construct($this -> table, $adapter);
	}

	// Metodos de consulta
	public function getAlumnos() {
		$query = "SELECT * FROM Alumnos";
		$alumno = $this -> ejecutarSql($query);
		return $alumno;
	}

}
?>