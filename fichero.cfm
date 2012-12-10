<cfapplication name="sisetic" sessionmanagement="yes">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Sistema de registro de llamadas DGDGIE</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="sisetic.css"/>
	<script type="text/javascript" src="estandares/menuprincipal.js" ></script> 


    <script type="text/javascript">
	
	function Valida( formulario ) {
	  if ((form3.Nombre.value==0) && (form3.Apellido.value==0) && (form3.Instancia.value==0) && (form3.CorreoElectronico.value==0) ) {
		alert ("  Llenar al menos un campo de busqueda  ");
		return false
	  } else {
		return true
	  }
	} 	
	

    </script>   


        

</head>

<body>


        <table border="0" cellpadding="0" cellspacing="0" width="990" align="center">
            <tr>
                <td width="5" bgcolor="#FFFFFF"></td>
                <td width="980"><img name="index_r1_c1" src="img/index_r1_c1.jpg" width="980" height="95" border="0" id="index_r1_c1" alt="" /></td>
                <td width="5" bgcolor="#FFFFFF"></td>
            </tr>


          
            
            <!--    BARRA DEL MENU    -->
            <tr height="20">
                <td width="5" bgcolor="#FFFFFF"></td>
                <td width="983" align="left" valign="top" bgcolor="#FFFFFF">
    
                <div class="menuBar" style="width:99%;">
                <a class="menuButton" href="altas.cfm" onclick="return buttonClick(event, 'altas');" onmouseover="buttonMouseover(event, 'altas');">Alta de llamadas</a>
                <a class="menuButton" href="pendientes.cfm" onclick="return buttonClick(event, 'pendientes');" onmouseover="buttonMouseover(event, 'pendientes');">Pendientes</a>
                <a class="menuButton" href="" onclick="return buttonClick(event, 'fichero');" onmouseover="buttonMouseover(event, 'fichero');">Fichero</a>
                <a class="menuButton" href="historicos.cfm" onclick="return buttonClick(event, 'historico');" onmouseover="buttonMouseover(event, 'historico');">Historico de llamadas</a>
                <a class="menuButton" href="index.cfm" onclick="return buttonClick(event, 'salir');" onmouseover="buttonMouseover(event, 'salir');">Salir</a>
                </div>
                <!-- Fichero -->
                <div id="fichero" class="menu">
                <a class="menuItem" href="fichero.cfm">Alta de fichas</a>
                <a class="menuItem" href="consultasFichero.cfm">Consulta de fichas</a>
                <a class="menuItem" href="pruebaguardarbase.cfm">Exportar Base a Excel</a>
                </div>
                </td>
                <td width="5" bgcolor="#FFFFFF"></td>
            </tr>
            <!--    FIN BARRA DEL MENU    -->
            
     
<td width="5" bgcolor="#FFFFFF"></td>
<tr height="600" valign="middle">
<td width="5" bgcolor="#FFFFFF"></td>
<td bgcolor="#FFFFFF" valign="top">
<h1><cfoutput>&nbsp;&nbsp;#SESSION.nombre#</cfoutput></h1>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />


<!---                                         PARA ACTUALIZAR                                              --->

<cfif IsDefined("form.IdPersona")>

	<cfset IdPersona = #form.IdPersona#>
    <!---<cfoutput>ID= #IdPersona# <br/></cfoutput>--->
    
    <cfquery name="Q1" datasource="Fichero">
        SELECT * FROM fichas WHERE ID = #IdPersona#
    </cfquery>    
    
<table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1">
<tr><td>

