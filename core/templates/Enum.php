<?php
abstract class Enum {

	// Enumeration constructor
	final public function __construct($value) {
		try {
			$c = new ReflectionClass($this);

			// Content validation
			if (!in_array($value, $c -> getConstants())) {
				try {
					throw new Exception("IllegalArgumentException");
				} catch (Exception $k) {
					echo $k -> getMessage();
				}
			}
			$this -> value = $value;
		} catch (Exception $k) {
			echo $k -> getMessage();
		}
	}

	// String representation
	final public function __toString() {
		return $this -> value;
	}

}
?>