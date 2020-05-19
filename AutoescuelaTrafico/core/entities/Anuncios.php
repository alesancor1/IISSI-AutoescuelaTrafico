<?php

class Anuncios extends BaseEntity {
	
    public function create($line){
        $args = split(",", $line);
        return new Anuncios($args[1],$args[2],$args[3],$args[4]);
    }

	private $id;
	private $fecha;
	private $titulo;
	private $texto;


	public function __construct($id, $fecha, $titulo, $texto) {
        parent::__construct("Anuncios");
		$this -> id = $id;
		$this -> fecha = $fecha;
		$this -> titulo = $titulo;
		$this -> texto = $texto;
	}


	/**
     * Get id
     *
     * @return VariableType
     */
    public function getId(){
        return $this->id;
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
     * Get Titulo
     *
     * @return VariableType
     */
    public function getTitulo(){
        return $this->titulo;
    }


	/**
     * Get texto
     *
     * @return VariableType
     */
    public function getTexto(){
        return stream_get_contents($this->texto);
    }

    public function setTexto($texto){
        $this->texto = $texto;
    }

}

?>