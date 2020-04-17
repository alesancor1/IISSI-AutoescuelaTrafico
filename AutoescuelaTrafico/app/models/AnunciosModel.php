<?php
class AnunciosModel extends BaseModel{
	
	private $table;

	public function __construct($adapter){
			$this-> table = "Anuncios";
			parent::__construct($this -> table, $adapter);
	}
	public function getAll(){
        $query="SELECT * FROM Anuncios ORDER BY Fecha DESC";
        $res = $this->ejecutaSql($query);
        if($res != null){
            foreach($res as $num=>$anuncio){
                $res[$num] = Anuncios::__parse("Anuncios",$anuncio);
                $res[$num]->setTexto($this->getLOB("Anuncios","Texto","OID_ANUN",$res[$num]->getID()));
            }  
        }
        else
            $res=array();
        return $res;
    }
    public function insert($titulo, $texto){
        $this->ejecutaSql("INSERT INTO Anuncios (Fecha,Titulo,Texto) VALUES (sysdate,'$titulo','$texto')");
    }
}

?>