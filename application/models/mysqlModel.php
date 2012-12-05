<?php

class Models_mysqlModel
{
	public static $obj;
		
	public function __construct()
	{
		
	}
	public static function singleton()
	{
		if (!isset(self::$instance)) {
			$c = __CLASS__;
			self::$instance = new $c;
		}
	
		return self::$instance;
	}
	public static function initialize($config)
	{
		if(!isset($obj))
		{
			self::obj = self::connect($config['database.server'],
										$config['database.db'],
										$config['database.user'],
										$config['database.password']
						);
			return $this->obj;
		}	
		else
		{
			return $this->obj;
		}
			
	}
	static function connect($server, $database, $username, $password)
	{
		try
		{
			// Create connection to MYSQL database
			// Fourth true parameter will allow for multiple connections to be made
			$db_connection = mysql_connect ($server, $username, $password, true);
			mysql_select_db ($database);
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