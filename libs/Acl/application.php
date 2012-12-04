<?php
function __autoload($class)
{
	$path=explode("_",$class);
	if(@include_once(APPLICATION_PATH."/".$path[0]."/".$path[1].".php"))
	{}
	else
		@include_once("/".$path[0]."/".$path[1].".php");
}

function _debug($data, $label=null)
{
	echo "<pre>".$label;
	print_r($data);
	echo "</pre>";
}