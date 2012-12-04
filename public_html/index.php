<?php

defined('APPLICATION_ENV')?:
	define ('APPLICATION_ENV', getenv('APPLICATION_ENV'));

defined('APPLICATION_PATH')?:
	define ('APPLICATION_PATH', '../application');
	
function __autoload($class)
{
	$path=explode("_",$class);
	include_once(APPLICATION_PATH."/".$path[0]."/".$path[1].".php");	
}	

function _debug($data, $label=null)
{
	echo "<pre>".$label;
	print_r($data);
	echo "</pre>";
}


	
require_once(APPLICATION_PATH."/bootstrap.php");
$config=APPLICATION_PATH."/configs/application.ini";

$bootstrap = new bootstrap($config);
$bootstrap->run();