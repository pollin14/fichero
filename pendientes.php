<?php
header('content-type:text/html; encode=utf8');

require_once 'configuracion.php';
require_once 'funciones.php';

session_start();
$db = dameConexion();

$error = '';
$exito = '';
$query = '	
select 
	reg_llamadas.id_llamada,
	fichas.id_ficha,
	fichas.nombre as \'\',
	tipos_de_llamada.tipo as llamada,
	reg_llamadas.alta as fecha,
	usuarios.nombre as registro,
	reg_llamadas.notas
from 
	reg_llamadas 
	left join usuarios on ( reg_llamadas.id_asignacion = id_user ) 
		left join fichas using( id_ficha )
			left join tipos_de_llamada using( id_tipo_de_llamada )
where 
	status = 1;';

if ( isset( $_POST['id_llamada']) && isset( $_POST['id_usuario_resolvio'] )){
	
	$columna_valor = array();
	
	$id_llamada = sprintf('%d', $_POST['id_llamada']);
	unset($_POST['id_llamada']);
	
	foreach ($_POST as $key => $value) {
		array_push($columna_valor, $key . '="' . $db->real_escape_string($value) . '"');
	}
	
	$update = 'update reg_llamadas set ' . implode(',', $columna_valor ) . ' where id_llamada = ' . $id_llamada .';';

	if ( $db->query ($update) ){
		$exito = 'Llamada actualizada';
	}else{
		$error = 'Ups! No se pudo actualizar la llamada.';
	}
}

$llamadas = $db->query($query);
?>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/sisetic.css" />
		<link rel="shortcut icon" href="css/favicon.png" >
		<script>
			$(document).ready(function(){
				$('a[href="#"').bind('click',function(){
					
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
				<p class="error"><?php echo $error ?></p>
				<p class="exito"><?php echo $exito ?></p>
				<table class="center coloreada">
					<tr>
						<td>Accion</td><td>Datos de la Llamada</td>
					</tr>
					<?php while ($llamadas && $llamada = $llamadas->fetch_assoc()): ?>
						<tr>
							<td><a href="alta_de_ficha.php?id_ficha=
								<?php
								$id_llamada = $llamada['id_llamada'];
								$notas = $llamada['notas'];
								echo $llamada['id_ficha'];
								unset($llamada['id_ficha']);
								unset($llamada['id_llamada']);
								unset($llamada['notas']);
								?>">Consultar Ficha </a><br/>
							</td>
							<td><?php foreach ($llamada as $key => $val) : ?>
									<strong><?php echo estiliza($key) ?></strong> 
									<?php echo $val ?>
								<?php endforeach ?><br>
								<form action="pendientes.php" method="post">
									<input type="hidden" name="id_llamada" value="<?php echo $id_llamada?>">
									<input type="hidden" name="id_usuario_resolvio" value="<?php echo $_SESSION['id_usuario']?>">
									<table>
										<tr>
											<td><label for="status">Marcar como resuelta</label>
												</td>
											<td><input type="checkbox" value="0" name="status"></td>
										</tr>
										<tr>
											<td>Notas</td>
											<td><textarea name="notas"><?php echo $notas ?></textarea></td>
										</tr>
									</table>
									<input type="submit" value="Guardar">
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
