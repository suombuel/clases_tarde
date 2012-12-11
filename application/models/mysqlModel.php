<?php

class Models_mysqlModel
{
	public static $instance;
	protected $cnx;
		
	private function __construct($config)
	{
		$this->cnx=$this->connect($config);
	}
	
	public static function singleton($config)
	{
		if (!isset(self::$instance)) {
			$c = __CLASS__;
			self::$instance = new $c($config);
		}
	
		return self::$instance;
	}
	
	protected function connect($config)
	{
		try
		{
			// Create connection to MYSQL database
			// Fourth true parameter will allow for multiple connections to be made
			$db_connection = mysql_connect ($config['database.server'], 
											$config['database.user'],
											$config['database.password'],
											true);
			mysql_select_db ($config['database.db']);
			if (!$db_connection)
			{
				throw new Exception('MySQL Connection Database Error: ' . mysql_error());
			}
			else
			{
				$CONNECTED = true;
			}
		}
		catch (Exception $e)
		{
			echo $e->getMessage();
		}
		return $db_connection;
	}
	
	public function disconnet($cnx)
	{
	
	}
	
	public function query($cnx, $sql)
	{
		$arrayQuery=array();
		try
		{
			$result=mysql_query($sql, $cnx);
			if (!$result)
			{
				throw new Exception('MySQL Query Error: ' . mysql_error());
			}
			else
			{
					
				if(!is_resource($result))
					$arrayQuery=$result;
				else
				{
					while ($row = mysql_fetch_array ($result, MYSQL_ASSOC))
					{
						$arrayQuery[]=$row;
					}
				}
			}
		}
		catch (Exception $e)
		{
			echo $e->getMessage();
		}
	
		return $arrayQuery;
	}
	
	
	
	
}