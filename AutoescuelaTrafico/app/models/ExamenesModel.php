<?php
	class ExamenesModel extends BaseModel{
		public $table;

		public function __construct($adapter){
			$this-> table = "ExamenesTeoricos";
			parent::__construct($this -> table, $adapter);

		}

		public function getAllExamenes(){
			$dni = $_SESSION["cuenta"][3];
			$query = "SELECT * FROM ExamenesTeoricos WHERE Alumno = '$dni'";
			$examenesT[] = $this->ejecutaSql($query);

			$query = "SELECT m.permisomatriculado,EPC.* FROM examenespracticocirculacion EPC,Matriculas M WHERE epc.alumno=m.alumno AND epc.alumno='$dni'";
			$examenesPC[] = $this->ejecutaSql($query);

			$query = "SELECT * FROM EXAMENESPRACTICOPISTA EPP WHERE epp.alumno='$dni'";
			$examenesPP[] = $this->ejecutaSql($query);
			
			//conversion a tipo examen aqui
			return array("teoricos"=>$examenesT, "circulacion"=>$examenesPC, "pista"=>$examenesPP);
		}
	}
?>