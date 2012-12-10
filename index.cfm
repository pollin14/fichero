<cfapplication name="sisetic" sessionmanagement="yes">
	<cfset SESSION.login ="si"/>
	<cfset SESSION.tipo = 1/>
	<cfset SESSION.usuario = 'victor'/>
	<cfset SESSION.nombre = 'victor'/>
	<cfset SESSION.inicio = '1'/>
<!---<cfset StructDelete(SESSION,"login")>
<cfset StructDelete(SESSION,"tipo")>
<cfset StructDelete(SESSION,"usuario")>
<cfset StructDelete(SESSION,"nombre")>
<cfset StructDelete(SESSION,"inicio")>--->

<cfif IsDefined('url.Pasa')>
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
		<title>Sistema de registro de llamadas DGDGIE</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="sisetic.css"/>
		
		</head>
		<body>
		<table border="0" cellpadding="0" cellspacing="0" width="990" align="center">
			<tr>
				<td width="5" bgcolor="#FFFFFF"></td>
				<td width="980"><img name="index_r1_c1" src="img/index_r1_c1.jpg" width="980" height="100" border="0" id="index_r1_c1" alt="" /></td>
				<td width="5" bgcolor="#FFFFFF"></td>
			</tr>
			<tr height="18">
				<td width="5" bgcolor="#FFFFFF"></td>
				<td width="980" align="left" valign="top" bgcolor="#FFFFFF"></td>
				<td width="5" bgcolor="#FFFFFF"></td>
			</tr>
			<tr height="600" valign="top">
				<td width="5" bgcolor="#FFFFFF"></td>
				<td bgcolor="#FFFFFF">
		
			<p>&nbsp;</p>
            <p align="center"><img src="img/stop.gif" alt="alto" width="65" height="65" border="0" /><br />El nombre de usuario y/o la contrase&ntilde;a son incorrectos. Intente nuevamente</p>
			<p>&nbsp;</p>
		
			  <form action="controlpanel.cfm" id="login" name="form" method="post">
				
			  <table width="30%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr align="center" height="25">
				  <td width="7" height="30" bgcolor="#336699"></td>
				  <td colspan="3" bgcolor="#336699"><font color="#000000">Inicio de sesi&oacute;n</font></td>
				  <td width="7" bgcolor="#336699"></td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7" height="22"></td>
				  <td height="22"></td>
				  <td width="10" height="22"></td>
				  <td height="22"></td>
				  <td width="7" height="22"></td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7">&nbsp;</td>
				  <td align="right">Usuario:</td>
				  <td width="10">&nbsp;</td>
				  <td><input name="usuario" type="text" class="micontrol" id="usuario" size="20" maxlength="15" /></td>
				  <td width="7">&nbsp;</td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7" height="15"></td>
				  <td height="15"></td>
				  <td width="10" height="15"></td>
				  <td height="15"></td>
				  <td width="7" height="15"></td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7">&nbsp;</td>
				  <td align="right">Contrase&ntilde;a:</td>
				  <td width="10">&nbsp;</td>
				  <td><input name="contrasena" type="password" class="micontrol" id="contrasena" size="20" maxlength="15" /></td>
				  <td width="7">&nbsp;</td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7" height="10"></td>
				  <td height="10"></td>
				  <td width="10" height="10"></td>
				  <td height="10"></td>
				  <td width="7" height="10"></td>
				</tr>
				<tr bgcolor="#DFE4F4" valign="top" height="30">
				  <td width="7">&nbsp;</td>
				  <td>&nbsp;</td>
				  <td width="10">&nbsp;</td>
				  <td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  		<input name="Entrar" type="submit" id="Entrar" value="Entrar" /></td>
<cfset SESSION.inicio=1>
			    </tr>
				<tr>
				  <td width="7" height="6"><img src="img/form_bottom_izq.gif" width="7" height="6" border="0" /></td>
				  <td height="6" bgcolor="#DFE4F4"></td>
				  <td width="10" height="6" bgcolor="#DFE4F4"></td>
				  <td height="6" bgcolor="#DFE4F4"></td>
				  <td width="7" height="6"><img src="img/form_bottom_der.gif" width="7" height="6" border="0" /></td>
				</tr>
				<tr>
				  <td width="7" height="8"><img src="img/form_reflex_izq.gif" width="7" height="8" border="0" /></td>
				  <td height="8" background="img/fondo_reflex_center.gif"></td>
				  <td width="10" height="8" background="img/fondo_reflex_center.gif"></td>
				  <td height="8" background="img/fondo_reflex_center.gif"></td>
				  <td width="7" height="8"><img src="img/form_reflex_der.gif" width="7" height="8" border="0" /></td>
				</tr>
			  </table>
			  </form>
		
		
		
		
		
			  </td>
				<td width="5" bgcolor="#FFFFFF"></td>
			</tr>
		  <tr>
			  <td width="5" bgcolor="#FFFFFF"></td>
				<td background="img/footer.png" align="right">
			  <img src="img/footer.png" width="980" height="46" alt="footer" /></td>
				<td width="5" bgcolor="#FFFFFF"></td>
		  </tr>
		</table>
		</body>
		</html>
