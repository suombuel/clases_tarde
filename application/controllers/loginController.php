<?php 


// Inicializa 
$user=initializeUserArray();
$filename=$_SERVER['DOCUMENT_ROOT'].$config['users_filename'];

if(!isset($_GET['action']))
	$action='index';
else
	$action=$_GET['action'];

switch($action)
{
	case 'logout':
		session_destroy();
		header("location: /index");
		exit();		
	break;
	case 'login':
	case 'index':
	default:
		if($_POST)
		{
			$loggued=loginUser($cnx, $_POST);
			if($loggued)
			{
				header("location: /users");
				exit();
			}
			else
			{
				header("location: /login");
				exit();
			}
						
		}
		else
		{
			$content=renderView($config, array(), '/login/index');
		}
		
	break;
					
}

// Incluir Layout

echo renderLayout($config, array(), 'layout_login');







