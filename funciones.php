<?php

function dameConexion(){

	$db = new mysqli(HOST,USER,PASSWORD,DB);
	
	if(!$db) die ("Error al conectarse a la base de datos.");
	$db ->set_charset('utf8');
        
	return $db;
}

function administraSesion(){
    if(!isset($_SESSION['idUsuario'])){
        header('Location: index.php?pa="' . urlencode( $_SERVER['SCRIPT_NAME'] ));
        exit();
    }
}

function estiliza($subject){
	return ucwords( str_replace('_', ' ', $subject) );
}
?>
