<?php
class BaseModel{
    private $table;
    private $db;
     
    public function __construct($table,$adapter) {
        $this->table=(string) $table;
        $this->db = $adapter;
    }
     
    public function db(){
        return $this->db;
    }

    public function getAll(){
        $query=$this->db->query("SELECT * FROM $this->table");
 
        while ($row = $query->fetchObject()) {
           $resultSet[]=$row;
        }
       
        return $resultSet;
    }
     
    public function getBy($column,$value){
        $query=$this->db->query("SELECT * FROM $this->table WHERE $column='$value'");
 
        while($row = $query->fetchObject()) {
           $resultSet[]=$row;
        }
         
        return $resultSet;
    }
    
    public function deleteBy($column,$value){
        $query=$this->db->query("DELETE FROM $this->table WHERE $column='$value'");
        return $query;
    }

    public function rowNum($query){
        $stmt = $this->db()->query("SELECT COUNT(*) NUM FROM (".$query.")");
        return $stmt->fetchObject()->NUM;
    }
   
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
                $res[] = $stmt->fetchObject();
            }
        }            
        return $res;       
    }

    public function getLOB($table,$column,$oidColumn,$id){
        $stmt = $this->db()->prepare("SELECT $column FROM $table WHERE $oidColumn=$id");
        $stmt->execute();
        $stmt->bindColumn(1,$res, PDO::PARAM_LOB);
        $stmt=$stmt->fetch(PDO::FETCH_BOUND);
        return $res;
    }
}
?>
