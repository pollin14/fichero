<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="css/sisetic.css" />
		<link rel="shortcut icon" href="css/favicon.png" >
        <title>SISETIC: Alta de Ficha</title>
    </head>
    <body>
		<div id="wrapper">
			<div id="header"></div>
			<div id="container">
				<div id="menu"><?php include 'componentes/menu.php' ?></div>
				<div id="alta_de_ficha">
					
					<table class="center">
					<tbody>
						<colgroup>
							<col class="labels"></col>
							<col></col>
							<col class="lables"></col>
							<col></col>
						</colgroup>
						<tr>
							<td colspan="3"><h2>Ingresar los datos de la persona.</h2></td>
						</tr>
						<tr>
							<td><lable for="nombre" title="Puede ser nombre COMPLETO o PARCIAL">Nombre(s):</label></td>
							<td><input name="nombre" id="nombre" onkeyup="this.value=this.value.toUpperCase();" type="text"></td>
							<td><label for="apellidos" title="Puede ser nombre COMPLETO o PARCIAL">Apellidos:</label></td>
							<td><input name="apellido" id="apellido" onkeyup="this.value=this.value.toUpperCase();" type="text"></td>
						</tr>
						<tr>
							<td><label for="instancia" title="Puede ser nombre COMPLETO o PARCIAL">Instancia:</label></td>
							<td><input name="instancia" id="instancia" onkeyup="this.value=this.value.toUpperCase();" type="text"></td>
							<td><label for="domicilio" title="Puede ser nombre COMPLETO o PARCIAL">Domicilio:</label></td>
							<td><input name="domicilio" id="Domicilio" onkeyup="this.value=this.value.toUpperCase();" type="text"></td>
						</tr>
						<tr>
							<td><lable for="entidad_federativa" title="Puede ser nombre COMPLETO o PARCIAL">Entidad Federativa:</label></td>
							<td><input name="entidad_federativa" id="entidad_federativa" onkeyup="this.value=this.value.toUpperCase();" type="text"></td>
							<td><label for="cargo" title="Puede ser nombre COMPLETO o PARCIAL">Cargo:</label></td>
							<td><input name="cargo" id="cargo" onkeyup="this.value=this.value.toUpperCase();" type="text"></td>
						</tr>
						<tr>
							<td><label for="telefono1">Teléfono:</label></td>
							<td><input name="telefono1" id="telefono" type="text"></td>
							<td><label for="extension1">Ext:</label></td>
							<td><input name="extension1" id="extension" type="text"></td>
						</tr>
						<tr>
							<td><label for="fac">Fax:</label></td>
							<td><input name="fax" id="fax" type="text"></td>
							<td><label for="movil">Móvil:</label></td>
							<td><input name="movil" id="movil" type="text"></td>
						</tr>
						<tr>
							<td><label for="casa">Casa:</lable></td>
							<td><input name="casa" id="casa" type="text"></td>
							<td><label for="nextel">Nextel:</label></td>
							<td><input name="next" id="next" type="text"></td>
						</tr>
						<tr>
							<td><label for="otros">Otros:</label></td>
							<td><input name="otros" id="otros" type="text"></td>
						</tr>
						<tr>
							<td><label for="correo1">Correo 1:</label></td>
							<td><input name="correo1" id="Correo1" type="text"></td>
							<td><label for="correo2">Correo 2:</label></td>
							<td><input name="correo2" id="Correo2" type="text"></td>
						</tr>
						<tr>
							<td><label for="website">WebSite:</label></td>
							<td><input name="website" id="WebSite" type="text"></td>
						</tr>
						<tr>
							<td colspan="2"><h2>Datos del Enlace.</h2></th>
						</tr>
						<tr>
							<td title="Puede ser nombre COMPLETO o PARCIAL">Nombre(s):</td>
							<td><input name="nombre1" id="Nombre1" onkeyup="this.value=this.value.toUpperCase();" type="text"></td>
							<td title="Puede ser nombre COMPLETO o PARCIAL">Apellidos:</td>
							<td><input name="apellido1" id="Apellido1"  onkeyup="this.value=this.value.toUpperCase();" type="text"></td>
						</tr>
						<tr>
							<td>Teléfono:</td>
							<td><input name="telefono2" id="Telefono1" type="text"></td>
							<td>Ext:</td>
							<td><input name="extension2"  id="Ext" type="text"></td>
						</tr>
						<tr>
							<td>Correo:</td>
							<td><input name="correo"  id="Correo" type="text"></td>
						</tr>
						<tr>
							<td colspan="4" class="submit"><input type="submit" name="guardar" value="Guardar"/></td>
						</tr>
					</tbody>
					</table>
				</div>

			</div>
			<div id="footer"></div>
		</div>
    </body>
</html>
