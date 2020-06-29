<?php
	//clase servidora, envia las respuestas a las peticiones HTTP
	//el archivo .htaccess redirecciona aquí si se introduce /api/ en la uri
	class ServerAPI{

		private $conexion; // objeto Connection (hereda de PDO)
		private $adapter;  // conexion a la DB

		public function __construct(){

			//clases principales
			require_once __DIR__.'/Connection.php';
			require_once __DIR__.'/templates/BaseEntity.php';
	        require_once __DIR__.'/templates/BaseModel.php';

	        //incluye las entidades
	        require_once __DIR__.'/templates/Enum.php';
			require_once __DIR__.'/entities/Vehiculo.php';
	        require_once __DIR__.'/entities/Persona.php';
			require_once __DIR__.'/entities/Examen.php';
			require_once __DIR__.'/entities/Practico.php';
	        foreach(glob(__DIR__."/entities/*.php") as $file){
	            require_once $file;
	        }	
			//incluye los modelos
			foreach(glob(__DIR__."/../app/models/*.php") as $file){
            	require_once $file;
        	}
        	//crea el objeto Conexion
			$this->conexion = new Connection();
			$this->adapter = null;
		}

		/*****************************************************************************************************
		*	FUNCION PRINCIPAL SERVE
		******************************************************************************************************/
		public function serve(){

	        $method = $_SERVER['REQUEST_METHOD']; 			// metodo HTTP
	        $uri = $_SERVER['REQUEST_URI'];		  			// uri completa de la request
	        $path = explode('/', $this->path($uri)); 	 	// obtiene el pathname y hace un array con cada /
	        $query = explode('&', $this->query($uri));		// obtiene la query (lo que va tras el ? en la uri)
	        $endpoint = isset($path[3]) ? $path[3] : ""; 	// obtiene el endpoint al que estamos accediendo
	        $this->adapter = $this->conexion->conexion();	// inicia la conexion con la BD

	        //formatea los parametros de la query como array
	        if($query[0]!=''){
		        foreach($query as $num=>$q){
		        	$pair = split("=", $q);
		        	$query[$pair[0]] = $pair[1];
		        	unset($query[$num]);
		        }
		    }

	        /* funciones de los endpoints */
	        switch($endpoint){

	        	/*
	        	*	ALUMNOS ENDPOINT
	        	*/
	        	case 'alumnos':
	        			$resource = new AlumnosAdminModel($this->adapter);
	        			// =============================================== GET
	        			if($method == 'GET'){
	        				$alumnosArr = $this->alumnosJSON($resource);
	        				if(isset($path[4])){
	        					if(isset($alumnosArr[$path[4]]))
	        						$this->serialize($alumnosArr[$path[4]]);
	        					else
	        						header('HTTP/1.1 404 Not Found');
	        				} else 
	        					$this->serialize($alumnosArr);
	        			// ================================================ POST
	        			} elseif($method == 'POST'){
	        				if($this->validateAlumnos($query)){

	        					$dni = $query['dni'];
						        $nombre = urldecode($query['nombre']);
						        $apellidos = urldecode($query['apellidos']);
						        $fNacimiento = $query['fNacimiento']; 
						        $permiso = urldecode($query['permiso']); 
						        $oferta = $permiso=="Permiso A2"? 2:1;

	        					$resource->insert($dni, $nombre, $apellidos, $fNacimiento, $permiso, $oferta);
	        				} else
	        					header('HTTP/1.1 400 Bad Request');
	        			// ================================================ DELETE
	        			} elseif($method == 'DELETE'){
	        				if(isset($query['dni'])){
	        					$dni = $query['dni'];
	        					if(strlen($dni)==9 && preg_match("/[0-9]{8}[A-Z]/", $dni))
	        						$resource->delete($dni);
	        					else
	        						header('HTTP/1.1 400 Bad Request');
	        				} else
	        					header('HTTP/1.1 400 Bad Request');
	        			// ================================================ ERROR - METODO NO PERMITIDO
	        			} else{
	        				header('HTTP/1.1 405 Method Not Allowed');
            				header('Allow: GET, POST, DELETE');
	        			} Connection::closeConexion($this->conexion);
	        			break;

	        	/*
	        	*	PROFESORES ENDPOINT
	        	*/
	        	case 'profesores': 
	        			$resource = new ProfesoresModel($this->adapter);
	        			// ================================================= GET
	        			if($method == 'GET'){
	        				$profesoresArr = $this->profesoresJSON($resource);
	        				if(isset($path[4])){
	        					if(isset($profesoresArr[$path[4]]))
	        						$this->serialize($profesoresArr[$path[4]]);
	        					else
	        						header('HTTP/1.1 404 Not Found');
	        				} else 
	        					$this->serialize($profesoresArr);
	        			// ================================================= POST
	        			} elseif($method == 'POST') {
	        				if($this->validateProfesores($query)){

	        					$dni = $query['dni'];
	        					$nombre = urldecode($query['nombre']);
	        					$apellidos = urldecode($query['apellidos']);
	        					$fechaContrato = $query['fechaContrato'];
	        					$telefono = $query['telefono'];
	        					$salario = $query['salario'];
	        					$nss = urldecode($query['nss']);

	        					$resource->addProfesor($dni, $nombre, $apellidos, $fechaContrato, $telefono, $salario, $nss);
	        				} else
	        					header('HTTP/1.1 400 Bad Request');
	        			// ================================================ DELETE
	        			} elseif($method == 'DELETE'){
	        				if(isset($query['dni'])){
	        					$dni = $query['dni'];
	        					if(strlen($dni)==9 && preg_match("/[0-9]{8}[A-Z]/", $dni))
	        						$resource->deleteProfesor($dni);
	        					else
	        						header('HTTP/1.1 400 Bad Request');
	        				} else
	        					header('HTTP/1.1 400 Bad Request');
	        			// ================================================ ERROR - METODO NO PERMITIDO
	        			} else{
	        				header('HTTP/1.1 405 Method Not Allowed');
            				header('Allow: GET, POST, DELETE');
	        			} Connection::closeConexion($this->conexion);
	        			break;

	        	/*
				*	INFORMACION
	        	*/
	        	case '': if($method == 'GET' || $method == 'OPTIONS'){
		        			 echo "<h1>Informacion</h1>";
		        			 echo "<p>Los endpoints disponibles son:</p><ul>";
		        			 echo "<li>/alumnos";
		        			 echo "<li>/profesores";
		        			 echo "</ul>";
	        			} else{
	        				header('HTTP/1.1 405 Method Not Allowed');
            				header('Allow: GET, OPTIONS');
	        			} break;
	        	default: header('HTTP/1.1 404 Not Found'); break;
	        }
		}
		
		/*************************************************************************************************
		*	FUNCIONES DE PROCESAMIENTO DE DATOS
		*************************************************************************************************/
		private function validateProfesores($query){
			//comprobacion de que estan todos los argumentos requeridos seteados
			$res = sizeof($query)==7;
			$res = $res && isset($query['dni']);
			$res = $res && isset($query['nombre']);
			$res = $res && isset($query['apellidos']);
			$res = $res && isset($query['fechaContrato']);
			$res = $res && isset($query['telefono']);
			$res = $res && isset($query['salario']);
			$res = $res && isset($query['nss']);

			//validaciones formato
			if($res){
				$res = $res && strlen($query['dni'])==9 && preg_match("/[0-9]{8}[A-Z]/", $query['dni']); //formato DNI
				$res = $res && preg_match("/[0-9]{4}-[0-9]{2}-[0-9]{2}/", $query['fechaContrato']);
				$res = $res && preg_match("/[0-9]{9}/", $query['telefono']);
				$res = $res && preg_match("/[0-9]{2} [0-9]{10}/", urldecode($query['nss']));
			}
			return $res;
		}

		private function validateAlumnos($query){
			//comprobacion de que estan todos los argumentos requeridos seteados
			$res = sizeof($query)==5;
	       	$res = $res && isset($query['dni']);
	       	$res = $res && isset($query['nombre']);
	       	$res = $res && isset($query['apellidos']);
	       	$res = $res && isset($query['fNacimiento']);
	       	$res = $res && isset($query['permiso']);
	        
	        //validaciones de formatos
	        if($res){
		        $res = $res && strlen($query['dni'])==9 && preg_match("/[0-9]{8}[A-Z]/", $query['dni']); //formato DNI
		        $res = $res && preg_match("/[0-9]{4}-[0-9]{2}-[0-9]{2}/", $query['fNacimiento']); 		 //formato fecha (YYYY-MM-DD)
		        $permiso = urldecode($query['permiso']);
		        $res = $res && ($permiso == 'Permiso A2' || $permiso == 'Permiso B');					 //formato permiso
	    	}
	    	return $res;
		}

		private function profesoresJSON($resource){
			/* obtiene un array con todos los profesores por DNI */
			$profesores = $resource -> getInformacionProfesores();
			$permisos = $resource -> getPermisosImpartidos();
			$profesoresArr = array();
			foreach ($profesores as $profesorObj){
				$profesoresArr[$profesorObj->dni] = array('nombre' => $profesorObj->nombre,
														  'apellidos' => $profesorObj->apellidos,
														  'telefono' => $profesorObj->telefono,
														  'salario' => $profesorObj->salario,
														  'nSeguridadSocial' => $profesorObj->nSeguridadSocial,
														  'fechaContrato' => $profesorObj->fechaContrato,
														  'permisos' => array());
				foreach ($permisos as $permiso) {
					if($permiso->DNI == $profesorObj->dni)
						$profesoresArr[$profesorObj->dni]['permisos'] = $permiso->TIPOPERMISO;
				}
			}
			return $profesoresArr;
		}

		private function alumnosJSON($resource){
			/* obtiene un array con todos los alumnos por DNI */
	        $alumnos = $resource -> getAlumnos();
	        $examenes = array ($resource -> getExamenesTeoricos(),
	        				   $resource -> getExamenesPracticosCirculacion(),
	        				   $resource -> getExamenesPracticosPista());
	        $alumnosArr = array();
	        foreach ($alumnos as $alumnoObj) {
	        	$alumnosArr[$alumnoObj->dni] = array('nombre' => $alumnoObj->nombre,
	        										 'apellidos' => $alumnoObj->apellidos,
	        										 'telefono' => $alumnoObj->telefono,
	        										 'fecha de nacimiento' => $alumnoObj->fechaNacimiento,
	        										 'clases pagadas' => $alumnoObj->clasesPagadas,
	        										 'reconocimiento medico' => $alumnoObj->RMedico,
	        										 'examenes' => array('teoricos' => array(),
	        															 'pista' => array(),
	        															 'circulacion' => array()));
	        	foreach ($examenes[0] as $examenT) {
	        		if($examenT->NOMBRE . $examenT->APELLIDOS == $alumnoObj->nombre . $alumnoObj->apellidos)
	        				$alumnosArr[$alumnoObj->dni]['examenes']['teoricos'] = array('fecha'=>$examenT->FECHA,
	        																			 'calificacion'=>$examenT->CALIFICACION,
	        																			 'nfallos'=>$examenT->NFALLOS);
	        	}
	        	foreach ($examenes[1] as $examenPC) {
	        		if($examenPC->NOMBRE . $examenPC->APELLIDOS == $alumnoObj->nombre . $alumnoObj->apellidos)
	        			$alumnosArr[$alumnoObj->dni]['examenes']['circulacion'] = array('fecha'=>$examenPC->FECHA,
	        																		    'calificacion'=>$examenPC->CALIFICACION,
	        																		    'faltasLeves'=>$examenPC->FALTASLEVES,
	        																			'faltasDeficientes'=>$examenPC->FALTASDEFICIENTES,
	        																			'faltasEliminatorias'=>$examenPC->FALTASELIMINATORIAS);
	        	}
	        	foreach ($examenes[2] as $examenPP) {
	        		if($examenPP->NOMBRE . $examenPP->APELLIDOS == $alumnoObj->nombre . $alumnoObj->apellidos)
	        			$alumnosArr[$alumnoObj->dni]['examenes']['pista'] = array('fecha'=>$examenPP->FECHA,
	        																      'calificacion'=>$examenPP->CALIFICACION,
	        																      'faltasLeves'=>$examenPP->FALTASLEVES,
	        																	  'faltasDeficientes'=>$examenPP->FALTASDEFICIENTES,
	        																	  'faltasEliminatorias'=>$examenPP->FALTASELIMINATORIAS);
	        	}
	        }
	        return $alumnosArr;
		}
		/**************************************************************************************************
		*	FUNCIONES AUXILIARES
		***************************************************************************************************/
		private function path($url) {
	        $uri = parse_url($url);
	        return $uri['path'];
   	 	}
   	 	private function query($url){
   	 		$uri = parse_url($url);
   	 		if(isset($uri['query']))
	        	return $uri['query'];
	        else
	        	return '';
   	 	}
   	 	private function serialize($array){
   	 		header('Content-type: application/json');
        	echo json_encode($array, JSON_PRETTY_PRINT);
   	 	}
	}
	//punto de entrada a la API (se pueden mover estas dos llamadas a otro archivo)
	$api = new ServerAPI;
	$api->serve();


	//NOTAS:

	//url alumnos post de ejemplo: http://localhost/AutoescuelaTrafico/api/alumnos?dni=12345678Q&nombre=Evaristo&apellidos=El+Listo&fNacimiento=1998-01-01&permiso=Permiso+A2

	//url alumnos delete de ejemplo: http://localhost/AutoescuelaTrafico/api/alumnos?dni=12345678Q

	//url prof post de ejemplo: http://localhost/AutoescuelaTrafico/api/profesores?dni=23456789A&nombre=Evaristo&apellidos=El+Profesor&fechaContrato=2018-01-21&telefono=123456789&salario=3000&nss=41+1234567890

	//url prof delete de ejemplo: http://localhost/AutoescuelaTrafico/api/profesores?dni=23456789A


?>