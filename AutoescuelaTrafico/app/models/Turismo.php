<?php
class Turismo extends Veiculo{

	public function _construct($matricula, $estado, $modelo){
		
		$this -> matricula = $matricula;
		$this -> estado = $estado;
		$this -> modelo = $modelo;
	}

}
?>