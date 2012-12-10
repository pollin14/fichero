<cfapplication name="sisetic" sessionmanagement="yes">



<cfif IsDefined("form.Preconsulta")>



    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Sistema de registro de llamadas DGDGIE</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <cfoutput><meta http-equiv='refresh' content='0;url=altas.cfm?persona=#form.Persona#&asignacion=#form.asuntode#&tpollamada=#form.tipo_llamada#&edollamada=#form.estado_llamada#'></cfoutput> 
    <link rel="stylesheet" type="text/css" href="sisetic.css"/>
    </head>
    
    <body><cfoutput>&nbsp;&nbsp;#SESSION.nombre#</cfoutput></body>
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
                <div class="menuItemSep"></div>
                <a class="menuItem" href="blank.html">Eliminar fichas</a>
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


  
<cfset ID = #form.IdPersona#>
<cfoutput>ID= #ID# <br/></cfoutput>    

<cfquery name="actualiza" datasource="Fichero">
  UPDATE	fichas
  SET		Nombre='#Nombre#', Apellido='#Apellido#', Instancia='#Instancia#', EntidadFederativa='#EntidadFederativa#',
  			Telefono='#Telefono#', Extension='#Extension#', Fax='#Fax#', Mov='#Mov#', Casa='#Casa#', Next='#Next#',
            Otros='#Otros#', Correo1='#Correo1 #', Correo2='# Correo2#', WebSite='#WebSite#', Nombre1='#Nombre1 #',
            Apellido1='# Apellido1#', Telefono1='#Telefono1#', Ext='#Ext#', Correo='#Correo#'
  WHERE		ID = #ID#
</cfquery> 



<table width="20%" align="center" bgcolor="#B3BADC" cellspacing="1">
    <tr>
        <td>
        	<form action="altasact.cfm" method="post" name="form1" id="form1" width="980">
            <table width="99%" bgcolor="#DFE4F4" cellpadding="8" cellspacing="1" bordercolor="#B3BADC">
<cfoutput>             
                <tr><td align="center" >FICHA ACTUALIZADA</td></tr>
                <tr><td align="center" ><input name="IdPersona" type="hidden" class="micontrol" id="IdPersona" size="1" value="#ID#"/>&nbsp;</td></tr>
                <tr><td align="center" ><button id="Regresar" name="Regresar">&nbsp;&nbsp;&nbsp;Regresar&nbsp;&nbsp;&nbsp;</button></td></tr>
</cfoutput>             
            </table>
            </form>
        </td>
    </tr>
</table>
<br />
                </td>
                <td width="5" bgcolor="#336699"></td>
            </tr>
          <tr>
              <td width="5" bgcolor="#336699"></td>
                <td background="img/footer.png" align="right">
              <img src="img/footer.png" width="980" height="46" alt="footer" /></td>
                <td width="5" bgcolor="#336699"></td>
          </tr>
        </table>




    </body>
    </html>

</cfif>
