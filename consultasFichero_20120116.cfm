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
        
			<h1><cfoutput>&nbsp;&nbsp;#SESSION.nombre#</cfoutput></h1><br /> 




              <form action="mostrarCF.cfm" method="post" name="form3" id="form3" width="980" onSubmit="return Valida(this);">
              <table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1">
                <tr>
                <td height="166">
              <table width="100%" bgcolor="#DFE4F4" cellpadding="8">
                <tr>
                  <td width="30%" height="37" align="left">Nombre:</td>
                  <td width="57%" align="left"><input name="Nombre" type="text" class="micontrol" id="Nombre" size="65" /></td>
                   <td width="13%">&nbsp;</td>
                </tr>
					<tr>
					  <td align="left" >Apellido:</td>
					  <td align="left" ><input name="Apellido" type="text" class="micontrol" id="Apellido" size="65" /></td>
					  <td>&nbsp;</td>
			    <tr>
				  <td align="left" >Instancia:</td>
				  <td align="left" ><input name="Instancia" type="text" class="micontrol" id="Instancia" size="65" /></td>
                  <td>&nbsp;</td>
                    
                
                <tr>
                  <td height="37" align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Correo Elect&oacute;nico:</font></td>                
					<td align="left" ><input name="CorreoElectronico" type="text" class="micontrol" id="CorreoElectronico" size="65" /></td>
					<td align="left"></td>
                </tr>                              
                <tr>
                  <td height="35" align="left" valign="bottom">&nbsp;</td>
                  <td align="left" >&nbsp;</td>
                  <td align="right" valign="bottom"><button id="Consultar" name="Consultar">&nbsp;Consultar&nbsp;</button></td>
                </tr>
              </table></td></tr></table>
              </form><br />
              




       
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