<table width="100%" bgcolor="#DFE4F4" cellpadding="8">
<form action="actualizarfichab.cfm" method="post" name="form2" id="form2" width="980">
<tr>
<td colspan="4" align="left"><b>Ingresar los datos de la persona.</b></td>
</tr>
<cfoutput query="Q1">
<tr>
<td width="21%" align="left"><font title="Puede ser nombre COMPLETO o PARCIAL">Nombre(s):&nbsp;&nbsp;</font></td>
<td width="37%" align="left"><input name="Nombre" type="text" class="micontrol" id="Nombre" size="60" value="#Q1.Nombre#" onKeyUp="this.value=this.value.toUpperCase();"/>
							 <input name="IdPersona" type="hidden" class="micontrol" id="IdPersona" size="60" value="#IdPersona#"/></td>

<td width="9%" align="left"><font title="Puede ser nombre COMPLETO o PARCIAL">Apellidos:&nbsp;&nbsp;</font></td>
<td width="33%" align="left"><input name="Apellido" type="text" class="micontrol" id="Apellido" size="60" value="#Q1.Apellido#" onKeyUp="this.value=this.value.toUpperCase();"/></td>

</tr>
<tr>
  <td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Instancia:&nbsp;</font></td>
  <td align="left" ><input name="Instancia" type="text" class="micontrol" id="Instancia" size="60" value="#Q1.Instancia#" onKeyUp="this.value=this.value.toUpperCase();"/></td>
  
  
  
  <td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Domicilio:&nbsp;</font></td>
  <td align="left" ><input name="Domicilio" type="text" class="micontrol" id="Domicilio" size="60" value="#Q1.Domicilio#" onKeyUp="this.value=this.value.toUpperCase();"/></td>
  
  
  
  
</tr>
<tr>
<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Entidad Federativa:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="EntidadFederativa" type="text" class="micontrol" id="EntidadFederativa" size="60" value="#Q1.EntidadFederativa#" onKeyUp="this.value=this.value.toUpperCase();"/></td>



<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Cargo:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Cargo" type="text" class="micontrol" id="Cargo" size="60" value="#Q1.Cargo#" onKeyUp="this.value=this.value.toUpperCase();"/></td>

</tr>
<tr>
<td align="left" >Tel&eacute;fono:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Telefono" type="text" class="micontrol" id="Telefono" size="60" value="#Q1.Telefono#"/></td>
<td align="left" >Ext:&nbsp;&nbsp;</td>
<td align="left" ><input name="Extension" type="text" class="micontrol" id="Extension" size="60" value="#Q1.Extension#"/></td>
</tr>
<tr>
  <td align="left" >Fax:&nbsp;&nbsp;</font></td>
  <td align="left" ><input name="Fax" type="text" class="micontrol" id="Fax" size="60" value="#Q1.Fax#"/></td>
  <td align="left" >M&oacute;vil:&nbsp;&nbsp;</td>
  <td align="left" ><input name="Mov" type="text" class="micontrol" id="Mov" size="60" value="#Q1.Mov#"/></td>
</tr>
<tr>
  <td align="left" >Casa:&nbsp;&nbsp;</font></td>
  <td align="left" ><input name="Casa" type="text" class="micontrol" id="Casa" size="60" value="#Q1.Casa#"/></td>
  <td align="left" >Nextel:&nbsp;&nbsp;</td>
  <td align="left" ><input name="Next" type="text" class="micontrol" id="Next" size="60" value="#Q1.Next#"/></td>
</tr>
<tr>
  <td align="left" >Otros:&nbsp;&nbsp;</font></td>
  <td align="left" ><input name="Otros" type="text" class="micontrol" id="Otros" size="60" value="#Q1.Otros#"/></td>
  <td align="left" >&nbsp;</td>
  <td align="left" >&nbsp;</td>
</tr>
<tr>
<td height="46" align="left" >Correo 1:&nbsp;&nbsp;</td>
<td align="left" ><input name="Correo1" type="text" class="micontrol" id="Correo1" size="60" value="#Q1.Correo1#"/></td>
<td align="left" >Correo 2:&nbsp;&nbsp;</td>
<td align="left" ></font>
  <input name="Correo2" type="text" class="micontrol" id="Correo2" size="60" value="#Q1.Correo2#"/></td>
