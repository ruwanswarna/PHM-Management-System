<?php
    class Database{
        private $connection;
        private $serverName;
        private $username;
        private $password;
        private $dbName;

        public function __construct($serverName, $username, $password, $dbName) {
            $this->serverName = $serverName;
            $this->username = $username;
            $this->password = $password;
            $this->dbName = $dbName;

            try {
                $this->connection = new PDO("mysql:host=$this->serverName;dbname=$this->dbName", $this->username, $this->password);
                $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                echo "Connected successfully<br />";
            }
            catch(PDOException $e) {
                echo "Connection failed: ". $e->getMessage()."<br/>";
            }
        } //end constructor
        public function close(){
            $this->connection = null;
        }
    }


