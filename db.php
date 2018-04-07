<?php
define('USERNAME', 'postgres');
define('PASS','postgres');
define('HOST','localhost');
define('DBNAME','postgres');
define('TYPEBD','pgsql');

class Db{
	
private $conn, $table = 'users' ;

function __construct(){
	$this->getConn();
	}
	
function getConn(){
	if(is_null($this->conn)){
	$this->conn =  new PDO(TYPEBD.':host='.HOST.';dbname='.DBNAME, USER,PASS, array(PDO::ATTR_PERSISTENT => true));	
	}
	return $this->conn;
}
	
public function setTable($table){
	$this->table = $table;
	}
	
public function getTable(){ return $this->table;}

private function getStr($data){
	$dt =  array();
	$indices = array_keys($data);
	$dt['ind'] = $indices;
	$count = count($indices);
	$dt['count'] = $count; 
    $num = 0;
    $dt['str'] = '';
	$dt['qst'] = '';
    $dt['cmb'] = '';
    foreach($indices as $ind){
	$dt['str'] .=$ind;
	$dt['qst'] .='?';
	$dt['cmb'] .= $ind.'=?';
	if($num+1 < $count){ 
	$dt['str'] .=','; 
	$dt['qst'] .=',';
	$dt['cmb'] .=',';
	}
	$num++;
	}//Fecha o Foreach
	return $dt;
	}

function prepareSql($pdo, $dta,$dx){
	$count = $dx['count'];
	$count2 = count($dta);
	if($count == $count2){
      for($i = 0; $i < $count ; $i++){
		  $v = $i + 1 ;
		  $pdo = $this->getVarTp($v,$dta[$dx['ind'][$i]], $pdo);
		  
		}
	$pdo->execute();  
	}
	}	
	
function getVarTp($indice,  $value, $pdo){
	$tp_data = gettype($value);
	switch($tp_data){
		case "integer":
		$pdo->bindValue($indice, $value, PDO::PARAM_INT );
		break;
	
		case "string":
		$pdo->bindValue($indice, $value, PDO::PARAM_STR );
		break;
			
		case "NULL":
		$pdo->bindValue($indice, $value, PDO::PARAM_NULL );
		break;
		
		case "":
		$pdo->bindValue($indice, $value, PDO::PARAM_NULL );
		break;
		
		case "double":
		$pdo->bindValue($indice, $value, PDO::PARAM_STR );
		break;
		
		case "boolean":
		$pdo->bindValue($indice, $value, PDO::PARAM_BOOL);
		break;
	
		default:
		$pdo->bindValue($indice, $value, PDO::PARAM_STR );		
	}
	return $pdo;
}	
		
function Prepare($sql,$arg = '',$arg2 = '',$arg3='',$arg4='',$arg5 = ''){
		$data = array();
		$dados = $this->getConn()->prepare($sql);	
		if(trim($arg) <> '' ){  $dados->bindValue(1,$arg,PDO::PARAM_STR);     }
		if(trim($arg2) <> '' ){  $dados->bindValue(2,$arg2,PDO::PARAM_STR);     }
		if(trim($arg3) <> '' ){  $dados->bindValue(3,$arg3,PDO::PARAM_STR);     }
		if(trim($arg4) <> '' ){  $dados->bindValue(4,$arg4,PDO::PARAM_STR);     }
		if(trim($arg5) <> '' ){  $dados->bindValue(5,$arg5,PDO::PARAM_STR);     }
		$dados->execute();
		$dados->setFetchMode(PDO::FETCH_ASSOC);
		$data['count'] = $dados->rowCount();
		$data['data'] = $dados->fetchAll();
		return $data;
	}	
	
public function Create($data,$table = ''){
	$tab = trim($table) == '' ? $this->table : $table;
	$dt = $this->getStr($data);
	$sql = 'INSERT INTO '.$tab.'('.$dt['str'].') Values('.$dt['qst'].')';
	$pdo = $this->getConn()->prepare($sql);
	$this->prepareSql($pdo,$data,$dt);
    }

public function Read($where = '', $table = ''){
	$tab = trim($table) == '' ? $this->table : $table;
	$sql = 'SELECT * FROM '.$tab;
	$sql = strip_tags(trim($where == ''))? $sql : $sql.' WHERE '.$where;
	$pdo = $this->getConn()->query($sql);
	$pdo->setFetchMode(PDO::FETCH_ASSOC);
	return $pdo->fetchAll();
	}
	
public function Update($id,$camp = 'id',$data,$table){
	$tab = trim($table) == '' ? $this->table : $table;
	$dt =  $this->getStr($data);
	$sql = 'UPDATE '.$tab.' SET '.$dt['cmb'].' WHERE '.$camp.'='.$id;
	$pdo = $this->getConn()->prepare($sql);
	$this->prepareSql($pdo,$data,$dt);
	}
	
public function Delete($id, $camp='id', $table = ''){
	$tab = trim($table) == '' ? $this->table : $table;
	$sql = 'DELETE FROM '.$tab.' WHERE '.$camp.'='.$id;
	$pdo = $this->getConn()->query($sql);
	}	

}//Fecha a classe de banco de dados
