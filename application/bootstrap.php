<?php

class bootstrap
{
	private $config;
	protected $request;
	
	function __construct($config)
	{
		
		$this->config=Models_applicationModel::readConfig($config, APPLICATION_ENV);
		$this->_initSession();
		$this->_initDatabase();
		$this->_initRequest();

	}
	
	protected function _initSession()
	{
		session_start();
		$_SESSION['nameSpace']=array();		
	}
	
	protected function _initDatabase()
	{			
		$cnx=Models_mysqlModel::connect($this->config['database.server'],
				$this->config['database.db'],
				$this->config['database.user'],
				$this->config['database.password']
		);
		$_SESSION['register']['dbCnx']=$cnx;
	}
	
	protected function _initRequest()
	{		
		$url=explode("/",$_SERVER['REQUEST_URI']);
		if(isset($url[1]))
			$_GET['controller']=$url[1];
		if(isset($url[2]))
			$_GET['action']=$url[2];
	
		if(!isset($_GET['controller']))
			$_GET['controller']='index';
		else
		{
			if(file_exists($_SERVER['DOCUMENT_ROOT']."/".APPLICATION_PATH."/controllers/".$_GET['controller']."Controller.php"))
				$_GET['controller']=$_GET['controller'];
			else
			{
				$_GET['controller']='error';
				$_GET['action']='error404';
			}
		}
		
		if(!isset($_GET['action']))
			$_GET['action']='index';
		
		$this->request=array('controller'=>$_GET['controller'],
							'action'=>$_GET['action']);
		
	}
	
	function run()
	{
		$controller="Controllers_".$this->request['controller']."Controller";
		$class =  new $controller($this->config); 

		
		$action=$this->request['action']."Action";
		$class -> $action();
	}
}





