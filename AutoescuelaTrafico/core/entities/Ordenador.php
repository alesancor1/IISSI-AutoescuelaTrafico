<?php
class Ordenador extends BaseEntity {
	private $id;
	private $estado;
	private $modelo;
	private $so;

	public function __construct($adapter) {
		$table = "ordenadores";
		parent::__construct($table, $adapter);
	}

	/**public function save() {
	*	$query = "INSERT INTO ordenadores (id,estado,modelo,so)
    *           VALUES(NULL,
    *				   '".$this -> estado."',      		
    *                  '".$this -> modelo."',
    *                  '".$this -> so."');";
	*	$save = $this -> db() -> query($query);
	*	//$this->db()->error;
	*	return $save;
	*}
	*/

	/**
	 * Get id
	 *
	 * @return VariableType
	 */
	public function getId() {
		return $this -> id;
	}

	/**
	 * Set id
	 *
	 * @param VariableType $id
	 */
	public function setId($id) {
		$this -> id = $id;
	}

	/**
	 * Get estado
	 *
	 * @return VariableType
	 */
	public function getEstado() {
		return $this -> estado;
	}

	/**
	 * Set estado
	 *
	 * @param VariableType $estado
	 */
	public function setEstado($estado) {
		$this -> estado = $estado;
	}

	/**
	 * Get modelo
	 *
	 * @return VariableType
	 */
	public function getModelo() {
		return $this -> modelo;
	}

	/**
	 * Set modelo
	 *
	 * @param VariableType $modelo
	 */
	public function setModelo($modelo) {
		$this -> modelo = $modelo;
	}

	/**
	 * Get so
	 *
	 * @return VariableType
	 */
	public function getSo() {
		return $this -> so;
	}

	/**
	 * Set so
	 *
	 * @param VariableType $so
	 */
	public function setSo($so) {
		$this -> so = $so;
	}

}
?>