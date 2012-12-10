<!--- Para sesiones --->
<cfapplication name="sisetic" sessionmanagement="yes">

<cfif isDefined("SESSION.inicio")>
	<cfset StructDelete(SESSION,"inicio")>


	<cfif #len(form.usuario)# IS 0>
    <cfset Fld_usuario = ''>
    <cfelse>
    <cfset Fld_usuario = #form.usuario#>
    <cfset SESSION.usuario = #form.usuario#>
    </cfif>
    
    <cfif #len(form.contrasena)# IS 0>
    <cfset Fld_contrasena = ''>
    <cfelse>
    <cfset Fld_contrasena = #form.contrasena#>
    </cfif>
    
    <cfquery name="Q0" datasource="Fichero">
    SELECT id, usuario, nombre FROM usuarios WHERE usuario='#PreserveSingleQuotes(Fld_Usuario)#' AND password='#PreserveSingleQuotes(Fld_contrasena)#'
    </cfquery>
	<!--- Para sesiones --->
    <cfset SESSION.nombre=#Q0.nombre#>

	<cfif #Q0.RecordCount# IS 0>
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
        <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
        <meta http-equiv="refresh" content="0;url=index.cfm?Pasa=1">
        <title>Sistema de registro de llamadas DGDGIE</title>
        </head>
        
        <body>
        </body>
        </html>
    <cfelse>
    
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
        <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
        <cfoutput><meta http-equiv='refresh' content='0;url=altas.cfm?nombre=#SESSION.nombre#&persona='></cfoutput>        
        <title>Sistema de registro de llamadas DGDGIE</title>
        </head>
        
        <body>

        </body>
        </html>
    
     
    </cfif>
<cfelse>
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
        <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
        <meta http-equiv="refresh" content="0;url=index.cfm">
        <title>Sistema de registro de llamadas DGDGIE</title>
        </head>
        
        <body>
        </body>
        </html>
</cfif>
