<?php
header('content-type:text/html; encode=utf8');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();

$db = dameConexion();

$error = '';
$exito = '';
$query = '	
select 
	reg_llamadas.id_llamada,
	fichas.id_ficha,
	fichas.nombre as \'\',
	reg_llamadas.alta as fecha,
	reg_llamadas.tipo_de_llamada,
	usuarios.nombre as registro,
	reg_llamadas.notas
from 
	reg_llamadas 
	left join usuarios on ( reg_llamadas.id_usuario_asignacion = id_usuario ) 
		left join fichas using( id_ficha )
where 
	status = "pendiente";';

if (isset($_POST['id_llamada']) && isset($_POST['id_usuario_resolvio'])) {

	$columna_valor = array();

	$id_llamada = sprintf('%d', $_POST['id_llamada']);
	unset($_POST['id_llamada']);

	foreach ($_POST as $key => $value) {
		array_push($columna_valor, $key . '="' . $db->real_escape_string($value) . '"');
	}

	$update = 'update reg_llamadas set ' . implode(',', $columna_valor) . ' where id_llamada = ' . $id_llamada . ';';

	if ($db->query($update)) {
		$exito = 'Llamada actualizada';
	} else {
		$error = 'No se pudo actualizar la llamada.';
	}
}

$llamadas = $db->query($query);
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/sisetic.css" />
		<link rel="shortcut icon" href="css/favicon.png">
		<script src="libs/js/jquery.js"></script>
		<script>
			//			var cache = new Array();
			
			$(document).ready(function(){
				
				//Asignación de eventos.
				$('#pendientes').on('click','a.ficha',function(){
					
					//Ocultamos todas las demas fichas.
					//					while( cache.length > 0){
					//						cache.pop().hide('slow');
					//					}
					
					var id= $(this).attr('rel');
					var tmp = $('#' + id );
					//					cache.push(tmp);
					tmp.addClass('loading');
					tmp.load($(this).attr('href'),function(){
						$(this).removeClass('loading');
					});
					
					return false;
				});
				
				$('#pendientes').on('click','a.borrar',function(){
					//					$(this).parent().parent().parent().hide('slide');
					//					console.log($(this).parent().parent().parent() );
					var borrable = confirm('¿Estás seguro que quieres borrar esta llamada pendiente permanentemente?')
					if( borrable ){
						var $self = $(this);
						$.ajax({
							url: $(this).attr('href'),
							datatype: 'text',
							success: function(text){
								if(text == 'borrado'){	
									$self.parent().parent().parent().hide();
								}else{
									$(this).
										siblings('div').
										html( '<p class="error"> No se pudo borrar la llamada pendiente</p>').
										fadeOut('slow');
								}
							}
						});
					}
					
					return false;
				})
			})
		</script>
        <title>SISETIC: Pendientes</title>
    </head>
    <body>
		<div id="wrapper">
			<div id="header"></div>
			<div id="menu"><?php include 'componentes/menu.php' ?></div>
			<div id="container">
				<h1>Pendientes</h1>
				<table class="center coloreada" id="pendientes">
					<tr>
						<td>Accion</td><td>Datos de la Llamada</td>
					</tr>
					<?php while ($llamadas && $llamada = $llamadas->fetch_assoc()): ?>
						<?php $idHash = rand(0, 1000); ?>
						<tr>
							<td>
								<div>
									<a class="ficha" 
									   rel="<?php echo $idHash ?>" 
									   href="busca_ficha.php?id_ficha=<?php
									   $id_llamada = $llamada['id_llamada'];
									   $notas = $llamada['notas'];
									   echo $llamada['id_ficha'];
									   unset($llamada['id_ficha']);
									   unset($llamada['id_llamada']);
									   unset($llamada['notas']);
									   ?>">Consultar Ficha </a><br><br>
									<a class="borrar" href="borra_llamada.php?id_llamada=<?php echo $id_llamada ?>">Borrar llamada</a>
								</div>
							</td>
							<td>

								<?php foreach ($llamada as $key => $val) : ?>
									<strong><?php echo estiliza($key) ?></strong> 
									<?php echo $val ?>
								<?php endforeach ?>
								<br>
								<form action="pendientes.php" method="post">
									<input type="hidden" name="id_llamada" value="<?php echo $id_llamada ?>">
									<input type="hidden" name="id_usuario_resolvio" value="<?php echo $_SESSION['id_usuario'] ?>">
									<table>
										<tr>
											<td><label for="status">Marcar como resuelta</label>
											</td>
											<td><input type="checkbox" value="resuelta" name="status"></td>
											<td rowspan="3"><div id="<?php echo $idHash ?>" class="ficha_flotante"></div></td>
										</tr>
										<tr>
											<td>Notas</td>
											<td><textarea name="notas"><?php echo $notas ?></textarea></td>
										</tr>
										<tr>
											<td colspan="2">
												<input type="submit" value="Guardar">
											</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
					<?php endwhile ?>
				</table>
			</div>
			<div id="footer"></div>
		</div>
    </body>
</html>
