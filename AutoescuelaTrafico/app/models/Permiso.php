<?php
class Permiso{
	
	private $tipo;
	
	public function _construct($tipo){
		$this-> tipo = $tipo == "Permiso A2" ? new PermisoEnum(PermisoEnum::permisoA2) : new PermisoEnum(PermisoEnum::permisoB); 		
	}	

	public function getTipo(){
        return $this->tipo;
    }
}

?>