<cfelse>
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
		<title>Sistema de registro de llamadas DGDGIE</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="sisetic.css"/>
		
		</head>
		<body>
		<table border="0" cellpadding="0" cellspacing="0" width="990" align="center">
			<tr>
				<td width="5" bgcolor="#FFFFFF"></td>
				<td width="980"><img name="index_r1_c1" src="img/index_r1_c1.jpg" width="980" height="95" border="0" id="index_r1_c1" alt="" /></td>
				<td width="5" bgcolor="#FFFFFF"></td>
			</tr>
			<tr height="18">
				<td width="5" bgcolor="#FFFFFF"></td>
				<td width="980" align="left" valign="top" bgcolor="#FFFFFF"></td>
				<td width="5" bgcolor="#FFFFFF"></td>
			</tr>
			<tr height="600" valign="middle">
				<td width="5" bgcolor="#FFFFFF"></td>
				<td bgcolor="#FFFFFF">
		
		
		
		
			  <form action="controlpanel.cfm" id="login" name="form" method="post">
			  <table width="30%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr align="center" height="25">
				  <td width="7" height="30"></td>
				  <td colspan="3"></td>
				  <td width="7" height="30"></td>
				</tr>
				<tr align="center" height="25">
				  <td width="7" height="30" bgcolor="#336699"></td>
				  <td colspan="3" bgcolor="#336699"><font color="#000000">Inicio de sesi&oacute;n</font></td>
				  <td width="7" height="30" bgcolor="#336699"></td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7" height="22"></td>
				  <td height="22"></td>
				  <td width="10" height="22"></td>
				  <td height="22"></td>
				  <td width="7" height="22"></td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7">&nbsp;</td>
				  <td align="right">Usuario:</td>
				  <td width="10">&nbsp;</td>
				  <td><input name="usuario" type="text" class="micontrol" id="usuario" size="20" maxlength="15" /></td>
				  <td width="7">&nbsp;</td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7" height="15"></td>
				  <td height="15"></td>
				  <td width="10" height="15"></td>
				  <td height="15"></td>
				  <td width="7" height="15"></td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7">&nbsp;</td>
				  <td align="right">Contrase&ntilde;a:</td>
				  <td width="10">&nbsp;</td>
				  <td><input name="contrasena" type="password" class="micontrol" id="contrasena" size="20" maxlength="15" /></td>
				  <td width="7">&nbsp;</td>
				</tr>
				<tr bgcolor="#DFE4F4">
				  <td width="7" height="10"></td>
				  <td height="10"></td>
				  <td width="10" height="10"></td>
				  <td height="10"></td>
				  <td width="7" height="10"></td>
				</tr>
				<tr bgcolor="#DFE4F4" valign="top" height="30">
				  <td width="7">&nbsp;</td>
				  <td>&nbsp;</td>
				  <td width="10">&nbsp;</td>
				  <td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  		<input name="Entrar" type="submit" id="Entrar" value="Entrar" /></td>
<cfset SESSION.inicio=1>
				  </tr>
				<tr>
				  <td width="7" height="6" bgcolor="#DFE4F4"></td>
				  <td height="6" bgcolor="#DFE4F4"></td>
				  <td width="10" height="6" bgcolor="#DFE4F4"></td>
				  <td height="6" bgcolor="#DFE4F4"></td>
				  <td width="7" height="6" bgcolor="#DFE4F4"></td>
				</tr>
				<tr>
				  <td width="7" height="8"><img src="img/form_reflex_izq.gif" width="7" height="8" border="0" /></td>
				  <td height="8" background="img/fondo_reflex_center.gif"></td>
				  <td width="10" height="8" background="img/fondo_reflex_center.gif"></td>
				  <td height="8" background="img/fondo_reflex_center.gif"></td>
				  <td width="7" height="8"><img src="img/form_reflex_der.gif" width="7" height="8" border="0" /></td>
				</tr>
			  </table>
			  </form>
		
		<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
		
		
		
				</td>
				<td width="5" bgcolor="#FFFFFF"></td>
			</tr>
		  <tr>
			  <td width="5" bgcolor="#FFFFFF"></td>
				<td background="img/footer.png" align="right">
			  <img src="img/footer.png" width="980" height="46" alt="footer" /></td>
				<td width="5" bgcolor="#FFFFFF"></td>
		  </tr>
		</table>
		</body>
		</html>
</cfif>