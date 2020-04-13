<?php
class UsoPc extends BaseEntity {
	private $id;
	private $fecha;
	private $horaComienzo;
	private $horaFin;

	public function __construct($adapter) {
		$table = "UsoPc";
		parent::__construct($table, $adapter);
	}

	/**
     * Get fecha
     *
     * @return VariableType
     */
    public function getFecha(){
        return $this->fecha;
    }

	/**
     * Set fecha
     *
     * @param VariableType $fecha
     */
    public function setFecha($fecha){
        $this->fecha = $fecha;
    }

	/**
     * Get horaComienzo
     *
     * @return VariableType
     */
    public function getHoraComienzo(){
        return $this->horaComienzo;
    }

	/**
     * Set horaComienzo
     *
     * @param VariableType $horaComienzo
     */
    public function setHoraComienzo($horaComienzo){
        $this->horaComienzo = $horaComienzo;
    }

	/**
     * Get horaFin
     *
     * @return VariableType
     */
    public function getHoraFin(){
        return $this->horaFin;
    }

	/**
     * Set horaFin
     *
     * @param VariableType $horaFin
     */
    public function setHoraFin($horaFin){
        $this->horaFin = $horaFin;
    }
}

?>