<?php
class Turismo extends Vehiculo{

	public function _construct($matricula, $estado, $modelo){
		parent::__construct("Turismo");
		$this -> matricula = $matricula;
		$this -> estado = $estado;
		$this -> modelo = $modelo;
	}

}
?>