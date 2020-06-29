<?php
class LoginModel extends BaseModel{
	
	private $table;
	
	public function __construct($adapter){
		$this->table = "Login";
		parent::__construct($this->table, $adapter);
	}
	
	public function getByLogin($usuario, $password){
		$query = "SELECT * FROM Login WHERE Usuario='$usuario' AND Pass= '$password'";
		$res = $this->ejecutaSql($query);
		if($res!=null)
			return $res;
	}
	
	
}

?>