

<cfapplication name="sisetic" sessionmanagement="yes">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Sistema de registro de llamadas DGDGIE</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="sisetic.css"/>
    <script type="text/javascript" src="estandares/menuprincipal.js" ></script> 

<!-- Hoja de estilos del calendario -->
<link rel="stylesheet" type="text/css" media="all" href="estandares/calendar-blue.css" title="win2k-cold-1" />
<!-- librería principal del calendario -->
<script type="text/javascript" src="estandares/calendar.js" ></script>
<!-- librería para cargar el lenguaje deseado -->
<script type="text/javascript" src="estandares/lang/calendar-es.js"></script>
<!-- librería que declara la función Calendar.setup, que ayuda a generar un calendario en unas pocas líneas de código -->
<script type="text/javascript" src="estandares/calendar-setup.js"></script>




    <script type="text/javascript">
	
	function Valida( formulario ) {
		if ( form1.Clave.value==0 ) {
			if ((form1.Fecha1.value==0) || (form1.Fecha2.value==0) ) {
				alert ("  Llenar ambos campos de fecha, ó introducir una palabra clave  ");
				return false
			} else {
				return true
			}
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


            <tr height="600" valign="middle">
                <td width="5" bgcolor="#FFFFFF"></td>
                <td bgcolor="#FFFFFF" valign="top">
        
			<h1><cfoutput>&nbsp;&nbsp;#SESSION.nombre#</cfoutput></h1><br /> 




              <form action="mostrarH.cfm" method="post" name="form1" id="form1" width="980" onSubmit="return Valida(this);">
              <table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1">
                <tr>
                <td height="166">
              <table width="100%" bgcolor="#DFE4F4" cellpadding="8">
                <tr>
                  <td width="6%" height="37" align="left">&nbsp;</td>
                  <td width="35%" align="left">Fecha inicial:</td>
                  <td width="47%" align="left">Fecha Final</td>
                   <td width="12%">&nbsp;</td>
                </tr>
					<tr>
					  <td align="left" >

                      
                      
                      
                      </td>
					  <td align="left" >
<input name="Fecha1" type="text" size="15" id="Fecha1" readonly="true" value="" >
		<img src="img/calendar.gif" width="19" height="18" border="0" id="idFecha1" alt="Calendario" /> 
		<script type="text/javascript">
			Calendar.setup({
			inputField : "Fecha1", // id del campo de texto
			ifFormat : "%d/%m/%Y", // formato de la fecha que se escriba en el campo de texto
			button : "idFecha1" // el id del botón que lanzará el calendario
			});
		</script>
                      </td>
                      
					  <td align="left" >                      
                   
<input name="Fecha2" type="text" size="15" id="Fecha2" readonly="true" value="" >
		<img src="img/calendar.gif" width="19" height="18" border="0" id="idFecha2" alt="Calendario" /> 
		<script type="text/javascript">
			Calendar.setup({
			inputField : "Fecha2", // id del campo de texto
			ifFormat : "%d/%m/%Y", // formato de la fecha que se escriba en el campo de texto
			button : "idFecha2" // el id del botón que lanzará el calendario
			});
		</script>                      
                      
                      
                      
                      </td>
					  <td>&nbsp;</td>
			        <tr>
			          <td align="left" >&nbsp;</td>
			          <td align="left" >&nbsp;</td>
			          <td align="left" >&nbsp;</td>
			          <td>&nbsp;</td>
	            <tr>
				  <td align="left" >&nbsp;</td>
				  <td align="right">Palabra clave:</td>
				  <td align="left" ><input name="Clave" type="text" class="micontrol" id="Clave" size="65" onKeyUp="this.value=this.value.toUpperCase();"/></td>
                  <td>&nbsp;</td>
                    
                          
                <tr>
                  <td height="35" align="left" valign="bottom">&nbsp;</td>
                  <td align="left" >&nbsp;</td>
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