<?php

class Acl_views
{
	public function renderView($config, array $params, $view)
	{
		ob_start();
		include($config['views_directory']."/".$view.".php");
		$content=ob_get_contents();
		ob_end_clean();
		return $content;
	}
	
	public function renderLayout($config, array $params, $layout)
	{
		ob_start();
		include($config['layout_directory']."/".$layout.".php");
		// Incluir Layout
		$content=ob_get_contents();
		ob_end_clean();
		return $content;
	}
}
