<?php
define('USERNAME', 'root');
define('PASS','');
define('HOST','localhost');
define('DBNAME','teste');
define('TYPEBD','mysql');

class Db{
private $conn, $table = 'users', $logfile = 'LogDb.txt' ;

function __construct(){
		$this->getConn();
	}
	
function getConn(){
	try{	
	if(is_null($this->conn)){
	$this->conn =  new PDO(TYPEBD.':host='.HOST.';dbname='.DBNAME.';charset=utf8', USERNAME,PASS, array(PDO::ATTR_PERSISTENT => true));	
	$this->conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    $this->conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
	}
	
	return $this->conn;
	}catch(Exception $e){	
	   $this->writeError($e);	
	}
}

public function setTable($table){
	$this->table = $table;
	}
	
function writeError($e){
	echo 'Erro -> ';
	$errorx = $e->getMessage();
    var_dump($errorx);	
	$fp = fopen($this->logfile, 'a');
	$write = fwrite($fp,date("d-m-Y H:i:s ").": Erro-> ");
	$write = fwrite($fp,$errorx.PHP_EOL.PHP_EOL);
	fclose($fp);
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
	$dt['read'] = '';
    foreach($indices as $ind){
	$dt['str'] .=$ind;
	$dt['qst'] .='?';
	$dt['cmb'] .= $ind.'=?';
	$dt['read'] .=$ind.'=?';
	
	if($num+1 < $count){ 
	$dt['str'] .=','; 
	$dt['qst'] .=',';
	$dt['cmb'] .=',';
	$dt['read'] .=' AND ';	
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
	
function prepareSql2($pdo, $dta,$dx){
	$count = $dx['count'];
	$count2 = count($dta);
	if($count == $count2){
      for($i = 0; $i < $count ; $i++){
		  $v = $i + 1 ;
		  $pdo = $this->getVarTp($v,$dta[$dx['ind'][$i]], $pdo); 
		}
	$pdo->execute();  
	}
	return $pdo;
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
		try{
		$data = array();
		$dados = $this->getConn()->prepare($sql);			
		if(trim($arg) <> '' ){   $dados = $this->getVarTp(1,  $arg, $dados);   }
		if(trim($arg2) <> '' ){  $dados = $this->getVarTp(2,  $arg2, $dados);   }
		if(trim($arg3) <> '' ){  $dados = $this->getVarTp(3,  $arg3, $dados);   }
		if(trim($arg4) <> '' ){  $dados = $this->getVarTp(4,  $arg4, $dados);    }
		if(trim($arg5) <> '' ){  $dados = $this->getVarTp(5,  $arg5, $dados);     }
		$dados->execute();
		$dados->setFetchMode(PDO::FETCH_ASSOC);
		$data['count'] = $dados->rowCount();
		$data['data'] = $dados->fetchAll();
		return $data;
		}catch(Exception $e){ $this->writeError($e);}
	}	
	
public function Create($data,$table = ''){
	try{
	$tab = trim($table) == '' ? $this->table : $table;
	$dt = $this->getStr($data);
	$sql = "INSERT INTO ".$tab."(".$dt['str'].") Values(".$dt['qst'].")";
	$pdo = $this->getConn()->prepare($sql);
	$this->prepareSql($pdo,$data,$dt);
	}catch(Exception $e){
		$this->writeError($e);	
		}
    }

public function Read($where = '', $table = '', $limit = "",$orderby = ""){
	try{
	$tab = trim($table) == '' ? $this->table : $table;
	$sql = "SELECT * FROM ".$tab;
	$sql = strip_tags(trim($where == ''))? $sql : $sql." WHERE ".$where.$limit.$orderby;
	$pdo = $this->getConn()->query($sql);
	$pdo->setFetchMode(PDO::FETCH_ASSOC);
	return $pdo->fetchAll();
	}catch(Exception $e){
		$this->writeError($e);	
		}
	}
	
public function ReadPdo($where = array(), $table = '', $limit = "",$orderby = ""){
	try{
	$tab = trim($table) == '' ? $this->table : $table;
	$sql = "SELECT * FROM ".$tab." ";
	//$sql .= (count($where) > 0)? " WHERE " : "";
	$strWher =  $this->getStr($where);
	$sql .= $strWher['read'];
	$sql .= ' '.$limit.' '.$orderby.' ';
	$pdo = $this->getConn()->prepare($sql);
	$pdo = $this->prepareSql2($pdo,$where,$strWher);
	$pdo->setFetchMode(PDO::FETCH_ASSOC);
	$dat = array();
	$dat['count'] = $pdo->rowCount();
	$dat['data'] = $pdo->fetchAll();
    return $dat;
	
	}catch(Exception $e){
		$this->writeError($e);	
		}
	}		
	
public function Update($id,$camp = 'id',$data,$table){
	try{
	$tab = trim($table) == '' ? $this->table : $table;
	$dt =  $this->getStr($data);
	$sql = "UPDATE ".$tab." SET ".$dt['cmb']." WHERE ".$camp."='".$id."'";
	$pdo = $this->getConn()->prepare($sql);
	$this->prepareSql($pdo,$data,$dt);
	}catch(Exception $e){
	$this->writeError($e);	
		}
	}
	
public function Delete($id, $camp='id', $table = ''){
	try{
	$tab = trim($table) == '' ? $this->table : $table;
	$sql = "DELETE FROM ".$tab." WHERE ".$camp."='".$id."'";
	$pdo = $this->getConn()->query($sql);
	}catch(Exception $e){
	$this->writeError($e);	
		}
	}	
}
