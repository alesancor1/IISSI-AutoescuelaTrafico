<?php
class BaseModel extends BaseEntity{
    private $table;
     
    public function __construct($table, $adapter) {
        $this->table=(string) $table;
        parent::__construct($table, $adapter);
         
    }

    public function ejecutarSql($query){
        $query=$this->db()->query($query);
        if($query==true){
            if($query->num_rows>1){
                while($row = $query->fetchObject()) {
                   $resultSet[]=$row;
                }
            }elseif($query->num_rows==1){
                if($row = $query->fetchObject()) {
                    $resultSet=$row;
                }
            }else{
                $resultSet=true;
            }
        }else{
            $resultSet=false;
        }         
        return $resultSet;
    }
    public function ejecutaSql($query){
        $stmt = $this->db()->query($query);
        $res = null;
        if($stmt == true){
            $res = $stmt->fetchObject()->TIPO;
        }
        else{
            echo "error:" . $e->GetMessage();
        }
        return $res;       
    }
}
?>
