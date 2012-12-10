<cfapplication name="sisetic" sessionmanagement="yes"> 
<cfquery name="Q2" datasource="Fichero">
	SELECT * FROM fichas WHERE Apellido LIKE '%#PreserveSingleQuotes(form.nombre)#%' OR Nombre LIKE '%#PreserveSingleQuotes(form.nombre)#%' ORDER BY Apellido
</cfquery>

<cfoutput query="Q2">
	<cfset nomCompleto = #Q2.Apellido# & ' ' & #Q2.Nombre#>
	<cfif #nomCompleto# is not ' '>
<p>#nomCompleto#</p>
	</cfif>
</cfoutput>
