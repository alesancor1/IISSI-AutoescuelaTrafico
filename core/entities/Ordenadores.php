<?php
class Ordenadores extends BaseEntity {
	private $id;
	private $estado;
	private $modelo;
	private $so;

	public function create($line){
        $args = split(",", $line);
        return new Ordenadores($args[1],$args[2],$args[3],$args[4]);
    }

	public function __construct($id, $estado, $modelo, $so) {
		parent::__construct("Ordenadores");
		$this -> id = $id;
		$this -> etstado = $estado;
		$this -> modelo = $modelo;
		$this -> so = $so;
	}

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