</tr>
<tr>
  <td align="left" >WebSite:&nbsp;&nbsp;</td>
  <td align="left" ><input name="WebSite" type="text" class="micontrol" id="WebSite" size="60" value="#Q1.WebSite#"/></td>
  <td align="left" >&nbsp;</td>
  <td align="left" ></font></td>
</tr>
<tr align="left">
<td colspan="4" ><strong><b>Datos del Enlace.
</strong></tr>
<tr>
<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Nombre(s):&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Nombre1" type="text" class="micontrol" id="Nombre1" size="60" value="#Q1.Nombre1#" onKeyUp="this.value=this.value.toUpperCase();"/></td>
<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Apellidos:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Apellido1" type="text" class="micontrol" id="Apellido1" size="60" value="#Q1.Apellido1#" onKeyUp="this.value=this.value.toUpperCase();"/></td>
</tr>
<tr>
  <td align="left" >Tel&eacute;fono:&nbsp;&nbsp;</font></td>
  <td align="left" ><input name="Telefono1" type="text" class="micontrol" id="Telefono1" size="60" value="#Q1.Telefono1#"/></td>
  <td align="left" >Ext:&nbsp;&nbsp;</td>
  <td align="left" ><input name="Ext" type="text" class="micontrol" id="Ext" size="60" value="#Q1.Ext#"/></td>
</tr>
<tr>
  <td align="left" >Correo:&nbsp;&nbsp;</td>
  <td align="left" ><input name="Correo" type="text" class="micontrol" id="Correo" size="60" value="#Q1.Correo#"/></td>
  <td align="left" >&nbsp;</td>  
  <td align="left" >&nbsp;</td>
</tr>
</cfoutput>
<tr align="right">
<td ></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><button id="Actualizar" name="Actualizar">&nbsp;&nbsp;&nbsp;Actualizar&nbsp;&nbsp;&nbsp;</button></td>
</form>
</table>
</td>
</tr>
</table><br />
<td width="5" bgcolor="#FFFFFF"></td>
</tr>
<tr>
<td width="5" bgcolor="#FFFFFF"></td>
<td background="img/footer.png" align="right"><img src="img/footer.png" width="980" height="46" alt="footer" /></td>
              <td width="5" bgcolor="#FFFFFF"></td>
</tr>
</table>    
    
    
    
    
<cfelse>
    

<!---                                         NUEVA FICHA                                              --->

<table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1">
<tr>
<td>
<table width="100%" bgcolor="#DFE4F4" cellpadding="8">
<form action="guardarfichab.cfm" method="post" name="form2" id="form2" width="980">
<tr>
<td colspan="4" align="left"><b>Ingresar los datos de la persona.</b></td>
</tr>
<tr>
<td width="21%" align="left"><font title="Puede ser nombre COMPLETO o PARCIAL">Nombre(s):&nbsp;&nbsp;</font></td>
<td width="37%" align="left"><input name="Nombre" type="text" class="micontrol" id="Nombre" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>



<td width="9%" align="left"><font title="Puede ser nombre COMPLETO o PARCIAL">Apellidos:&nbsp;&nbsp;</font></td>
<td width="33%" align="left"><input name="Apellido" type="text" class="micontrol" id="Apellido" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>

</tr>
<tr>
  <td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Instancia:&nbsp;</font></td>
  <td align="left" ><input name="Instancia" type="text" class="micontrol" id="Instancia" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
  
  <td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Domicilio:&nbsp;</font></td>
  <td align="left" ><input name="Domicilio" type="text" class="micontrol" id="Domicilio" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
  
</tr>
<tr>
<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Entidad Federativa:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="EntidadFederativa" type="text" class="micontrol" id="EntidadFederativa" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>


<<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Cargo:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Cargo" type="text" class="micontrol" id="Cargo" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>

