<cfapplication name="sisetic" sessionmanagement="yes">

<cfif IsDefined('url.Pasa')>


    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Sistema de registro de llamadas DGDGIE</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="sisetic.css"/>
	<script type="text/javascript" src="estandares/menuprincipal.js" ></script> 


</head>
    
    <body>

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
	<script type="text/javascript" src="estandares/menuprincipal.js" ></script> 


</head>
    
    <body>


    <table border="0" cellpadding="0" cellspacing="0" width="990" align="center">
        <tr>
            <td width="5" bgcolor="#FFFFFF">&nbsp;</td>
            <td width="980"><img name="index_r1_c1" src="img/index_r1_c1.jpg" width="980" height="95" border="0" id="index_r1_c1" alt="" /></td>
            <td width="5" bgcolor="#FFFFFF">&nbsp;</td>
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



        <tr height="600" valign="middle">
            <td width="5" bgcolor="#FFFFFF"></td>
            <td bgcolor="#FFFFFF" valign="top">
    
			<h1><cfoutput>&nbsp;&nbsp;#SESSION.nombre#</cfoutput></h1>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />







<!--- ASIGNACION DE VARIABLES --->
<cfset EstadoLlamada = #form.estado_llamada#>
<cfset Notas = #form.notas#>
<cfset Ahora=Now()>
<cfset Fecha = #LSDateFormat(Ahora,"dd/mm/yy")#>
<cfset Hora = #LSTimeFormat(Ahora,"hh:mm:ss tt")#>

<!---
<cfoutput>ID_PENDIENTE=#SESSION.IDPendiente# <br/></cfoutput>
<cfoutput>#EstadoLlamada# <br/></cfoutput>
<cfoutput>#Notas# <br/></cfoutput>
--->

<cfquery name="actualiza" datasource="Fichero">
    update registroLlamadas set estadoLlamada='#PreserveSingleQuotes(EstadoLlamada)#', notas='#PreserveSingleQuotes(Notas)#', nombreResolvio='#PreserveSingleQuotes(SESSION.nombre)#', fechaResuelta='#PreserveSingleQuotes(Fecha)#',horaResuelta='#PreserveSingleQuotes(Hora)#'
    where id=#SESSION.IDPendiente#
</cfquery>



<table width="30%" align="center" bgcolor="#B3BADC" cellspacing="1">
    <tr>
        <td>
        <table width="100%" bgcolor="#DFE4F4" cellpadding="8" cellspacing="1" bordercolor="#B3BADC">
                <tr><td height="82" align="center" >&nbsp;&nbsp;¡Pendiente actualizado!&nbsp;&nbsp;</td></tr>

          </table>
      </td>
    </tr>
</table>
<br />



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