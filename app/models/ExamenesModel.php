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
			$examenesT = $this->ejecutaSql($query);

			$query = "SELECT m.permisomatriculado,EPC.* FROM examenespracticocirculacion EPC,Matriculas M WHERE epc.alumno=m.alumno AND epc.alumno='$dni'";
			$examenesPC = $this->ejecutaSql($query);

			$query = "SELECT * FROM EXAMENESPRACTICOPISTA EPP WHERE epp.alumno='$dni'";
			$examenesPP = $this->ejecutaSql($query);
			//parsing
			if(sizeof($examenesT)==0)
				$examenesT = null;		
			else {
				foreach($examenesT as $num=>$examenT)
					$examenesT[$num] = Teorico::__parse("Teorico", $examenT);
			}
			if(sizeof($examenesPC)==0)
				$examenesPC = null;
			else{
				foreach($examenesPC as $num=>$examenPC)
					$examenesPC[$num] = array($examenPC->PERMISOMATRICULADO=>Circulacion::__parse("Circulacion", $examenPC));
			}
			if(sizeof($examenesPP)==0)
				$examenesPP = null;
			else{
				foreach($examenesPP as $num=>$examenPP)
					$examenesPP[$num] = Pista::__parse("Pista", $examenPP);
			}

			return array("teoricos"=>$examenesT, "circulacion"=>$examenesPC, "pista"=>$examenesPP);
		}
	}
?>