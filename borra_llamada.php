<?php

header('Content-type: text/html');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();
$db = dameConexion();


if (isset($_GET['id_llamada'])) {
	$delete = sprintf ('delete from reg_llamadas where id_llamada = %d;', $_GET['id_llamada']);	
	if( $db->query($delete)){
		echo "borrado";
	}else{
		echo "no borrado";
	}
}else{
	exit();
}



?>