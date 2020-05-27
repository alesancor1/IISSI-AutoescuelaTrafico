<?php
class ProfesoresModel extends BaseModel {

	public $table;

	public function __construct($adapter) {
		$this -> table = "Profesores";
		parent::__construct($this -> table, $adapter);
	}

	//ADMINISTRADOR Lista de profesores con su info.

	public function getInformacionProfesores() {
		$query = "SELECT * FROM PROFESORES";
		$table = $this -> ejecutaSql($query);
				
		if ($table != null) {
			foreach ($table as $num => $profesor) {
				$table[$num] = Profesor::__parse("Profesor", $profesor);
			}
		}
		return $table;
	}

	public function getPermisosImpartidos(){
		$query = "SELECT * FROM profesoresimpartenpermisos";
		$table = $this->ejecutaSql($query);
		return $table;
	}
	
	public function addProfesor($dni, $nombre, $apellidos, $fechaContrato, $telefono, $salario, $nss){
		$query = "INSERT INTO Profesores (DNI, NOMBRE, APELLIDOS, FECHACONTRATO, TELEFONO, SALARIO, NSS) 
		VALUES ('$dni', '$nombre', '$apellidos', to_date('$fechaContrato','YYYY-MM-DD'), '$telefono', '$salario', '$nss')";
		echo($query);
		$tabla = $this -> ejecutaSql($query);
	}
	
	public function deleteProfesor($dni){
		$tabla = $this -> ejecutaSql("DELETE FROM Profesores WHERE DNI = '$dni'");
	}
}
?>