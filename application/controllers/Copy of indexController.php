<?php


class Controllers_indexController
{
	protected $config;
	
	public function __construct($config)
	{
		$this->config=$config;
	}
	
	public function indexAction()
	{
		
		$view=new Acl_views();

		$content=$view->renderView($this->config, array(), '/index/index');
		$params=array('user'=>readUser($cnx, $_SESSION['userid']),
				'content'=>$content);
		echo renderLayout($config, $params, 'layout_admin2');
		
		
	}
}