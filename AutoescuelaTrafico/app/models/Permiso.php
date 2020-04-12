<?php
class Permiso extends BaseEntity{
	
	private $tipo;
	
//	public function _construct($tipo){
//		$this-> tipo = $tipo == "Permiso A2" ? new PermisoEnum(PermisoEnum::permisoA2) : new PermisoEnum(PermisoEnum::permisoB); 		
//	}	

	public function __construct($adapter){
		$table="Permisos";
		parent::__construct($table, $adapter);
	}

	public function getTipo(){
        return $this->tipo;
    }

	public function setTipo($tipo){
        $this->tipo = $tipo;
    }
}

?>