<?php

class Models_applicationModel 
{
	/**
	 * Read config file
	 * @param string $filename config filename
	 * @return array config array
	 */
	static function readConfig($filename, $section)
	{
		$config=array();
		$config=parse_ini_file($filename, true);
		$keys=array_keys($config);
		foreach($keys as $value)
		{
			$realKeys=explode(':',$value);
			if($section==$realKeys[0])
				if(isset($realKeys[1]))
				$arraySalida=array_merge(
						$config[$realKeys[1]],
						$config[$realKeys[0].":".
						$realKeys[1]]
				);
			else
				$arraySalida=$config[$realKeys[0]];
		}
		return 	$arraySalida;
	}
}