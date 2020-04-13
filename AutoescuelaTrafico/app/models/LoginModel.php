<?php
class LoginModel extends BaseModel{
	
	private $table;
	
	public function __construct($adapter){
		$this->table = "Login";
		parent::__construct($this->table, $adapter);
	}
	
	public function getBy($usuario, $password){
		$query = "SELECT Tipo FROM Login WHERE Usuario='$usuario' AND Pass= '$password'";
		$res = $this->ejecutaSql($query);
		if($res!=null)
			return $res->TIPO;
	}
	
	
}

?>