<!DOCTYPE html>
<html>

<body>
	<div id="sidebar" class="sidebar">
        <div id="sidebuttons" class="sidebuttons">
        	<?php
        		if(isset($_SESSION['cuenta'])){
        			echo "<p>Ingresado como:</p>";
					echo "<p>".$_SESSION['cuenta'][0]."</p>";
        		
            		if($_SESSION['cuenta'][2]=='Alumno'){
                		echo "<ul style=\"list-style-type:none;\">";
                			echo "<a href=\"?controller=Examenes\"><li>Exámenes</li></a>";
                    		echo "<a href=\"#\"><li>Clases</li></a>";
                    		echo "<ul style='list-style-type:none;'>";
                	   			echo "<a href=\"#\"><li>Información</li></a>";
            	        		echo "<a href=\"#\"><li>Tutorías</li></a>";
        	            	echo "</ul>";
    	                	echo "<a href=\"#\"><li>WebTest</li></a>";
	                        echo "<a href=\"#\"><li>Notificaciones</li></a>";
                            echo "<ul style='list-style-type:none;'>";
                                echo "<a href=\"?controller=Anuncios\"><li>Anuncios</li></a>";
                                echo "<a href=\"#\"><li>Mensajes</li></a>";
                            echo "</ul>";
                            echo "<a href=\"?\"><li> <= </li></a>";
                    	echo "</ul>";
                	}
					if($_SESSION["cuenta"][2]=='Profesor'){
                		echo "<ul style=\"list-style-type:none;\">";
                			echo "<a href=\"#\"><li>Horario</li></a>";
                    		echo "<a href=\"#\"><li>Alumnos</li></a>";
                    		echo "<ul style=\"list-style-type:none;\">";
                   				echo "<a href=\"#\"><li>Lista</li></a>";
                    			echo "<a href=\"#\"><li>Calificaciones</li></a>";
                    		echo "</ul>";
                        	echo "<a href=\"#\"><li>Notificaciones</li></a>";
                    		echo "<ul style=\"list-style-type:none;\">";
                   				echo "<a href=\"#\"><li>Anuncios</li></a>";
                    			echo "<a href=\"#\"><li>Mensajes</li></a>";
                    		echo "</ul>";
                            echo "<a href=\"?\"><li> <= </li></a>";
                    	echo "</ul>";
                	}
                	if($_SESSION["cuenta"][2]=='Administrador'){
                		echo "<ul style=\"list-style-type:none;\">";
                			echo "<a href=\"#\"><li>Alumnado</li></a>";
            	        	echo "<ul style=\"list-style-type:none;\">";
        	           			echo "<a href=\"#\"><li>Lista</li></a>";
    	                		echo "<a href=\"#\"><li>Calificaciones</li></a>";
	                    	echo "</ul>";
                        
                    		echo "<a href=\"#\"><li>Profesorado</li></a>";
                        	echo "<a href=\"#\"><li>Clases</li></a>";
                        	echo "<a href=\"#\"><li>Vehiculos</li></a>";
                        	echo "<a href=\"#\"><li>Recursos</li></a>";
                    		echo "<ul style=\"list-style-type:none;\">";
                   				echo "<a href=\"?controller=WebTest&action=indexRecursosWebTest\"><li>WebTest</li></a>";
	                    		echo "<a href=\"#\"><li>Ordenadores</li></a>";
                    		echo "</ul>";
                        	echo "<a href=\"#\"><li>Administración</li></a>";
                        	echo "<a href=\"#\"><li>Notificaciones</li></a>";
                    		echo "<ul style=\"list-style-type:none;\">";
                   				echo "<a href=\"#\"><li>Anuncios</li></a>";
                    			echo "<a href=\"#\"><li>Mensajes</li></a>";
                    		echo "</ul>";
                            echo "<a href=\"?\"><li> <= </li></a>";
                    	echo "</ul>";
                	}
				}
            
            ?>
        </div>
    </div>
</body>
</html> 