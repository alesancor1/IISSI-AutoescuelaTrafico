<?php
class ProfesoresModel extends BaseModel {

	public $table;

	public function __construct($adapter) {
		$this -> table = "Profesores";
		parent::__construct($this -> table, $adapter);
	}

	//	ADMINISTRADOR

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
		$apellidosArr = split(" ",$apellidos);
		$username = substr($nombre, 0, 3) . substr($apellidosArr[0], 0, 3) . substr($apellidosArr[1], 0, 3);
	 
		$this->db()->beginTransaction();
		$this -> ejecutaSql("INSERT INTO LOGIN (USUARIO, DNI, PASS, TIPO) VALUES ('$username', '$dni', 'traficoPROF', 'Profesor')");

		$query = "INSERT INTO Profesores (DNI, NOMBRE, APELLIDOS, FECHACONTRATO, TELEFONO, SALARIO, NSS) 
		VALUES ('$dni', '$nombre', '$apellidos', to_date('$fechaContrato','YYYY-MM-DD'), '$telefono', '$salario', '$nss')";
		$this -> ejecutaSql($query);

		$this->db()->commit();
	}
	
	public function deleteProfesor($dni){
		try{
			$this->db()->beginTransaction();
			$this -> ejecutaSql("DELETE FROM LOGIN WHERE DNI = '$dni'");
			$this -> ejecutaSql("DELETE FROM Profesores WHERE DNI = '$dni'");
			$this->db()->commit();
		}
		catch (Exception $e){
			echo $e;
		}
	}
}
?>