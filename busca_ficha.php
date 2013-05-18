<?php
header('Content-type: text/html');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();
$db = dameConexion();

$actualizable = isset($_POST['actualizable']);

if (isset($_GET['id_ficha'])) {
	$where = sprintf("id_ficha = %d limit 1", $_GET['id_ficha']);
} else {
	$nombre = $db->real_escape_string($_POST['nombre']);
	$where = 'x.nombre = "' . $nombre . '" limit 1';
}

$query = '
	select 
		x.id_ficha,
		x.nombre,
		x.instancia,
		x.cargo,
		x.casa,
		x.correo_1,
		x.correo_2,
		x.correo_asistente,
		x.domicilio,
		x.ext,
		x.ext_asistente,
		x.fax,
		y.nombre as "Entidad Federativa",
		x.movil,
		x.nextel,
		x.nombre_asistente,
		x.otros,
		x.telefono,
		x.telefono_asistente,
		x.web_site
	from 
		fichas as x
			left join entidades_federativas as y using(id_entidad_federativa)
	where ' . $where . ';';

$result = $db->query($query);
$id_ficha = -1;
$columnas = array();
$ficha = array();

if ($result) {
	$columnas = $result->fetch_fields();
	$ficha = $result->fetch_row();
	if ($result->num_rows == 0) {
		exit();
	}
	$id_ficha = $ficha[0];
	array_shift($columnas); //Eliminamos el id
	array_shift($ficha);
}

$len = count($columnas);
?>

<!-- Esta campo se envia en el formulario principal de alta_de_llamadas" (html5) -->
<input type="hidden" value="<?php echo $id_ficha ?>" name="id_ficha" form="alta_de_llamada">

<table class="center coloreada">
	<tr>
		<th colspan="2">Ficha de la Persona Relacionada</th>
	</tr>
	<?php for ($i = 0; $i < $len; $i++): ?>
		<tr><td><?php echo $columnas[$i]->name ?></td><td><?php echo $ficha[$i] ?></td></tr>
	<?php endfor ?>
	<?php if ($actualizable): ?>
		<tr><td></td><td><a id="link" href="alta_de_ficha.php?id_ficha=<?php echo $id_ficha ?>" title="Actualizar Ficha">Actualizar Ficha</a></td> </tr>
	<?php endif ?>
</table>
