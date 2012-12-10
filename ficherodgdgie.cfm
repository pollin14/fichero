<cfapplication name="sisetic" sessionmanagement="yes">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Usuarios de la DGDGIE</title>
</head>
<body>

<table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1">
<tr>
<td>
<table width="100%" bgcolor="#DFE4F4" cellpadding="8">
<form action="guardarfichadgdgie.cfm" method="post" name="form2" id="form2" width="980">
<tr>
<td colspan="4" align="left"><b>Ingresar los datos de la Persona.</b></td>
</tr>
<tr>
<td width="21%" align="left"><font title="Nombre (S) Completo (S)">Nombre(s):&nbsp;&nbsp;</font></td>
<td width="37%" align="left"><input name="Nombre" type="text" class="micontrol" id="Nombre" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
<td width="9%" align="left"><font title="Apellido (S) Completo (S)">Apellidos:&nbsp;&nbsp;</font></td>
<td width="33%" align="left"><input name="Apellido" type="text" class="micontrol" id="Apellido" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
</tr>
<tr>
<td align="left" ><font title="Nombre de la Cuenta de Usuario (AC\...)">Nombre de Usuario:&nbsp;</font></td>
<td align="left" ><input name="Usuario" type="text" class="micontrol" id="Usuario" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
<td align="left" ><font title="Área o Depto Adscrit@">Área / Depto:&nbsp;</font></td>
<td align="left" ><input name="Depto" type="text" class="micontrol" id="Depto" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
</tr>
<tr>
<td align="left" ><font title="192.168.25. ">IP:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Piso" type="text" class="micontrol" id="Piso" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
<td align="left" ><font title="Indicar su Ext en caso de tener Teléfono o Fax">Ext:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Ext" type="text" class="micontrol" id="Ext" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
</tr>
<tr>
<td colspan="4" align="left"><b>Ingresar los datos del Equipo.</b></td>
</tr>
<tr>
<td align="left" >N/S CPU:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="CPU" type="text" class="micontrol" id="CPU" size="60"onKeyUp="this.value=this.value.toUpperCase();"/></td>
<td align="left" >N/S Monitor:&nbsp;&nbsp;</td>
<td align="left" ><input name="Monitor" type="text" class="micontrol" id="Monitor" size="60"onKeyUp="this.value=this.value.toUpperCase();"/></td>
</tr>
<tr>
<td align="left" >N/S Teclado:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Teclado" type="text" class="micontrol" id="Teclado" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
<td align="left" >N/S Mouse:&nbsp;&nbsp;</td>
<td align="left" ><input name="Mouse" type="text" class="micontrol" id="Mouse" size="60"onKeyUp="this.value=this.value.toUpperCase();"/></td>
</tr>
<tr>
<td align="left" >N/S UPS:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="UPS" type="text" class="micontrol" id="UPS" size="60"onKeyUp="this.value=this.value.toUpperCase();"/></td>
<td align="left" >Bocinas (S/N):&nbsp;&nbsp;</td>
<td align="left" ><input name="Bocinas" type="text" class="micontrol" id="Bocinas" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
</tr>
<td align="left" ><font title="Anotar sus Observaciones"><b>Comentarios:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Comentarios" type="text" class="micontrol" id="Comentarios" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
<tr align="center">
<td ></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><button id="Guardardgdgie" name="Guardardgdgie">&nbsp;&nbsp;&nbsp;Guardar&nbsp;&nbsp;&nbsp;</button></td>
</form>
</table>
</td>
</tr>
</table><br />
</body>
</html>