<?php
	echo "<br>EXAMENES TEORICOS</br>";
	foreach($allExamenes["teoricos"] as $arrayTeoricos){
		if(sizeof($arrayTeoricos)<=1)
			print_r($arrayTeoricos);
		else{
			foreach($arrayTeoricos as $examenT)
				print_r("<br>".$examenT."</br>");
		}
	}
	echo "<br>EXAMENES PRACTICOS CIRCULACION</br>";
	foreach($allExamenes["circulacion"] as $arrayCirc){
		if(sizeof($arrayCirc)<=1)
			print_r($arrayCirc);
		else{
			foreach($arrayCirc as $examenPC)
				print_r($examenPC);
		}
	}

?>