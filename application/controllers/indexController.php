<?php

class Controllers_indexController
{
	protected $config;
	protected $layout;
	protected $content;
	
	public function __construct($config)
	{
		$this->config = $config;
		$this->layout = $this->config['layoutFrontend'];
		$this->view = new Acl_views();
		$this->content = null;
	}
	
	public function indexAction()
	{		
		$this->content=$this->view->renderView($this->config, array(), 'index/index');
	}
	
	public function __destruct()
	{
		$params=array('content'=>$this->content);
		echo $this->view->renderLayout($this->config, $params, $this->layout);
	}
	
}