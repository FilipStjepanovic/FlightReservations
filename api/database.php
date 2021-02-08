<?php
class Database {
	private $hostname = "localhost";
	private $username = "root";
	private $password = "";
	private $dbname = "letovi";
	private $dblink;
	private $result = true;
	private $records;
	private $affectedRows;


	function __construct($dbname)
	{
		$this->$dbname = $dbname;
		$this->Connect();
	}

	public function getResult()
	{
		return $this->result;
	}

	function __destruct()
	{
		$this->dblink->close();
	}


	function Connect()
	{
		$this->dblink = new mysqli($this->hostname, $this->username, $this->password, $this->dbname);
		if($this->dblink->connect_errno)
		{
			printf("Konekcija neuspesna: %s\n",  $mysqli->connect_error);
			exit();
		}
		$this->dblink->set_charset("utf8");
	}

	function noviLet($data) {
		$mysqli = new mysqli("localhost", "root", "", "letovi");
		$mestoOd = mysqli_real_escape_string($mysqli,$data["mestoOd"]);
		$mestoDo = mysqli_real_escape_string($mysqli,$data["mestoDo"]);
		$klasa = mysqli_real_escape_string($mysqli,$data["klasa"]);
		$cena = mysqli_real_escape_string($mysqli,$data["cena"]);
		$sql = "INSERT INTO let (mestoOd,mestoDo,klasa,cena) VALUES ('$mestoOd','$mestoDo','$klasa','$cena')";

		if($mysqli->query($sql))
		{
			$this ->result = true;
		}
		else
		{
			$this->result = false;
		}
		$mysqli->close();
	}


		function ubaciKorisnika($data) {
			$mysqli = new mysqli("localhost", "root", "", "letovi");
			$cols = '(name, username, password, admin, telephone)';

			$name = mysqli_real_escape_string($mysqli,$data['name']);
			$username = mysqli_real_escape_string($mysqli,$data['username']);
			$password = mysqli_real_escape_string($mysqli,$data['password']);
			$telephone = mysqli_real_escape_string($mysqli,$data['telephone']);

			$query = "INSERT into user (name, username, password, admin, telefon) VALUES ('$name','$username','$password','0','$telephone')";

			if($mysqli->query($query))
			{
				$this ->result = true;
			}
			else
			{
				$this->result = false;
			}
			$mysqli->close();
		}

	function sviLetovi() {
		$mysqli = new mysqli("localhost", "root", "", "letovi");
		$q = 'SELECT * FROM let l join klasa k on (l.klasa=k.idKlase)';
		$this ->result = $mysqli->query($q);
		$mysqli->close();
	}

	function sveKlase() {
		$mysqli = new mysqli("localhost", "root", "", "letovi");
		$q = 'SELECT * FROM klasa';
		$this ->result = $mysqli->query($q);
		$mysqli->close();
	}


	function ExecuteQuery($query)
	{
		if($this->result = $this->dblink->query($query)){
			if (isset($this->result->num_rows)) $this->records         = $this->result->num_rows;
				if (isset($this->dblink->affected_rows)) $this->affected        = $this->dblink->affected_rows;
					return true;
		}
		else{
			return false;
		}
	}
}
?>
