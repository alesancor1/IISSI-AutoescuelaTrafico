<?php
	if($allExamenes["circulacion"] != null){
		echo "<br>EXAMENES TEORICOS</br>";
		foreach($allExamenes["teoricos"] as $num=>$arrayTeoricos){
			if(sizeof($arrayTeoricos)<=1)
				echo "<br>".$arrayTeoricos->__toString()."</br>";
			else{
				foreach($arrayTeoricos as $examenT)
					echo "<br>".$examenT->__toString()."</br>";
			}
		}
	}
	if($allExamenes["circulacion"] != null){
		echo "<br><br>EXAMENES PRACTICOS CIRCULACION</br>";
		foreach($allExamenes["circulacion"] as $num=>$arrayCirc){
			if(sizeof($arrayCirc)<=1){
				foreach($arrayCirc as $Permiso=>$ExamenPC)
					echo "<br>".$Permiso."->".$ExamenPC->__toString()."</br>";
			}
			else{
				foreach($arrayCirc as $Permiso=>$ExamenPC)
					echo "<br>".$examenPC->__toString()."</br>";
			}
		}
	}
	if($allExamenes["pista"] != null){
		echo "<br>EXAMENES PRACTICOS CIRCULACION</br>";
		foreach($allExamenes["pista"] as $num=>$arrayPist){
			if(sizeof($arrayPist)<=1)
				echo "<br>".$arrayPist->__toString()."</br>";
			else{
				foreach($arrayCirc as $examenPP)
					echo "<br>".$examenPP->__toString()."</br>";
			}
		}
	}
?>