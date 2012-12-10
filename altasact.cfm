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
	  if (form2.asuntode.value == 0) {
		alert ("Selecciona una opción del campo: Asignación de llamada ");
		return false
	  } else if (form2.Persona.value == ''){
		alert ("Asigna un nombre al campo: Persona relacionada con la llamada ");
		return false		  
	  } else {
		return true
	  }
	} 	
	
    function actualizar(num) {
        var cod = document.getElementById(num).innerHTML;
		form2.IdPersona.value=num;
        form2.Persona.value=cod;
        visible('tabla1');        
    }
	
    function ocultar(num) {
        var nom = document.getElementById(num).innerHTML;
		form2.IdPersona.value=num;
		form4.IdPersona.value=num;
        form2.Persona.value=nom;

		document.getElementById('td_nom_ape').innerHTML=nom;
		
		var varins = "ins" + num; var ins = document.getElementById(varins).innerHTML;
		document.getElementById('td_ins_ef').innerHTML=ins;
		
		var vartel = "tel" + num; var tel = document.getElementById(vartel).innerHTML;
		document.getElementById('td_tel_ext').innerHTML=tel;		
		
		var varmov = "mov" + num; var mov = document.getElementById(varmov).innerHTML;
		document.getElementById('td_mov_cas').innerHTML=mov;
		
		var varnex = "nex" + num; var nex = document.getElementById(varnex).innerHTML;
		document.getElementById('td_nex_otr').innerHTML=nex;		
		
		var varcor = "cor" + num; var cor = document.getElementById(varcor).innerHTML;
		document.getElementById('td_cor_alt').innerHTML=cor;		
		
		var varweb = "web" + num; var web = document.getElementById(varweb).innerHTML;
		document.getElementById('td_website').innerHTML=web;	
		
		var vareno = "eno" + num; var eno = document.getElementById(vareno).innerHTML;
		document.getElementById('td_eno_eap').innerHTML=eno;		
		
		var varete = "ete" + num; var ete = document.getElementById(varete).innerHTML;
		document.getElementById('td_ete_eex').innerHTML=ete;		
		
		var vareco = "eco" + num; var eco = document.getElementById(vareco).innerHTML;
		document.getElementById('td_ecorreo').innerHTML=eco;		
		
		visible('tabla2');
		visible('tabla1');
		//document.form3.Enviar.disabled=false;
    }	
    
    function visible(id){
        mostrado=0;
        elem = document.getElementById(id);
        if(elem.style.display=='block')mostrado=1;
        elem.style.display='none';
        if(mostrado!=1)elem.style.display='block';
		
		tbl2=document.getElementById('tabla2');
		tbl2.style.display='none';
    }
    </script>        
        
        
        
        </head>        
        
        <body>


<cfif IsDefined("form.IdPersona")>

	<cfset IdPersona = #form.IdPersona#>
    <cfoutput>ID= #IdPersona# <br/></cfoutput>

    <cfquery name="Q1" datasource="Fichero">
        SELECT * FROM fichas WHERE ID = #IdPersona#
    </cfquery>   


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
            <a class="menuItem" href="consultasFichero.cfm">Consultar/Borrar</a>
            </div>

            </td>
            <td width="5" bgcolor="#FFFFFF"></td>
        </tr>
            <!--    FIN BARRA DEL MENU    -->
            
            
            
            
            <tr height="600" valign="middle">
                <td width="5" bgcolor="#FFFFFF"></td>
                <td bgcolor="#FFFFFF" valign="top">
        
        			<h1><cfoutput>&nbsp;&nbsp;#SESSION.nombre#</cfoutput></h1><br />




              <form action="guardar.cfm" method="post" name="form2" id="form2" width="980" onSubmit="return Valida(this);">
              <table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1"><tr>
                <td>
              <table width="100%" bgcolor="#DFE4F4" cellpadding="5">
                <tr>               
                  <td width="30%" align="left">Asignación de llamada:</td>
                  <td width="57%" align="left">
						<cfif IsDefined('url.asignacion')>
                        	<cfset Asignacion = #url.asignacion#>
                        <cfelse>
                        	<cfset Asignacion = ''>
                  		</cfif>
						<cfif IsDefined('url.tpollamada')>
                            <cfset Tpollamada = #url.tpollamada#>
                        <cfelse>
                        	<cfset Tpollamada = ''>
                  		</cfif>
                        
						<cfif IsDefined('url.edollamada')>
                            <cfset Edollamada = #url.edollamada#>
                        <cfelse>
                        	<cfset Edollamada = ''>
                  		</cfif>                        
                  		<select name="asuntode">
                            <option value='JUAN MARTIN MARTINEZ BECERRA' <cfif #Asignacion# IS 'JUAN MARTIN MARTINEZ BECERRA'><cfoutput>selected='selected'</cfoutput></cfif> >JUAN MARTIN MARTINEZ BECERRA</option>
                            <option value='MA. ESTHER GARCIA GARCIA' <cfif #Asignacion# IS 'MA. ESTHER GARCIA GARCIA'><cfoutput>selected='selected'</cfoutput></cfif> >MA. ESTHER GARCIA GARCIA</option>
						</select></td>
                   <td width="13%">&nbsp;</td>
                </tr>
				<tr>
					<td align="left" >Llamada &nbsp;</td>
					<td align="left" >
                    	<input type="radio" name="tipo_llamada" id="tipo_llamada" value="entrante" checked="checked"/>&nbsp;&nbsp;Entrante &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<input type="radio" name="tipo_llamada" id="tipo_llamada" value="saliente"
											"<cfif #Tpollamada# is 'saliente'>
											    	<cfoutput>checked='checked'</cfoutput>
											 </cfif>"/>&nbsp;&nbsp;Saliente
                    </td>
                    <td>&nbsp;</td>
                    
                <tr>
                </tr>
                <tr>
