<?php


class Controllers_indexController
{
	protected $config;
	
	public function __construct($config)
	{
		$this->config=$config;
		$this->layout=$this->config['layoutFrontend'];
	}
	
	public function indexAction()
	{
		
		$view=new Acl_views();
		$content=$view->renderView($this->config, array(), 'index/index');
		$params=array('content'=>$content);
		echo $view->renderLayout($this->config, $params, $this->layout);
	}
	
}