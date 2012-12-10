<cfapplication name="sisetic" sessionmanagement="yes"> 
<form action="fichero.cfm" method="post" name="form4" id="form4" width="980">
<table width="100%" bgcolor="#DFE4F4" cellpadding="5" cellspacing="1" bordercolor="#B3BADC" border="1">
	<cfset v=Trim(form.nombre)>
	<cfquery name="Q2" datasource="Fichero">
		SELECT * FROM fichas WHERE Apellido LIKE '%#PreserveSingleQuotes(v)#%' OR Nombre LIKE '%#PreserveSingleQuotes(v)#%' ORDER BY Apellido
	</cfquery>

	<cfoutput query="Q2">
		
		<cfset nomCompleto = #Q2.Apellido# & ' ' & #Q2.Nombre#>
		<cfif #nomCompleto# is not ' '>
			<tr><td colspan="3"><div align="center"><strong>Ficha de la persona relacionada</strong></div></td></tr>
			<tr><td width="34%" align="left" id="td_nom_ape">#nomCompleto#</td>
				<td width="33%" align="left" id="td_ins_ef">#Q2.Instancia# &nbsp; #Q2.EntidadFederativa#</td>
				<td width="33%" align="left" id="td_tel_ext">Teléfono &nbsp; #Q2.Telefono# &nbsp; Ext. #Q2.Extension#</td></tr>
			<tr><td width="34%" align="left" id="td_mov_cas">Móvil &nbsp; #Q2.Mov# &nbsp; Fijo &nbsp; #Q2.Casa#</td>
				<td width="33%" align="left" id="td_nex_otr">Nextel &nbsp; #Q2.Next# &nbsp; Otros #Q2.Otros#</td>
				<td width="33%" align="left" id="td_cor_alt">Correo &nbsp; #Q2.Correo1# &nbsp; Correo alterno &nbsp; #Q2.Correo2#</td></tr>
			<tr><td colspan="3" align="left" id="td_website">WebSite &nbsp; #Q2.WebSite#</td></tr>                  
			<tr><td colspan="3" align="left"><div align="center"><strong>Enlace</strong></div></td></tr>
			<tr><td width="34%" align="left" id="td_eno_eap">#Q2.Nombre1# &nbsp; #Q2.Apellido1#</td>
				<td width="33%" align="left" id="td_ete_eex">Teléfono &nbsp; #Q2.Telefono1# &nbsp; Ext. &nbsp; #Q2.Ext#</td>
				<td width="33%" align="left" id="td_ecorreo">Correo &nbsp; #Q2.Correo#</td></tr>
			<tr><td width="34%">&nbsp;</td>
				<td width="33%"><input name="IdPersona" type="hidden" class="micontrol" id="IdPersona" size="1"  value="<cfoutput>#Q2.ID#</cfoutput>"/></td>
				<td width="33%" align="right">
<!--					<button id="Actualizar" name="Actualizar">&nbsp;Actualizar&nbsp;</button>-->
				  <input id="Actualizar" name="Actualizar" type="submit"/>
			</td></tr>
		</cfif>
	</cfoutput>

</table>
	</form>