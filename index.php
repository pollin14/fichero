<?php
header('Content-Type: text/html; charset=UTF-8');
require_once 'configuracion.php';
require_once 'funciones.php';


$error = "";

session_start();

if (isset($_SESSION['id_usuario'])) {
	header('location: alta_de_llamadas.php');
}


//redireccion a la pagina que se solicito.
if (isset($_GET['pa'])) {
	$pa = "?pa=" . urlencode( $_GET['pa'] );
} else {
	$pa = '';
}

if (isset($_POST['usuario']) &&
		isset($_POST['password'])) {

	$usuario = $_POST['usuario'];
	$contraseña = $_POST['password'];
	$db = dameConexion();

	$query = sprintf("select id_user 
	from usuarios where usr='%s' and pwd ='%s';", $usuario, $contraseña);
	$result = $db->query($query);

	if (!$result) {
		$error = "Ocurrió un problema al conectarse con la base de datos.";
	} else {

		if ($result->num_rows == 0) {
			$error = 'El usuario o la constraseña son incorrecta.';
		} else {
			$row = $result->fetch_row();

			$_SESSION['id_usuario'] = $row[0];
			$_SESSION['error'] = '';
			$_SESSION['exito'] = '';

			if (isset($_GET['pa'])) {
				$dir = $_GET['pa'];
			} else {
				$dir = 'alta_de_llamadas.php';
			}
			
			header('location: ' . $dir);
		}
	}
}
?>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Sistema de Registro de Llamadas DGDGIE</title>
		<link rel="stylesheet" type="text/css" href="css/sisetic.css" />
	</head>
	<body>

		<div id="wrapper">
			<div id="header"></div>
			<div id="container">
				<form id="login" method="post" action="index.php<?php echo $pa ?>" >
					<table class="center">
						<tr>
							<th colspan="2">Inicio de Sesión</th>
						</tr>
						<tr>
							<td class="error"><?php echo $error ?></td>
						</tr>
						<tr id="usuario">
							<td>
								<label for="nickname">Usuario: </label>
								<input type="text" name="usuario" autofocus autocomplete="false"/>
							</td>
						</tr>
						<tr id="password">
							<td colspan="2"><label for="password">Contraseña: </label><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td><input type="submit" id="entrar" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="footer"></div>
		</div>

	</body>
</html>
