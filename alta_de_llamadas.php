<?php
header('content-type:text/html; encode=utf8');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();

$error = '';
$exito = '';
$resuelta = 'null';

$db = dameConexion();

if ($_SESSION['id_usuario'] == 1) {
	$query1 = 'select id_usuario,nombre from usuarios;';
} else {
	$query1 = 'select id_usuario,nombre from usuarios where id_usuario <> 1;';
}

$usuarios_asig = $db->query($query1);

if (isset($_POST['nombre']) && isset($_POST['id_ficha'])) {

	unset($_POST['nombre']);

	if (($_POST['status'] == 'resuelte')) {
		$resuelta = 'now()';
		$_POST['id_usuario_resolvio'] = $_POST['id_asignacion'];
	} else {
		unset($_POST['resuelta']); // Default: 'pendiente'
		unset($_POST['id_usuario_resolvio']); //Default: null
	}

	$columnas = array('resuelta');
	$valores = array($resuelta);

	foreach ($_POST as $key => $val) {
		array_push($columnas, $key);
		array_push($valores, '"' . $db->real_escape_string($val) . '"');
	}

	$insert = 'insert into reg_llamadas (' . implode(',', $columnas) . ') 
		values (' . implode(',', $valores) . ');';

	if ($db->query($insert)) {
		$exito = 'Llamda guardada.';
	} else {
		$error = 'Ocurrió un problema al guardar la llamada.';
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
			
			function muestra_ficha(){
				
				$.ajax({
					type:'post',
					url:'busca_ficha.php',
					datatype: 'html',
					data: {nombre: $(this).val()},
					success: function(html){
						$('#ficha').html( html );
						if( $(html).find('#link').length == 1){ //respuesta positiva?
							$('form').find('input[type=submit]').removeProp('disabled');
						}
					}
				});
			}
			
			function concatena_nombre(){
				var tmp = $('form input[name=nombre]').val();
				tmp = encodeURI(tmp);
				$(this).attr('href', $(this).attr('href') + "?nombre=" + tmp);
			}
			
			function inhabilita(){
				$('form').find('input[type=submit]').prop('disabled',true);
			}
			
			//El widget de sujerencias.
			$(function() {
				$( "#alta_de_llamadas input[name=nombre]" ).autocomplete({
					source: "busca_nombre.php"
				});
			});
			
			$(document).ready(function(){
				$('form input[name=nombre]').bind('focusout', muestra_ficha);
				$('form input[name=nombre]').bind('focus',inhabilita);
				$('#crear_nueva_ficha').bind('click',concatena_nombre);
				$('#alta_de_llamdas').validate();
				$('.error, .exito').fadeOut(6000, function(){
					$(this).html('');
					$(this).fadeIn();
				})
			})
			
		</script>
        <title>SISETIC: Alta de Llamadas</title>
    </head>
    <body>
		<div id="wrapper">
			<div id="header"></div>
			<div id="menu"><?php include 'componentes/menu.php' ?></div>
			<div id="container">
				<h1>Alta de Llamadas </h1>
				
				<?php include 'componentes/exito_error.php' ?>
				
				<form action="alta_de_llamadas.php" method="post" id="alta_de_llamadas">
					<table class="center">
						<colgroup>
							<col class="labels">
							<col>
						</colgroup>
						<tr>
							<td>
								<label for="id_usuario_asignacion">Asignación de Llamada</label>
							</td>
							<td>
								<select name="id_usuario_asignacion">
									<?php while ($usuarios_asig && $usuario = $usuarios_asig->fetch_assoc()): ?>
										<option value="<?php echo $usuario['id_usuario'] ?>"><?php echo $usuario['nombre'] ?></option>
									<?php endwhile ?>
								</select>
							</td>
						</tr>
						<tr>
							<td>Tipo de Llamada</label></td>
							<td>
								<label for="tipo_de_llamada">Entrante</label>
								<input type="radio" name="tipo_de_llamada" checked value="entrante">
								<label for="tipo_de_llamada">Saliente</label>
								<input type="radio" name="tipo_de_llamada" value="saliente">
							</td>
						</tr>
						<tr>
							<td><label for="nombre">Persona Relacionada con la Llamada</label></td>
							<td>
								<input type="text" name="nombre" class="required">
								<a href="alta_de_ficha.php" id="crear_nueva_ficha" target="_blank">Crear nueva ficha</a>
							</td>
						</tr>
						<tr>
							<td><label for="status">Status</label></td>
							<td>
								<label for="status">Se concreto</label>
								<input type="radio" name="status" checked value="resuelta">
								<label for="status">No se concreto</label>
								<input type="radio" name="status" value="pendiente">
							</td>
						</tr>
						<tr>
							<td><label for="notas">notas</label></td>
							<td><textarea name="notas"></textarea></td>
						</tr>
						<tr>
							<td></td><td><input type="submit" value="Guardar" disabled></td>
						</tr>
					</table>
				</form>
				<div id="ficha">
				</div>
			</div>
			<div id="footer"></div>
		</div>
	</body>
</html>
