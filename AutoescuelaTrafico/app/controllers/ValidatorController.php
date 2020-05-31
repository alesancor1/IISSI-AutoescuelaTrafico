<?php
class ValidatorController extends BaseController{

	/*Llama a la función que valida los formularios*/
	public function validate(){
		Validator::validate();
	}
}
/* EL OBJETIVO DE ESTE CONTROLADOR ES PREVENIR
   QUE UNA VISTA (EL USUARIO) PUEDA ACCEDER
   DIRECTAMENTE AL VALIDATOR, UBICADO EN EL CORE */

?>