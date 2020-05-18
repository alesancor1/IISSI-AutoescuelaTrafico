<?php
 
class Paginator {
 		
 	private $_data;
    private $_limit;
    private $_page;
    private $_total;
 
	public function __construct($data) {
	     
	    $this->_data = $data;
	    $this->_total = sizeof($data);
	     
	}

	/*devuelve los datos cortados según el limite indicado*/
	public function getData( $limit = 10, $page = 1 ) {
     
	    $this->_limit = $limit;
	    $this->_page = $page;
	 
	    if ( $this->_limit == 'all' || $this->_limit >= sizeof($this->_data)) 
	        $results = $this->_data;   
	    else 
	        $results = array_slice($this->_data, $limit * $page, $limit); 
	 
	    $result         = new stdClass();
	    $result->page   = $this->_page;
	    $result->limit  = $this->_limit;
	    $result->total  = $this->_total;
	    $result->data   = $results;
	 
	    return $result;
	}

	/*botones y enlaces*/
	public function createLinks( $links, $list_class ) {
	    if ( $this->_limit == 'all' || $this->_limit >= sizeof($this->_data)) {
	        return '';
	    }
	 
	    $last       = ceil( $this->_total / $this->_limit )-1;
	    $start      = ( ( $this->_page - $links ) > 0 ) ? $this->_page - $links : 0;
	    $end        = ( ( $this->_page + $links ) < $last ) ? $this->_page + $links : $last;	 
	    $class      = ( $this->_page == 0 ) ? "disabled" : "";
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