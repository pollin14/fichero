<?php
header('content-type:text/html; encode=utf8');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();

$exito = '';
$error = '';
$num_fichas = '';
$condicion1 = '1=1';
$condicion2 = '1=1';
$fichas = false; // cero fichas.
$post = false; // si es true la solicitud fue por post.
$columnas = array();

$db = dameConexion();


if (isset($_POST['fecha_inicial'])) {

	if (fechaValida($_POST['fecha_inicial'])) {
		$fi = $db->real_escape_string($_POST['fecha_inicial']);
		$condicion1 = 'alta > "' . $fi .'"';
	}else if($_POST['fecha_inicial'] != ''){
		$error = "Fecha Inicial invalida. Se omite esta condicion.<br>";
	}

	$post = true;
}

if (isset($_POST['fecha_final'])) {

	if (fechaValida($_POST['fecha_final'])) {
		$fe = $db->real_escape_string($_POST['fecha_final']);
		//le sumamos un dia a la fecha para que nos incluya las fichas
		//que sean iguales a la fecha pasada. (menor igual no funciona)
		$condicion2 = 'alta <= date_add("' . $fe .'",interval 1 day)';
	}else if($_POST['fecha_final'] != ''){
		$error .= "Fecha Final invalida. Se omite esta condicion.";
	}

	$post = true;
}

if (isset($_POST['palabra_clave'])) {
	$palabra_clave = $_POST['palabra_clave'];
	$post = true;
}

if ($post) {
	
	$columnas = [
		'Nombre',
		'Notas',
		'Fecha de Alta',
		'Fecha de Resolucion',
		'status','Tipo de Llamada', 
		'Persona que Asigno',
		'Persona que Resolvio'];
	$query1 = '
select 
	reg_llamadas.id_llamada,
	fichas.nombre,
	reg_llamadas.notas,
	reg_llamadas.alta as "fecha de alta",
	reg_llamadas.resuelta as "fecha de resolucion",
	reg_llamadas.status,
	tipos_de_llamada.tipo as "tipo de llamada",
	x.nombre as "persona que asigno",
	usuarios.nombre as "persona que resolvio"
from 
		reg_llamadas
			left join fichas using(id_ficha)
				left join usuarios on (id_usuario_resolvio = usuarios.id_user)					
					left join tipos_de_llamada using(id_tipo_de_llamada)
						left join usuarios as x on (reg_llamadas.id_asignacion = x.id_user)
where
	(fichas.nombre like \'%' . $palabra_clave . '%\'
		or
	reg_llamadas.notas like \'%' . $palabra_clave . '%\')
	and ' . $condicion1 . '
	and ' . $condicion2 . '
	order by nombre;';

	$fichas = $db->query($query1);

	if ($fichas) {
		$num_fichas = $fichas->num_rows;
	}
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/sisetic.css" />
		<link rel="shortcut icon" href="css/favicon.png" >
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
		<script src="js/jquery.js"></script>
		<script src="js/jquery-v.js"></script>
		<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
		<script>
			$(function() {
				$( ".datepicker" ).datepicker({
					dateFormat: "yy/mm/dd",
					dayNames: ['Domingo','Lunes','Miércoles','Jueves','Viernes', 'Sábado'],
					dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
					monthNames: [
						"Enero", 
						"Febrero", 
						"Marzo", 
						"Abril", 
						"Mayo", 
						"Junio", 
						"Julio", 
						"Agosto", 
						"Septiembre", 
						"Octubre", 
						"Noviembre", 
						"Diciembre"]
				});
			});
		</script>
        <title>SISETIC: Historial de Llamadas</title>
    </head>
    <body>
		<div id="wrapper">
			<div id="header"></div>
			<div id="menu"><?php include 'componentes/menu.php' ?></div>
			<div id="container">
				<h1>Historial de Llamadas</h1>
				<p class="error"><?php echo $error ?></p>
				<p class="exito"><?php echo $exito ?></p>
				<form id="consulta_de_fichas" action="historico_de_llamadas.php" method="post">
					<table class="center">
						<colgroup>
							<col class="labels">
							<col>
						</colgroup>
						<tr><th colspan="2">Consultar Llamadas</th></tr>
						<tr><td>Fecha Inicial</td><td><input type="text" class="datepicker" name="fecha_inicial"></td></tr>
						<tr><td>Fecha Final</td><td><input type="text" class="datepicker" name="fecha_final"></td></tr>
						<tr><td>Palabra Clave</td><td><input type="text" name="palabra_clave" placeholder="Un nombre y/o asunto"></td></tr>
						<tr><td></td><td><input type="submit" value="Consultar"</td></tr>
					</table>
				</form>
					<h1>Resultados (<?php echo $num_fichas ?>)</h1>
					<table class="center coloreada">
						<tr>
						<?php foreach ($columnas as $value): ?>
							<th><?php echo $value ?></th>
						<?php endforeach ?>
						</tr>

						<?php while ($fichas && $ficha = $fichas->fetch_row()): ?>
							<tr>
								<?php unset($ficha[0]); ?>
								<?php foreach ($ficha as $value): ?>
									<td><?php echo $value ?></td>
								<?php endforeach ?>
							</tr>
						<?php endwhile ?>

					</table>
			</div>
			<div id="footer"></div>
		</div>
    </body>
</html>
