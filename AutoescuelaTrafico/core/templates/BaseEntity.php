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
        $query=$this->db->query("SELECT * FROM ".$this->table ." ORDER BY DNI DESC");
 
 
 		echo $this->table;
 		
		$listaUsuarios= [];
		
		foreach ($query->fetchAll() as $usuario) {
			$listaUsuarios[]= new Alumno($usuario['DNI'], $usuario['Nombre'],$usuario['Apellido'],$usuario['Telefono'],
			$usuario['FechaNacimiento'],$usuario['ClasesPagadas'], $usuario['ReconocimientoMedico']);
		}
		
        // while ($row = $query->fetchObject()) {
           // $resultSet[]=$row;
        // }
         
        return $resultSet;
    }
     
    public function getById($id){
        $query=$this->db->query("SELECT * FROM $this->table WHERE id=$id");
 
        if($row = $query->fetch_object()) {
           $resultSet=$row;
        }
         
        return $resultSet;
    }
     
    public function getBy($column,$value){
        $query=$this->db->query("SELECT * FROM $this->table WHERE $column='$value'");
 
        while($row = $query->fetch_object()) {
           $resultSet[]=$row;
        }
         
        return $resultSet;
    }
     
    public function deleteById($id){
        $query=$this->db->query("DELETE FROM $this->table WHERE id=$id");
        return $query;
    }
     
    public function deleteBy($column,$value){
        $query=$this->db->query("DELETE FROM $this->table WHERE $column='$value'");
        return $query;
    }
}
?>
