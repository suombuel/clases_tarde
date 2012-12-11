<?php 
class Controllers_loginController
{
	protected $config;
	protected $layout;
	protected $content;
	protected $model;
	protected $cnx;

	public function __construct($config)
	{
		$this->config = $config;
		$this->layout = $this->config['layoutLogin'];
		$this->view = new Acl_views();
		$this->content = null;
		$this->model = new Models_loginModel();		
	}

	public function indexAction()
	{
		
	}
	
	public function loginAction()
	{
		_debug($_POST);

		if($_POST)
		{
			$loggued=$this->model->loginUser($_POST);
			if($loggued)
			{
				header("location: /users");
				exit();
			}
			else
			{
				header("location: /login/login");
				exit();
			}
		
		}
		else
		{
			$this->content=$this->view->renderView($this->config, array(), '/login/login');
		}
	}
	
	public function logoutAction()
	{
		session_destroy();
		header("location: /index");
		exit();
	}

	public function __destruct()
	{
		$params=array('content'=>$this->content);
		echo $this->view->renderLayout($this->config, $params, $this->layout);
	}

}


