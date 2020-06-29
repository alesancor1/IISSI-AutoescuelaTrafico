<?php
class AnunciosModel extends BaseModel{
	
	private $table;

	public function __construct($adapter){
			$this-> table = "Anuncios";
			parent::__construct($this -> table, $adapter);
	}
	public function getAll($first = 0, $last = -1){
        $query="SELECT * FROM Anuncios ORDER BY Fecha DESC";
        $res = $this->consultaPaginada($query,$first,$last);
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
    /*si la consulta es paginada debe implementarse rownum*/
    public function rows(){
        return $this->rowNum("SELECT * FROM Anuncios");
    }
    public function insert($titulo, $texto){
        $this->db()->beginTransaction();
        $this->ejecutaSql("INSERT INTO Anuncios (Fecha,Titulo,Texto) VALUES (sysdate,'$titulo','$texto')");
        $this->db()->commit();
    }
}

?>