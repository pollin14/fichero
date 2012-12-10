<cfapplication name="sisetic" sessionmanagement="yes">


    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Sistema de registro de llamadas DGDGIE</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="sisetic.css"/>
	<script type="text/javascript" src="estandares/menuprincipal.js" ></script>
    <script type="text/javascript" src="estandares/ToolTips.js" ></script> 

<style type="text/css">
#toolTipBox {
	display: none;
	padding: 5;
	font-size: 12px;
	border: black solid 1px;
	font-family: verdana;
	position: absolute;
	background-color: #ffffcc;
	color: 000000; }
</style> 

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
            <a class="menuItem" href="pruebaguardarbase.cfm">Exportar Base a Excel</a>
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





    <cfquery name="Q2" datasource="Fichero">
    SELECT	r.personaRelacionada, r.tipoLlamada, r.fechaAlta, r.horaAlta, r.nombreAlta, r.id,
    		f.Instancia, f.EntidadFederativa, f.Telefono, f.Extension, f.Correo1
    FROM	registroLlamadas r, fichas f
    WHERE	estadoLlamada LIKE 'no'
    AND		f.ID = r.idPersona
    </cfquery>
    
        
        <table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1">
            <tr>
                <td height="31">
                    <table width="100%" bgcolor="#DFE4F4" bordercolor="#B3BADC" border="1">
                        <cfoutput query="Q2">
                            <form id="form1" name="form1" method="post" action="actualizarPendientes.cfm">
                                <tr>
                                  <td align="center">
                                    <label>
                                      <input name="idPendiente" type="hidden" value="#Q2.id#" />
                                      <input type="submit" name="btnActualizar" id="btnActualizar" value="Actualizar" />
                                    </label>
                                  </td>
                                  <div align="center">
                                  <span id="toolTipBox" width="200"></span>
                                  <cfset textip = #Q2.personaRelacionada# & ",\nINSTANCIA:" & #Q2.Instancia# & ",\nENT.FEDERATIVA:" & #Q2.EntidadFederativa# & ",\nTEL." & #Q2.Telefono# & "\nEXT." & #Q2.Extension# & ",\nCORREO:" & #Q2.Correo1#>
                                  <td width="90%" height="23" onmouseover="toolTip('#textip#',this)">#Q2.personaRelacionada# (#Q2.Instancia#), <b>llamada</b> #Q2.tipoLlamada#, <b>fecha</b> #Q2.fechaAlta#, #Q2.horaAlta#, <b>registr&oacute; </b>#Q2.nombreAlta#
                                  </div> 
                                  </td>
                                </tr>
                            </form>    
                        </cfoutput>
                    </table>
                </td>
            </tr>
        </table>
        


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


