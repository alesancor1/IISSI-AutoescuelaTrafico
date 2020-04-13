<?php
class BaseEntity{
    private $table;
    private $db;
 
    public function __construct($table, $adapter) {
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
}
?>
