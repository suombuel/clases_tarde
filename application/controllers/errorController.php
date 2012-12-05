<?php 



class Controllers_errorController
{
	protected $config;

	public function __construct($config)
	{
		$this->config=$config;
	}
	
	public function indexAction()
	{
		
	}
	
	public function error404Action()
	{
		$view=new Acl_views();
		header("HTTP/1.0 404 Not Found");
		$content=$view->renderView($this->config, array(), 'error/index');
		$params=array('content'=>$content);
		echo $view->renderLayout($this->config, $params, 'layout_admin2');
				
	}
}


// Incluir Layout
// include_once("../application/layouts/layout_admin2.php");
