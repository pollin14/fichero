<cfapplication name="sisetic" sessionmanagement="yes">


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
            
            
<!--- ASIGNACION DE VARIABLES --->
<cfset idPendiente = #form.idPendiente#>
<cfset SESSION.IDPendiente=#idPendiente#>

 
<cfquery name="Q5" datasource="Fichero">
SELECT * FROM registroLlamadas WHERE id='#PreserveSingleQuotes(idPendiente)#'
</cfquery>

<!--- PARA VER EL CAMBIO DEL TIPO DE LLAMADA
<cfoutput query="Q5">
	<cfif #Q5.tipoLlamada# is 'saliente'>
    	<cfoutput>TipoLlamadaSaliente=#Q5.tipoLlamada# <br/></cfoutput>
    <cfelse>
    	<cfoutput>TipoLlamadaEntrante=#Q5.tipoLlamada# <br/></cfoutput>
    </cfif>

</cfoutput>
--->

              
              <table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1"><tr>
                <td>
              <table width="100%" bgcolor="#DFE4F4" cellpadding="8">
                <tr>
                  <td width="79%" align="left">Asignaci&oacute;n de llamada: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  		<cfoutput query="Q5">
                  		<input name="asignacion" type="text" class="micontrol" id="Persona" size="65" value="#Q5.asignacion#" disabled="disabled" /></td>
                        </cfoutput>
                   <td width="21%">&nbsp;</td>
                </tr>
					<td align="left" >Llamada &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<cfoutput query="Q5">
                        <input type="radio" name="tipo_llamada" id="tipo_llamada" disabled="disabled"
											"<cfif #Q5.tipoLlamada# is 'entrante'>
											    	<cfoutput>checked='checked'</cfoutput>
											 </cfif>"/>
                                             &nbsp;&nbsp;Entrante &nbsp;&nbsp;&nbsp;&nbsp; &oacute; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="tipo_llamada" id="tipo_llamada" disabled="disabled"
                                            "<cfif #Q5.tipoLlamada# is 'saliente'>
											    	<cfoutput>checked='checked'</cfoutput>
                                             </cfif>"/>
                         					 &nbsp;&nbsp;Saliente</td>
                        </cfoutput>
                    <td>&nbsp;</td>
                    
                <tr>
                </tr>
                <tr>                
					<td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Persona relacionada con la llamada:&nbsp;&nbsp;</font>
                    	<cfoutput query="Q5">
                    	<input name="Persona" type="text" class="micontrol" id="Persona" size="65" value="#Q5.personaRelacionada#" disabled="disabled"/></td>
                        </cfoutput>
					<td align="left"></td>
                </tr>  
                <form action="guardaPendientes.cfm" method="post" name="form3" id="form3" width="980">
                <tr>
                  <td align="left" >¿Cuál es es estado de la llamada? &nbsp;&nbsp;&nbsp;&nbsp;
                    <cfoutput query="Q5">
					<input type="radio" name="estado_llamada" id="estado_llamada" value="si"
                    						 "<cfif #Q5.estadoLlamada# is 'si'>
											    	<cfoutput>checked='checked'</cfoutput>
                                             </cfif>"/>
                                             &nbsp;&nbsp;Se resolvi&oacute; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="estado_llamada" id="estado_llamada" value="no"
                    						 "<cfif #Q5.estadoLlamada# is 'no'>
											    	<cfoutput>checked='checked'</cfoutput>
                                             </cfif>"/>                    						
                                             &nbsp;&nbsp;No se resolvi&oacute;</td>
                  </cfoutput>
                  <td align="left">&nbsp;</td>
                </tr>                              
                <tr>
                  <td align="left" >Notas relacionadas con la llamada:&nbsp;&nbsp;
					  <cfoutput query="Q5">
                      <textarea name="notas" id="notas" cols="50" rows="5"><cfoutput>#Q5.notas#</cfoutput></textarea></td>
                      </cfoutput>
                  <td align="right" valign="bottom"><button id="ActualizarPendientes" name="ActualizarPendientes">&nbsp;&nbsp;&nbsp;Actualizar&nbsp;&nbsp;&nbsp;</button></td>
                </tr>
                </form>
              </table></td></tr></table>
              <br />

<cfoutput query="Q5">
<cfset IdPersona = #Q5.IdPersona#>
<!---cfset people = 'SELECT * FROM fichas WHERE ID=#PreserveSingleQuotes(IdPersona)#'--->
</cfoutput>

<cfquery name="Q6" datasource="Fichero">
SELECT * FROM fichas WHERE ID='#PreserveSingleQuotes(IdPersona)#'
</cfquery>

            <table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1">
                <tr><td>
                    
                        <table width="100%" bgcolor="#DFE4F4" cellpadding="5" cellspacing="1" bordercolor="#B3BADC" border="0">
                            <tr>
								<td colspan="3"><div align="center"><strong>Ficha de la persona relacionada</strong></div></td>
                            </tr>
                            <tr>
                                <td width="34%" align="left"><cfoutput>#Q6.Apellido# #Q6.Nombre#</cfoutput></td>
                                <td width="33%" align="left"><cfoutput>Instancia #Q6.Instancia#</br>Ent.Fed. #Q6.EntidadFederativa#</cfoutput></td>
                                <td width="33%" align="left"><cfoutput>Tel. #Q6.Telefono#</br>Ext. #Q6.Extension#</cfoutput></td>
                            </tr>
                            <tr>
                                <td width="34%" align="left"><cfoutput>Mov. #Q6.Mov#</br>Casa #Q6.Casa#</cfoutput></td>
                                <td width="33%" align="left"><cfoutput>Nextel #Q6.Next#</br>Otros #Q6.Otros#</cfoutput></td>
                                <td width="33%" align="left"><cfoutput>Correo #Q6.Correo1#</br>Correo alt. #Q6.Correo2#</cfoutput></td>
                            </tr>
                            <tr>
                                <td colspan="3" align="left"><cfoutput>WebSite #Q6.WebSite#</cfoutput></td>
                            </tr>                  
                            <tr>
								<td colspan="3" align="left"><div align="center"><strong>Enlace</strong></div></td>
                            </tr>
                            <tr>
                                <td width="34%" align="left"><cfoutput>#Q6.Apellido1# #Q6.Nombre1#</cfoutput></td>
                                <td width="33%" align="left"><cfoutput>Tel. #Q6.Telefono1#</br>Ext. #Q6.Ext#</cfoutput></td>
                                <td width="33%" align="left"><cfoutput>Correo #Q6.Correo#</cfoutput></td>
                            </tr>                           
                        </table>
                    
                </td></tr>
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
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            