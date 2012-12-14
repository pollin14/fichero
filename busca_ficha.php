<?php
header('Content-type: text/html');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();
$db = dameConexion();

if( !isset( $_POST['nombre'] )){
	exit();
}

$nombre = $db->real_escape_string($_POST['nombre']);

$query = 'select * from fichas where nombre = "'. $nombre . '" limit 1;';

$result = $db->query( $query );
$columnas = array();
$ficha = array();

if( $result ){
	$columnas = $result->fetch_fields();
	$ficha = $result->fetch_row();
	if( $result->num_rows == 0){
		exit();
	}
}

$len = count($columnas);
?>
<table class="center coloreada">
	<tr>
		<th colspan="2">Ficha de la Persona Relacionada</th>
	</tr>
<?php for($i=0 ; $i< $len; $i++):?>
	<tr><td><?php echo $columnas[$i]->name?></td><td><?php echo $ficha[$i] ?></td></tr>
<?php endfor?>
	<tr><td></td><td><a href="alta_de_ficha.php?id_ficha=<?php echo $ficha[0]?>" title="Actualizar Ficha">Actualizar Ficha</a> 
</table>
<!-- Esta campo se envia en el formulario principal de alta_de_llamadas" (html5) -->
<input type="hidden" value="<?php echo $ficha[0]?>" name="id_ficha" form="alta_de_llamadas">
