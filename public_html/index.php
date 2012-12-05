<?php

defined('APPLICATION_ENV')?:
	define ('APPLICATION_ENV', getenv('APPLICATION_ENV'));
	
defined('APPLICATION_PATH')?:
	define ('APPLICATION_PATH', '../application');

set_include_path(get_include_path().";".
				 $_SERVER['DOCUMENT_ROOT'].
				 "/../libs"
);

require("Acl/application.php");
	

require_once(APPLICATION_PATH."/bootstrap.php");
$config=APPLICATION_PATH."/configs/application.ini";

$bootstrap = new bootstrap($config);
$bootstrap->run();
