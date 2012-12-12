<?php
header('Content-type: text/json');

require_once 'configuracion.php';
require_once 'funciones.php';

$db = dameConexion();

$instancia = $db->real_escape_string($_GET['term']);

$query = "select instancia from fichas where instancia like '%". $instancia . "%' order by instancia limit 10;";

$result = $db->query( $query );

$suggestions = array();

while ($result && $row = $result->fetch_row()){
	 array_push($suggestions, '"' . $row[0] .'"');
}

echo '[' . implode(",",$suggestions) . "]";

?>
