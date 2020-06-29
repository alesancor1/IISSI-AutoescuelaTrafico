<?php
class Alumnos extends Persona {

	public $fechaNacimiento;
	public $clasesPagadas;
	public $RMedico;
	
	public function create($line){
        $args = split(",", $line);
        return new Alumnos($args[1],$args[2],$args[3],$args[4],$args[5],$args[6],$args[7]);
    }

	public function __construct($dni, $nombre, $apellidos, $telefono, $clasesPagadas, $fechaNacimiento, $RMedico) {
		$this -> dni = $dni;
		$this -> nombre = $nombre;
		$this -> apellidos = $apellidos;
		$this -> telefono = $telefono;
		$this -> fechaNacimiento = $fechaNacimiento;
		$this -> clasesPagadas = $clasesPagadas;
		$this -> RMedico = $RMedico;// == "Valido" ? new RMedicoEnum(RMedicoEnum::valido) : new RMedicoEnum(RMedicoEnum::noValido);
	}

	public function getFechaNacimiento(){
        return $this->fechaNacimiento;
    }

	public function setFechaNacimiento($fechaNacimiento){
        $this->fechaNacimiento = $fechaNacimiento;
    }

	public function getClasesPagadas(){
        return $this->clasesPagadas;
    }

	public function setClasesPagadas($clasesPagadas){
        $this->clasesPagadas = $clasesPagadas;
    }

	public function getRMedico(){
        return $this->RMedico;
    }

	public function setRMedico($RMedico){
        $this->RMedico = $RMedico;
    }
}

?>