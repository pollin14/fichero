<?php

function dameConexion() {

	$db = new mysqli(HOST, USER, PASSWORD, DB);

	if (!$db)
		die("Error al conectarse a la base de datos.");
	$db->set_charset('utf8');

	return $db;
}

function administraSesion() {
	session_start();
	if (!isset($_SESSION['id_usuario'])) {
		header('Location: index.php?pa=' . urlencode($_SERVER['PHP_SELF']));
		exit();
	}
}

function estiliza($subject) {
	return ucwords(str_replace('_', ' ', $subject));
}

function fechaValida($strDate, $format = ['y', 'm', 'd'], $ex = '/') {
	$valid = false;
	if (is_array($format) &&
			count($format) == 3 &&
			count(explode($ex, $strDate)) == 3) {
		$date = array_combine($format, explode($ex, $strDate));
		if (intval($date['m']) && intval($date['d']) && intval($date['y'])) {
			$m = $date['m'];
			$d = $date['d'];
			$y = $date['y'];
			$valid = checkdate($m, $d, $y);
		}
	}
	return $valid;
}

function debug($var){
	echo '<pre>';
	print_r($var);
	echo '</pre>';
}

?>
