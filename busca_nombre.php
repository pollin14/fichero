<?php
header('Content-type: text/json');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();
$db = dameConexion();

if( !isset($_GET['term'])){
	exit();
}

$nombre = $db->real_escape_string($_GET['term']);

$query = "select nombre from fichas where nombre like '%". $nombre . "%' order by nombre limit 10;";

$result = $db->query( $query );

$suggestions = array();

while ($result && $row = $result->fetch_row()){
	 array_push($suggestions, '"' . $row[0] .'"');
}

echo '[' . implode(",",$suggestions) . "]";

?>