</tr>
<tr>
<td align="left" >Tel&eacute;fono:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Telefono" type="text" class="micontrol" id="Telefono" size="60"/></td>
<td align="left" >Ext:&nbsp;&nbsp;</td>
<td align="left" ><input name="Extension" type="text" class="micontrol" id="Extension" size="60"/></td>
</tr>
<tr>
  <td align="left" >Fax:&nbsp;&nbsp;</font></td>
  <td align="left" ><input name="Fax" type="text" class="micontrol" id="Fax" size="60" /></td>
  <td align="left" >M&oacute;vil:&nbsp;&nbsp;</td>
  <td align="left" ><input name="Mov" type="text" class="micontrol" id="Mov" size="60" /></td>
</tr>
<tr>
  <td align="left" >Casa:&nbsp;&nbsp;</font></td>
  <td align="left" ><input name="Casa" type="text" class="micontrol" id="Casa" size="60" /></td>
  <td align="left" >Nextel:&nbsp;&nbsp;</td>
  <td align="left" ><input name="Next" type="text" class="micontrol" id="Next" size="60" /></td>
</tr>
<tr>
  <td align="left" >Otros:&nbsp;&nbsp;</font></td>
  <td align="left" ><input name="Otros" type="text" class="micontrol" id="Otros" size="60" /></td>
  <td align="left" >&nbsp;</td>
  <td align="left" >&nbsp;</td>
</tr>
<tr>
<td height="46" align="left" >Correo 1:&nbsp;&nbsp;</td>
<td align="left" ><input name="Correo1" type="text" class="micontrol" id="Correo1" size="60" /></td>
<td align="left" >Correo 2:&nbsp;&nbsp;</td>
<td align="left" ></font>
  <input name="Correo2" type="text" class="micontrol" id="Correo2" size="60" /></td>
</tr>
<tr>
  <td align="left" >WebSite:&nbsp;&nbsp;</td>
  <td align="left" ><input name="WebSite" type="text" class="micontrol" id="WebSite" size="60" /></td>
  <td align="left" >&nbsp;</td>
  <td align="left" ></font></td>
</tr>
<tr align="left">
<td colspan="4" ><strong><b>Datos del Enlace.
</strong></tr>
<tr>
<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Nombre(s):&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Nombre1" type="text" class="micontrol" id="Nombre1" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Apellidos:&nbsp;&nbsp;</font></td>
<td align="left" ><input name="Apellido1" type="text" class="micontrol" id="Apellido1" size="60" onKeyUp="this.value=this.value.toUpperCase();"/></td>
</tr>
<tr>
  <td align="left" >Tel&eacute;fono:&nbsp;&nbsp;</font></td>
  <td align="left" ><input name="Telefono1" type="text" class="micontrol" id="Telefono1" size="60" /></td>
  <td align="left" >Ext:&nbsp;&nbsp;</td>
  <td align="left" ><input name="Ext" type="text" class="micontrol" id="Ext" size="60" /></td>
</tr>
<tr>
  <td align="left" >Correo:&nbsp;&nbsp;</td>
  <td align="left" ><input name="Correo" type="text" class="micontrol" id="Correo" size="60" /></td>
  <td align="left" >&nbsp;</td>  
  <td align="left" >&nbsp;</td>
</tr>
<tr align="right">
<td ></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><button id="Guardar" name="Guardar">&nbsp;&nbsp;&nbsp;Guardar&nbsp;&nbsp;&nbsp;</button></td>
</form>
</table>
</td>
</tr>
</table><br />
<td width="5" bgcolor="#FFFFFF"></td>
</tr>
<tr>
<td width="5" bgcolor="#FFFFFF"></td>
<td background="img/footer.png" align="right"><img src="img/footer.png" width="980" height="46" alt="footer" /></td>
              <td width="5" bgcolor="#FFFFFF"></td>
</tr>
</table>
</cfif>

</body>
</html>
