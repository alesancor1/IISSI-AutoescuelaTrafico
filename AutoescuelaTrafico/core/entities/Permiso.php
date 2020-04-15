<?php
class Permiso extends BaseEntity{
	
	private $tipo;
	
	public function _construct($tipo){
		parent:__construct("Permiso");
		$this-> tipo = $tipo == "Permiso A2" ? new PermisoEnum(PermisoEnum::permisoA2) : new PermisoEnum(PermisoEnum::permisoB); 		
	}	

	public function getTipo(){
        return $this->tipo;
    }

	public function setTipo($tipo){
        $this->tipo = $tipo;
    }
}

?>