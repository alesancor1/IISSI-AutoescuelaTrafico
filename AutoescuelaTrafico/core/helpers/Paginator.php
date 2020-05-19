<?php
 
class Paginator {
 		
    private $_limit; //numero de elementos de cada pagina
    private $_page;  //pagina actual en la que estoy
    private $_total; //total de filas de la consulta

    public $_start; //primer elemento de la pagina
    public $_end;   //ultimo elemento de la pagina
 	
 	/*constructor*/
	public function __construct() {
		$this->_limit = null;
		$this->_page = null;
		$this->_total = null;
	}

	/*metodo que setea los atributos*/
	public function __init($model){
		$this->_total = $model->rows();
		$this->_limit = isset($_GET["limit"]) ? (int)$_GET["limit"] : 2;
		$this->_page = isset($_GET["page"]) ? (int)$_GET["page"] : 1;

		$this->_start = ($this->_page-1)*($this->_limit) + 1;
		$this->_end = $this->_page * $this->_limit;

		if($this->_page < 1) $this->_page = 1;
		if($this->_limit < 0) $this->_limit = 10;
	}

	/*botones y enlaces*/
	public function createLinks( $links, $list_class ) {
	    if ( $this->_limit == 'all' || $this->_limit >= $this->_total) {
	        return '';
	    }
	 
	    $last       = ceil( $this->_total / $this->_limit );
	    $start      = ( ( $this->_page - $links ) > 0 ) ? $this->_page - $links : 1;
	    $end        = ( ( $this->_page + $links ) < $last ) ? $this->_page + $links : $last;	 
	    $class      = ( $this->_page == 1 ) ? "disabled" : "";
  	    $html       = '<ul class="' . $list_class . '">';

  	    $uri = '';
	    if(isset($_GET["controller"]))
	    	$uri .= "?controller=" . $_GET["controller"];
	    if(isset($_GET["action"]))
	    	$uri .= "&action=" . $_GET["action"];

	    /*boton de atras*/
	    $html.= '<li class="'.$class.'"><a href="'.$uri.'&limit='.$this->_limit.'&page='.( $this->_page - 1 ).'">&laquo;</a></li>';
	 	
	 	/*numero actual*/
	    if ( $start > 1 ) {
	        $html   .= '<li><a href="'.$uri.'&limit=' . $this->_limit . '&page=1"> 1 </a> </li>';
	        $html   .= '<li class="disabled"><span>...</span></li>';
	    }
	 	
	    /*otros numeros*/
	    for ( $i = $start ; $i <= $end; $i++ ) {
	        $class  = ( $this->_page == $i ) ? "active" : "";
	        $html   .= '<li class="' . $class . '"><a href="'.$uri.'&limit=' . $this->_limit . '&page=' . $i . '">' . $i . '</a></li>';
	    }
	 	
	 	/*ultima pagina*/
	    if ( $end < $last ) {
	        $html   .= '<li class="disabled"><span>...</span></li>';
	        $html   .= '<li><a href="'.$uri.'&limit=' . $this->_limit . '&page=' . $last . '">' . $last . '</a></li>';
	    }
	 	
	 	/*boton de adelante*/
	    $class      = ( $this->_page == $last ) ? "disabled" : "";
	    $html       .= '<li class="' . $class . '"><a href="'.$uri.'&limit=' . $this->_limit . '&page=' . ( $this->_page + 1 ) . '">&raquo;</a></li>';
	 
	    $html       .= '</ul>';
	 
	    return $html;
	}
}