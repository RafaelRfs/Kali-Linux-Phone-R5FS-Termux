<?php
$wrd = "abc123456";
$pass = "cab241356";
echo "\n[+] Senha de Teste:".$pass;
echo "\n[+] Wordlist da palavra: ".$wrd;
$count = strlen($wrd);
$comb = $count;
$num = 1;
$values = array();
$fat = 1;
for($i = $count; $i > 0 ; $i--){
$fat *=$i;
}
for($i = $fat; $i  > 0; $i--){
$val = str_shuffle($wrd);
while(in_array($val, $values)){
$val = str_shuffle($wrd);
}
if($val == $pass){
echo "\n[+]".$i." Attempts {Password Cracked}  => ".$val."\n\n";
die();
}
$values[] = $val;
}
var_dump($values);



