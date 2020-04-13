<?php
class BaseModel extends BaseEntity{
    private $table;
     
    public function __construct($table, $adapter) {
        $this->table=(string) $table;
        parent::__construct($table, $adapter);
         
    }
   /* public function ejecutarSql($query){
        $query=$this->db()->query($query);
        if($query==true){
            if($query->rowCount()>1){
                while($row = $query->fetchObject()) {
                   $resultSet[]=$row;
                }
            }elseif($query->rowCount()==1){
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
    }*/
    public function ejecutaSql($query){
        $stmt = $this->db()->query($query);
        $res = null;

        if($query==true){
            $rowNum = $this->rowNum($query);
            if($rowNum>1){
                for($i=0;$i<$rowNum;$i++){
                    $res[$i]=$stmt->fetchObject();
                }
            }
            elseif($rowNum==1){
                $res = $stmt->fetchObject();
            }
        }            
        return $res;       
    }

    public function rowNum($query){
        $stmt = $this->db()->query("SELECT COUNT(*) NUM FROM (".$query.")");
        return $stmt->fetchObject()->NUM;
    }
}
?>