<cfoutput query="Q1">
                    <td align="left" ><font title="Puede ser nombre COMPLETO o PARCIAL">Persona relacionada con la llamada:&nbsp;&nbsp;</font></td>
                    <cfset NombreCompleto = #Q1.Nombre# & " " & #Q1.Apellido#>
					<td align="left" ><input name="Persona" type="text" class="micontrol" id="Persona" size="65" value="#NombreCompleto#"/>
                    				<input name="IdPersona" type="hidden" class="micontrol" id="IdPersona" size="1" value="#IdPersona#"/>
					  <input type="submit" name="Preconsulta" id="Preconsulta" disabled="disabled" value="..."/></td>
					<td align="left"></td>
                    
                </tr>  
</cfoutput>
                <tr>
                  <td align="left" >Status:</td>
                  <td align="left" >
                        <input type="radio" name="estado_llamada" id="estado_llamada" value="si" checked="checked"/>&nbsp;&nbsp;Se concretó &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="estado_llamada" id="estado_llamada" value="no"
											"<cfif #Edollamada# is 'no'>
											    	<cfoutput>checked='checked'</cfoutput>
											 </cfif>"/>&nbsp;&nbsp;No se concretó
                  </td>
                  <td align="left">&nbsp;</td>
                </tr>                              
                <tr>
                  <td align="left" valign="bottom">Asunto:&nbsp;&nbsp;</td>
                  <td align="left" ><textarea name="notas" id="notas" cols="60" rows="5"></textarea> </td>
                  <td align="right" valign="bottom"><button id="Guardar" name="Guardar">&nbsp;&nbsp;&nbsp;Guardar&nbsp;&nbsp;&nbsp;</button></td>
                </tr>
                
                
              </table></td></tr></table>
              </form><br />
    
<!--- ****************                             TABLA DE LA BASE DE DATOS DEL FICHERO                                ******************* --->





    <form action="fichero.cfm" method="post" name="form4" id="form4" width="980">
    <table width="90%" align="center" bgcolor="#B3BADC" cellspacing="1" border="0">
        <tr><td>
                <table width="100%" bgcolor="#DFE4F4" cellpadding="5" cellspacing="1" bordercolor="#B3BADC" border="1">
<cfoutput query="Q1">                
                    <tr><td colspan="3"><div align="center"><strong>Ficha de la persona relacionada</strong></div></td></tr>
                    <tr><td width="34%" align="left" id="td_nom_ape">#Q1.Nombre# &nbsp; #Q1.Apellido#</td>
                        <td width="33%" align="left" id="td_ins_ef">#Q1.Instancia# &nbsp; #Q1.EntidadFederativa#</td>
                        <td width="33%" align="left" id="td_tel_ext">Teléfono &nbsp; #Q1.Telefono# &nbsp; Ext.#Q1.Extension#</td></tr>
                    <tr><td width="34%" align="left" id="td_mov_cas">Móvil &nbsp; #Q1.Mov# &nbsp; Tel.Casa &nbsp; #Q1.Casa#</td>
                        <td width="33%" align="left" id="td_nex_otr">Nextel &nbsp; #Q1.Next# &nbsp; Otro tel. &nbsp; #Q1.Otros#</td>
                        <td width="33%" align="left" id="td_cor_alt">Correo &nbsp; #Q1.Correo1# &nbsp; Correo alt.#Q1.Correo2#</td></tr>
                    <tr><td colspan="3" align="left" id="td_website">WebSite &nbsp; #Q1.WebSite#</td></tr>                  
                    <tr><td colspan="3" align="left"><div align="center"><strong>Enlace</strong></div></td></tr>
                    <tr><td width="34%" align="left" id="td_eno_eap">#Q1.Nombre1# &nbsp; #Q1.Apellido1#</td>
                        <td width="33%" align="left" id="td_ete_eex">Teléfono &nbsp; #Q1.Telefono1# &nbsp; Ext.#Q1.Ext#</td>
                        <td width="33%" align="left" id="td_ecorreo">Correo &nbsp; #Q1.Correo#</td></tr>
                    <tr><td width="34%">&nbsp;</td>
                        <td width="33%"><input name="IdPersona" type="hidden" class="micontrol" id="IdPersona" size="1" />&nbsp;</td>
                        <td width="33%" align="right">
                          <button id="Actualizar" name="Actualizar">&nbsp;Actualizar&nbsp;</button>
                        </td></tr>
</cfoutput>                        
                </table>
        </td></tr>
    </table>
    </form>





        <iframe width="1" height="1" src="blanco.html" frameborder="0" name="MiIframe" scrolling="auto"></iframe>

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

</cfif>
</body>
</html>