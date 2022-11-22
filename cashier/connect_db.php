<?php
ob_start();

date_default_timezone_set('Asia/Singapore');

$baseurl="https://pet-clinic.accenzo.site/";
if(session_status()==PHP_SESSION_NONE){
    session_start(); 
}
try{
	$pdo = new pdo("mysql:host=localhost;dbname=accenzos_pet_clinic","accenzos_pet_clinic","xWZ11@eC9{kv");
}catch(Exception $e){
	//var_dump($e->getMessage());

}

?>
