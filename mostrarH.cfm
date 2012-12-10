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



            <tr height="600" valign="middle">
                <td width="5" bgcolor="#FFFFFF"></td>
                <td bgcolor="#FFFFFF" valign="top">

        
			<h1><cfoutput>&nbsp;&nbsp;#SESSION.nombre#</cfoutput></h1><br />


<cfif isDefined("form.Clave")>
		<!--- ************ FILTRO POR PALABRA CLAVE ***************** --->
        <!--- ASIGNACION DE VARIABLES --->
        <cfset clave = #form.Clave#>
        
        <table width="100%" border="0">
          <tr>
            <td width="7%">&nbsp;</td>
            <td width="86%">    
            
                    <!---  TABLA DE LA CONSULTA  ---> 
                    <cfquery name="C" datasource="Fichero">
                        SELECT	*
                        FROM	registroLlamadas r, fichas f
                        WHERE	f.ID=r.idPersona
                        AND		(r.notas LIKE '%#clave#%'
                        		OR r.personaRelacionada LIKE '%#clave#%'
                                OR f.Nombre LIKE '%#clave#%'
                                OR f.Apellido LIKE '%#clave#%'
                                OR f.Instancia LIKE '%#clave#%'
                                OR f.EntidadFederativa LIKE '%#clave#%')
                        ORDER BY r.id
                    </cfquery>
                   
                    <div style="position:absolute; width:840px; height:450px; overflow:auto;">
                    <table width="98%" align="center" bgcolor="#B3BADC" cellspacing="1">
                    <tr>
                        <td>
                            <table width="100%" bgcolor="#DFE4F4" cellspacing="0" bordercolor="#B3BADC" border="1">
                    
                                   <tr>
                                    <td width="8%"><b>Fecha</b></td>
                                    <td width="8%"><b>Hora</b></td>
                                    <td width="17%"><b>Llamada asociada a</b></td>
                                    <td width="11%"><b>Tomo/Realizo llamada</b></td>
                                    <td width="8%"><b>Tipo de llamada</b></td>
                                    <td width="9%"><b>Presona o Inst.</b></td>
                                    <td width="9%"><b>Instancia</b></td>
                                    <td width="8%"><b>EntidadFederativa</b></td>
                                    <td width="14%"><b>Asunto</b></td>
                                    <td width="8%"><b>Resolvió</b></td>
                                </tr>
                                <cfoutput query="C">
                                        <tr>
                                            <td>#fechaAlta#</td>
                                            <td>#horaAlta#</td>
                                            <td>#asignacion#</td>
                                            <td>#nombreAlta#</td>
                                            <td>#tipoLlamada#</td>
                                            <td>#personaRelacionada#</td>
                                            <td>#Instancia#</td>
                                            <td>#EntidadFederativa#</td>
                                            <td>#notas#</td>
                                            <td>#nombreResolvio#</td>
                                        </tr>
                                </cfoutput>
                            </table>
                        </td>
                    </tr>
                    </table>
                    </div>
            </td>
            <td width="7%">&nbsp;</td>
          </tr>
        </table>

<cfelse>
		<!--- **************** FILTRO POR FECHAS ******************* --->
        <!--- ASIGNACION DE VARIABLES --->
        <cfset Date1 = #form.Fecha1#>
        <cfset Date2 = #form.Fecha2#>
        
        
        <table width="100%" border="0">
          <tr>
            <td width="7%">&nbsp;</td>
            <td width="86%">    
            
                    <!---  TABLA DE LA CONSULTA  ---> 
                    <cfquery name="CH" datasource="Fichero">
                        SELECT	*
                        FROM	registroLlamadas r, fichas f
                        WHERE	f.ID=r.idPersona
                        ORDER BY r.id                        
                    </cfquery>
                   
                    <div style="position:absolute; width:840px; height:450px; overflow:auto;">
                    <table width="98%" align="center" bgcolor="#B3BADC" cellspacing="1">
                    <tr>
                        <td>
                            <table width="100%" bgcolor="#DFE4F4" cellspacing="0" bordercolor="#B3BADC" border="1">
                    
                                 <tr>
                                    <td width="8%"><b>Fecha</b></td>
                                    <td width="8%"><b>Hora</b></td>
                                    <td width="17%"><b>Llamada asociada a</b></td>
                                    <td width="11%"><b>Tomo/Realizo llamada</b></td>
                                    <td width="8%"><b>Tipo de llamada</b></td>
                                    <td width="9%"><b>Presona o Inst.</b></td>
                                    <td width="9%"><b>Instancia</b></td>
                                    <td width="8%"><b>EntidadFederativa</b></td>
                                    <td width="14%"><b>Asunto</b></td>
                                    <td width="8%"><b>Resolvió</b></td>
                                </tr>
                                <cfoutput query="CH">
                                    <cfset fa = #fechaAlta#>
                                    <cfif (Date1 LTE fa) AND (fa LTE Date2)>
                                        <tr>
                                            <td>#fechaAlta#</td>
                                            <td>#horaAlta#</td>
                                            <td>#asignacion#</td>
                                            <td>#nombreAlta#</td>
                                            <td>#tipoLlamada#</td>
                                            <td>#personaRelacionada#</td>
                                            <td>#Instancia#</td>
                                            <td>#EntidadFederativa#</td>
                                            <td>#notas#</td>
                                            <td>#nombreResolvio#</td>
                                        </tr>
                                    </cfif>
                                </cfoutput>
                            </table>
                        </td>
                    </tr>
                    </table>
                    </div>
            </td>
            <td width="7%">&nbsp;</td>
          </tr>
        </table>
</cfif>

       
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