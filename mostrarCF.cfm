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
	
function Confirmacion( formulario ) {

	if (confirm('¿Está seguro(a) de eliminar permanentemente esta ficha?')){
		return true;
	} else {
		return false;
	}


}	
</script> 



</head>

<body>


        <table border="0" cellpadding="0" cellspacing="0" width="1327" align="center">
            <tr>
                <td width="5" bgcolor="#FFFFFF"></td>
                <td width="980"><img name="index_r1_c1" src="img/index_r1_c1.jpg" width="980" height="95" border="0" id="index_r1_c1" alt="" /></td>
                <td width="342" bgcolor="#FFFFFF"></td>
            </tr>


            <!--    BARRA DEL MENU    -->
            <tr height="20">
                <td width="5" bgcolor="#FFFFFF"></td>
                <td width="980" align="left" valign="top" bgcolor="#FFFFFF">
    
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




            <!-- **************** TABLA DE LA BASE DE DATOS DEL FICHERO ******************* -->

<!--- ASIGNACION DE VARIABLES --->

<cfif IsDefined("SESSION.varsQuery")>

	<cfset varsQuery = #SESSION.varsQuery#>

<cfelse>

	<cfset varsQuery = ''>
    <cfset nombre = ''>
    <cfset nombre = #form.Nombre#>
    <cfset apellido = ''>
    <cfset apellido = #form.Apellido#>
    <cfset instancia = ''>
    <cfset instancia = #form.Instancia#>
    <cfset correoElectronico = ''>
    <cfset correoElectronico = #form.CorreoElectronico#>
    
    
    
    <cfif #nombre# is not ''>
        <cfset varsQuery = " Nombre LIKE '%" & '#PreserveSingleQuotes(nombre)#' & "%'">
    <cfelse>
        <cfset varsQuery = ''>
    </cfif>
    
    <cfif #apellido# is not ''>
        <cfif #varsQuery# is not ''>
            <cfset varsQuery = #varsQuery# & " AND Apellido LIKE '%" & '#PreserveSingleQuotes(apellido)#' & "%'">
        <cfelse>
            <cfset varsQuery = " Apellido LIKE '%" & #apellido#& "%'">
        </cfif>
    </cfif>
    
    <cfif #instancia# is not ''>
        <cfif #varsQuery# is not  ''>
            <cfset varsQuery = #varsQuery# & " AND Instancia LIKE '%" & '#PreserveSingleQuotes(instancia)#' & "%'">
        <cfelse>
            <cfset varsQuery = " Instancia LIKE '%" & #instancia#& "%'">
        </cfif>
    </cfif>
    
    <cfif #correoElectronico# is not ''>
        <cfif #varsQuery# is not ''>
            <cfset varsQuery = #varsQuery# & " AND CorreoElectronico LIKE '%" & '#PreserveSingleQuotes(correoElectronico)#' & "%'">
        <cfelse>
            <cfset varsQuery = " CorreoElectronico LIKE '%" & #correoElectronico# & "%'">
        </cfif>
    </cfif>

    <cfset #SESSION.varsQuery# = varsQuery>

</cfif>


<!---  QUERY  --->
<cfset Query = "SELECT * FROM fichas WHERE" & #varsQuery# & " ORDER BY Apellido">

<!---
<cfoutput>Query=#Query#. </cfoutput>
--->


          


<table width="100%" border="0">
  <tr>
    <td width="7%">&nbsp;</td>
    <td width="86%">
    
    
<!---  TABLA DE LA CONSULTA ---> 
            <cfquery name="W1" datasource="Fichero">
	            #PreserveSingleQuotes(Query)#
            </cfquery>
			<div style="position:absolute; width:840px; height:500px; overflow:auto;">
            <table width="150%" align="center" cellspacing="1">
            <tr>
                <td>
                    <table width="150%" bgcolor="#DFE4F4" cellspacing="0" bordercolor="#B3BADC" border="1">
            
                        <tr>
                      	<td height="20"></td>
                          <td><b>Nombre</b></td>
                          <td><b>Apellidos</b></td>
                          <td><b>Instancia</b></td>
                          <td><b>Entidad Federativa</b></td>
                          <td><b>Cargo</b></td>
                          <td><b>Domicilio</b></td>                      
                          <td><b>Teléfono</b></td>
                          <td><b>Ext.</b></td>
                          <td><b>Fax</b></td>
                          <td><b>Mov.</b></td>
                          <td><b>Casa</b></td>
                          <td><b>Next</b></td>
                          <td><b>Otros</b></td>
                          <td><b>Correo 1</b></td>
                          <td><b>Correo 2</b></td>
                          <td><b>WebSite</b></td>
                          <td><b>Nombre adicional</b></td>
                          <td><b>Apellido adicional</b></td>
                          <td><b>Teléfono adicional</b></td>
                          <td><b>Ext. tel. adicional</b></td>
                          <td><b>Correo electrónico</b></td>
            
                        </tr>
                        <cfoutput query="W1">
                                <tr>
                          		<td height="20">
                                <a href="elimina.cfm?id=#id#" onclick="return Confirmacion(this);"><img border="0" src="img/eliminar.gif" alt="Eliminar"></a>
                                <a href="modificaFicha.cfm?id=#id#"><img border="0" src="img/actualizar.gif" alt="Actualizar"></a>
                                </td>
                                  <td>#Nombre#</td>
                                  <td>#Apellido#</td>
                                  <td>#Instancia#</td>
                                  <td>#EntidadFederativa#</td>
                                  <td>#Cargo#</td>
                                  <td>#Domicilio#</td>                                   
                                  <td>#Telefono#</td>
                                  <td>#Extension#</td>
                                  <td>#Fax#</td>
                                  <td>#Mov#</td>
                                  <td>#Casa#</td>
                                  <td>#Next#</td>
                                  <td>#Otros#</td>
                                  <td>#Correo1#</td>
                                  <td>#Correo2#</td>
                                  <td>#WebSite#</td>
                                  <td>#Nombre1#</td>
                                  <td>#Apellido1#</td>
                                  <td>#Telefono1#</td>
                                  <td>#Ext#</td>
                                  <td>#Correo#</td>
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


       
                </td>
                <td bgcolor="#FFFFFF"></td>
            </tr>
          <tr>
              <td width="5" bgcolor="#FFFFFF"></td>
                <td background="img/footer.png" align="right">
              <img src="img/footer.png" width="980" height="46" alt="footer" /></td>
                <td bgcolor="#FFFFFF"></td>
          </tr>
        </table>



</body>
</html>