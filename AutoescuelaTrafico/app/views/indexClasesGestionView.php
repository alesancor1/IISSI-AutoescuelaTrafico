<!DOCTYPE html>
<html>

<body>
<table>
	<tr>
    	<th>Alumno</th>
        <th>Días sin dar clase</th>
        <th>Última clase</th>
        <th>Profesor</th>
    </tr>
    
    <?php
    	if(sizeof($gestionClases)!=0){
        	foreach($gestionClases as $num=>$row){
            	echo "<tr>";
            	foreach($row as $param){
                	echo "<td>$param</td>";
                }
                echo "</tr>";
            }
        }
    ?>

</table>
</body>
</html>