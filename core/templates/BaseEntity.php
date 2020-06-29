<?php
class BaseEntity{
	private $child;

	public function __construct($child){
		$this->child = $child;
	}
    public function __toString(){
    	$res = $this->child."(";
    	foreach($this as $atributo){
    		$res = $res.", ".$atributo;
    	}
    	return $res.")";
    }
    public static function __parse($child, $stdObject){
    	$param = "";
    	foreach($stdObject as $atrib=>$value){
    		$param = $param.$value.",";
    	}
    	$param = substr($param,0,-1);
    	return $child::create($param);
    }
}     
?>
