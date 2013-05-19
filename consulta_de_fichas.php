<?php
header('content-type:text/html; encode=utf8');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();

$formulario = array('nombre', 'instancia', 'correo');
$nombre = '';
$instancia = '';
$correo = '';
$exito = '';
$error = '';
$num_fichas = '';
$fichas = false; // cero fichas.
$post = false; // si es true la solicitud fue por post.
$columnas = array();

$db = dameConexion();

if (isset($_GET['id_ficha'])) {
	$delete = sprintf('delete from fichas where id_ficha = %d;', $_GET['id_ficha']);
	if ($db->query($delete)) {
		$exito = 'Ficha borrada.';
	} else {
		$error = 'No se pudo borrar la ficha.';
	}
} else {
	if (isset($_POST['nombre'])) {
		$nombre = $_POST['nombre'];
		$post = true;
	}

	if (isset($_POST['instancia'])) {
		$instancia = $_POST['instancia'];
		$post = true;
	}

	if (isset($_POST['correo'])) {
		$correo = $_POST['correo'];
		$post = true;
	}

	if ($post) {

		$query2 = 'show columns from fichas;';
		$cols = $db->query($query2);
		$field = $cols->fetch_assoc(); //quitamos el id
		array_push($columnas,'Accion'); // Actualizar o Borrar
		while ($field = $cols->fetch_assoc()) {
			array_push($columnas, estiliza($field['Field']));
		}

		$query1 = '
	select * from fichas 
	where 
		nombre like \'%' . $nombre . '%\' 
		and
		instancia like \'%' . $instancia . '%\' 
		and
		( correo_1 like \'%' . $correo . '%\' 
			or
		  correo_2 like \'%' . $correo . '%\'
		) 
	order by nombre;';

		$fichas = $db->query($query1);
		
		if( $fichas ){
			$num_fichas = $fichas->num_rows;
		}
	}
}
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/sisetic.css" />
		<link rel="shortcut icon" href="css/favicon.png" >
		<link rel="stylesheet" href="css/jquery-ui.css" />
		<script src="libs/js/jquery.js"></script>
		<script src="libs/js/jquery-v.js"></script>
		<script src="libs/js/jquery-ui.js"></script>
		<script>
			
			//El widget de sujerencias.
			$(function() {
				$( "form input[name=instancia]" ).autocomplete({
					source: "busca_instancia.php"
				});
				
				$( "form input[name=nombre]" ).autocomplete({
					source: "busca_nombre.php"
				});
			});
			
		</script>
        <title>SISETIC: Consulta de Ficha</title>
    </head>
    <body>
		<div id="wrapper">
			<div id="header"></div>
			<div id="menu"><?php include 'componentes/menu.php' ?></div>
			<div id="container">
				<h1>Consulta de Fichas </h1>
				
				<?php include 'componentes/exito_error.php'?>
				<form id="consulta_de_fichas" action="consulta_de_fichas.php" method="post">
					<table class="center">
						<colgroup>
							<col class="labels">
							<col>
						</colgroup>
						<tr><th colspan="2">Consultar de Fichas</th></tr>
						<?php foreach ($formulario as $value): ?>
							<tr>
								<td><label for="<?php echo $value ?>"><?php echo estiliza($value) ?> </label></td>
								<td><input type="text" value="" name="<?php echo $value ?>"></td>
							</tr>
						<?php endforeach; ?>
						<tr><td></td><td><input type="submit" value="Consultar"</td></tr>
					</table>
				</form>
				<h1>Resultados (<?php echo $num_fichas ?>)</h1>
				<div id="fichas">
					<table class="coloreada">
							<?php foreach ($columnas as $value): ?>
								<th><?php echo $value ?></th>
							<?php endforeach ?>
						</tr>

						<?php while ($fichas && $ficha = $fichas->fetch_row()): ?>
							<tr>
								<td><a href="alta_de_ficha.php?id_ficha=<?php echo $ficha[0] ?>" id="actualizar">
										actualizar
									</a>
									<a href="consulta_de_fichas.php?id_ficha=<?php echo $ficha[0] ?>" id="actualizar">
										borrar
									</a> 
								</td>
								<?php unset($ficha[0]); ?>
								<?php foreach ($ficha as $value): ?>
									<td><?php echo $value ?></td>
								<?php endforeach ?>
							</tr>
						<?php endwhile ?>

					</table>
				</div>
			</div>
			<div id="footer"></div>
		</div>
    </body>
</html>
