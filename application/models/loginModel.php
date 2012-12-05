<?php

class Models_loginModel 
{
	protected $cnx;
		
	public function __construct()
	{
		$this->cnx=$_SESSION['register']['dbCnx'];;
	}
	
	
	function loginUser($data)
	{
		$sql="SELECT idusers, name, email
			FROM users
			WHERE email='".$data['email']."' AND
					password='".$data['password']."'";
		$arrayUser=query($this->cnx,$sql);
	
		if(count($arrayUser)==1)
		{
			session_regenerate_id();
			$_SESSION['userid']=$arrayUser[0]['idusers'];
			return TRUE;
		}
		else
			return FALSE;
	
	}
}