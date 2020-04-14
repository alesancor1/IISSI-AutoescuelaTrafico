<?php
class Turismo extends Vehiculo{

	public function _construct($matricula, $estado, $modelo){
		
		$this -> matricula = $matricula;
		$this -> estado = $estado;
		$this -> modelo = $modelo;
	}

}
?>