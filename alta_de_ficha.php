<?php
header('content-type:text/html; encode=utf8');

require_once 'configuracion.php';
require_once 'funciones.php';

administraSesion();
$db = dameConexion();

$query1 = 'select id_entidad_federativa, nombre from entidades_federativas order by id_entidad_federativa;';
$query2 = 'show columns from fichas;';

$entidades = $db->query($query1);

$input_id_ficha = ''; //cuando se actualice una ficha este input sera puesto en el formulario.
$error = '';
$exito = '';
$accion_submit = 'Guardar';
$id_ent_fed = -1;

//inicializamos los datos del fichero a campos vacios.
//si no estamos actualizando, todos los campos de captura se tendran
//un valor vacio. En caso contrario se llenaran con sus correspondientes
//valores.
$result = $db->query($query2);
while ($result && $row = $result->fetch_assoc()) {
	$f[$row['Field']] = '';
}

if (isset($_GET['nombre'])) {
	if (!isset($_POST['nombre'])) {
		$f['nombre'] = $_GET['nombre'];
	}
}

if (isset($_GET['id_ficha'])) { //actualizamos
	if (isset($_POST['id_ficha'])) {//actualizacion
		$id = sprintf('%d', $_POST['id_ficha']);
		$columna_valor = array();

		foreach ($_POST as $key => $value) {
			array_push($columna_valor, $key . '="' . $db->real_escape_string($value) . '"');
		}

		$update = sprintf('update fichas set ' . implode(',', $columna_valor) . ' where id_ficha = %d;', $id);

		if (!$db->query($update)) {
			$error = 'Ocurrió un problema al actualizar la ficha.';
		} else {
			$exito = 'Ficha actualizada.';
		}
	} else {
		$accion_submit = 'Actualizar';
		$input_id_ficha = '<input type="hidden" name="id_ficha" value="' . $_GET['id_ficha'] . '">';
		$query = sprintf('select * from fichas where id_ficha = %d;', $_GET['id_ficha']);
		$fichas = $db->query($query);

		if ($fichas->num_rows == 0) {
			$error = 'La ficha no existe.';
		} else {
			$campos = $fichas->fetch_fields();
			$ficha = $fichas->fetch_assoc();
			$id_ent_fed = $ficha['id_entidad_federativa'];
			foreach ($campos as $value) {
				$f[$value->name] = $ficha[$value->name];
			}
		}
	}
} else {//Guardamos una nueva ficha
	if (isset($_POST['nombre'])) {
		$columnas = array();
		$valores = array();

		foreach ($_POST as $key => $value) {
			array_push($columnas, $key);
			array_push($valores, "\"" . $db->real_escape_string($value) . "\"");
		}

		$insert = 'insert into fichas (' . implode(',', $columnas) . ') values (' . implode(',', $valores) . ');';
		echo $insert;

		if (!$db->query($insert)) {
			$error = "No se pudo guardar la nueva ficha.";
		} else {
			$exito = 'Ficha guardada.';
		}
	}
}
?>

<h1>Alta de Ficha</h1>

<?php include 'componentes/exito_error.php' ?>
<form name="alta_de_ficha" id="alta_de_ficha" action="<?php echo $_SERVER['PHP_SELF'] . '?' . $_SERVER['QUERY_STRING'] ?>" method="post">
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
			<th colspan="2">Ingresar los datos de la persona.</th>
		</tr>
		<tr>
			<td><label for="nombre" title="Puede ser nombre COMPLETO o PARCIAL">Nombre:</label></td>
			<td>
				<input 
					class="required"
					name="nombre" 

					type="text" 
					value="<?php echo $f['nombre'] ?>">
			</td>
			<td><label for="entidad_federativa" title="Puede ser nombre COMPLETO o PARCIAL">Entidad Federativa:</label></td>
			<td>
				<select name="id_entidad_federativa" >
					<!-- Esta seleccionado el id de la entidad federativa -->
					<?php while ($entidades && $entidad = $entidades->fetch_row()): ?>
						<option value="<?php echo $entidad[0] ?>"  
						<?php if ($entidad[0] == $id_ent_fed): ?>
							<?php echo 'selected'; ?>
						<?php endif ?>
								><?php echo $entidad[1] ?>
						</option>
					<?php endwhile ?>
				</select>
			</td>
		</tr>
		<tr>
			<td><label for="instancia" title="Puede ser nombre COMPLETO o PARCIAL">Instancia:</label></td>
			<td id="instancia">
				<input 
					name="instancia"
					type="text"
					value="<?php echo $f['instancia'] ?>">
				<div class="sugerencias"></div>
			</td>
			<td><label for="domicilio" title="Puede ser nombre COMPLETO o PARCIAL">Domicilio:</label></td>
			<td>
				<input 
					name="domicilio"
					type="text"
					value="<?php echo $f['domicilio'] ?>">
			</td>
		</tr>
		<tr>
			<td><label for="cargo" title="Puede ser nombre COMPLETO o PARCIAL">Cargo:</label></td>
			<td><input 
					name="cargo" 
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
			<td><label for="casa">Casa:</label></td>
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
			<th colspan="2">Datos del Enlace.</th>
		</tr>
		<tr>
			<td><label for="nombre1" title="Puede ser nombre COMPLETO o PARCIAL">Nombre(s):</label></td>
			<td><input 
					name="nombre_asistente" 
					type="text" 
					value="<?php echo $f['nombre_asistente'] ?>">
			</td>
			<td><label for="correo_asistente">Correo:</label></td>
			<td><input name="correo_asistente" type="text" value="<?php echo $f['correo_asistente'] ?>" class="email"></td>
		<tr>
			<td><label for="telefono_asistente">Teléfono:</label></td>
			<td><input name="telefono_asistente" type="text" value="<?php echo $f['telefono_asistente'] ?>"></td>
			<td><label for="ext_asistente">Ext:</label></td>
			<td><input name="ext_asistente" type="text" value="<?php echo $f['ext_asistente'] ?>"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td><input type="submit" value="<?php echo $accion_submit ?>"></td>
		</tr>
		</tbody>
	</table>
</form>

