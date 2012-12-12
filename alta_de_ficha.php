<?php
header('content-type:text/html; encode=utf8');

require_once 'configuracion.php';
require_once 'funciones.php';

$db = dameConexion();

$query1 = 'select * from ent_fed order by nombre;';
$query2 = 'show columns from fichas;';

$entidades = $db->query($query1);

$input_id_ficha = ''; //cuando se actualice una ficha este input sera puesto en el formulario.
$error = '';
$exito = '';
$accion_submit = 'Guardar';

//inicializamos los datos del fichero a campos vacios.
//si no estamos actualizando, todos los campos de captura se tendran
//un valor vacio. En caso contrario se llenaran con sus correspondientes
//valores.
$result = $db->query($query2);
while ($result && $row = $result->fetch_assoc()) {
	$f[$row['Field']] = '';
}


if (isset($_POST['id_ficha'])) {//actualizacion
	$id = sprintf('%d', $_POST['id_ficha']);
	$columna_valor = array();

	$tmp_entidad = $_POST['ent_fed'];
	unset($_POST['ent_fed']);
	unset($_POST['submit']);

	foreach ($_POST as $key => $value) {
		array_push($columna_valor, $key . '="' . $db->real_escape_string($value) . '"');
	}

	$update = 'update fichas set ' . implode(',', $columna_valor) . ', ent_fed = ' . $tmp_entidad . ' where id_ficha = ' . $id . ';';

	if ( !$db->query($update)) {
		$error = 'Ups! ocurrio un problema al actualizar la ficha.';
	} else {
		$exito = 'Ficha actualizada.';
	}
} else {//Actualizar los siguientes datos.
	if (isset($_GET['id_ficha'])) {
		$accion_submit = 'Actualizar';
		$input_id_ficha = '<input type="hidden" name="id_ficha" value="' . $_GET['id_ficha'] . '">';
		$query = sprintf('select * from fichas where id_ficha = %d;', $_GET['id_ficha']);
		$fichas = $db->query($query);

		if ($fichas->num_rows == 0) {
			$error = 'La ficha no existe.';
		} else {
			$campos = $fichas->fetch_fields();
			$ficha = $fichas->fetch_assoc();
			foreach ($campos as $value) {
				$f[$value->name] = $ficha[$value->name];
			}
		}
	} else {//Guardamos una nueva ficha
		if (isset($_POST['nombre'])) {
			$columnas = array();
			$valores = array();

			unset($_POST['submit']); //submit button
			
			foreach ($_POST as $key => $value) {
				array_push($columnas, $key);
				array_push($valores, "\"" . $db->real_escape_string($value) . "\"");
			}

			if (!$db->query($insert)) {
				$error = "Ups! No se pudo guardar la nueva ficha.";
			} else {
				$exito = 'Ficha guarda.';
			}
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
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
		<script src="js/jquery.js"></script>
		<script src="js/jquery-v.js"></script>
		<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
		<script>
			
			//El widget de sujerencias de instancias.
			$(function() {
				$( "#instancia input" ).autocomplete({
					source: "busca_instancia.php"
				});
			});
			
			$(document).ready(function(){
				$('#alta_de_ficha').validate();
			})
		</script>
        <title>SISETIC: Alta de Ficha</title>
    </head>
    <body>
		<div id="wrapper">
			<div id="header"></div>
			<div id="container">
				<div id="menu"><?php include 'componentes/menu.php' ?></div>
				<div>
					<p class="error"><?php echo $error ?></p>
					<p class="exito"><?php echo $exito ?></p>
					<form name="alta_de_ficha" id="alta_de_ficha" action="alta_de_ficha.php" method="post">
						<?php echo $input_id_ficha ?>
						<table class="center">
							<tbody>
							<colgroup>
								<col class="labels">
								<col>
								<col class="labels">
								<col>
							</colgroup>
							<tr>
								<td colspan="3"><h2>Ingresar los datos de la persona.</h2></td>
							</tr>
							<tr>
								<td><label for="nombre" title="Puede ser nombre COMPLETO o PARCIAL">Nombre:</label></td>
								<td>
									<input 
										class="required"
										name="nombre" 
										onkeyup="this.value=this.value.toUpperCase();" 
										type="text" 
										value="<?php echo $f['nombre'] ?>">
								</td>
								<td><label for="ent_fed" title="Puede ser nombre COMPLETO o PARCIAL">Entidad Federativa:</label></td>
								<td>
									<select name="ent_fed">
										<?php while ($entidades && $entidad = $entidades->fetch_assoc()): ?>
											<option value="<?php echo $entidad['id_ent_fed'] ?>"><?php echo $entidad['nombre'] ?></option>
										<?php endwhile ?>
									</select>
								</td>
							</tr>
							<tr>
								<td><label for="instancia" title="Puede ser nombre COMPLETO o PARCIAL">Instancia:</label></td>
								<td id="instancia">
									<input 
										name="instancia"
										onkeyup="this.value=this.value.toUpperCase();" 
										type="text"
										value="<?php echo $f['instancia'] ?>">
									<div class="sugerencias"></div>
								</td>
								<td><label for="domicilio" title="Puede ser nombre COMPLETO o PARCIAL">Domicilio:</label></td>
								<td>
									<input 
										name="domicilio"
										onkeyup="this.value=this.value.toUpperCase();" 
										type="text"
										value="<?php echo $f['domicilio'] ?>">
								</td>
							</tr>
							<tr>
								<td><label for="cargo" title="Puede ser nombre COMPLETO o PARCIAL">Cargo:</label></td>
								<td><input 
										name="cargo" 
										onkeyup="this.value=this.value.toUpperCase();" 
										type="text"
										value="<?php echo $f['cargo'] ?>">
								</td>
							</tr>
							<tr>
								<td><label for="telefono">Teléfono:</label></td>
								<td><input name="telefono" type="text" value="<?php echo $f['telefono'] ?>"> </td>
								<td><label for="ext">Ext:</label></td>
								<td><input name="ext" type="text" value="<?php echo $f['ext'] ?>"></td>
							</tr>
							<tr>
								<td><label for="fac">Fax:</label></td>
								<td><input name="fax" type="text" value="<?php echo $f['fax'] ?>"></td>
								<td><label for="movil">Móvil:</label></td>
								<td><input name="movil" type="text" value="<?php echo $f['movil'] ?>"></td>
							</tr>
							<tr>
								<td><label for="casa">Casa:</lable></td>
								<td><input name="casa" type="text" value="<?php echo $f['casa'] ?>"></td>
								<td><label for="nextel">Nextel:</label></td>
								<td><input name="nextel" type="text" value="<?php echo $f['nextel'] ?>"></td>
							</tr>
							<tr>
								<td><label for="otros">Otros:</label></td>
								<td><input name="otros" type="text" value="<?php echo $f['otros'] ?>"></td>
							</tr>
							<tr>
								<td><label for="correo_1">Correo 1:</label></td>
								<td><input name="correo_1" type="text" value="<?php echo $f['correo_1'] ?>" class="email"></td>
								<td><label for="correo_2">Correo 2:</label></td>
								<td><input name="correo_2" type="text" value="<?php echo $f['correo_2'] ?>" class="email"></td>
							</tr>
							<tr>
								<td><label for="web_site">WebSite:</label></td>
								<td><input name="web_site" type="text" value="<?php echo $f['web_site'] ?>"></td>
							</tr>
							<tr>
								<td colspan="2"><h2>Datos del Enlace.</h2></th>
							</tr>
							<tr>
								<td><label for="nombre1" title="Puede ser nombre COMPLETO o PARCIAL">Nombre(s):</label></td>
								<td><input 
										name="nom_asist" 
										onkeyup="this.value=this.value.toUpperCase();" 
										type="text" 
										value="<?php echo $f['nom_asist'] ?>">
								</td>
								<td><label for="correo_asist">Correo:</label></td>
								<td><input name="correo_asist" type="text" value="<?php echo $f['correo_asist'] ?>" class="email"></td>
							<tr>
								<td><label for="telefono_asist">Teléfono:</label></td>
								<td><input name="telefono_asist" type="text" value="<?php echo $f['telefono_asist'] ?>"></td>
								<td><label for="ext_asist">Ext:</label></td>
								<td><input name="ext_asist" type="text" value="<?php echo $f['ext_asist'] ?>"></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td class="submit"><input type="submit" name="submit" value="<?php echo $accion_submit ?>"></td>
							</tr>
							</tbody>
						</table>
					</form>
				</div>

			</div>
			<div id="footer"></div>
		</div>
    </body>
</html>
