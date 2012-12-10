<cfapplication name="sisetic" sessionmanagement="yes">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sistema de registro de llamadas DGDGIE</title>
<link rel="stylesheet" type="text/css" href="sisetic.css"/>

</head>


<body>


<cfset ID = #form.IdPersona#>
<cfoutput>ID= #ID# <br/></cfoutput>    

<cfquery name="actualiza" datasource="Fichero">
  UPDATE	fichas
  SET		Nombre='#Nombre#', Apellido='#Apellido#', Instancia='#Instancia#', EntidadFederativa='#EntidadFederativa#',
  			Telefono='#Telefono#', Extension='#Extension#', Fax='#Fax#', Mov='#Mov#', Casa='#Casa#', Next='#Next#',
            Otros='#Otros#', Correo1='#Correo1 #', Correo2='# Correo2#', WebSite='#WebSite#', Nombre1='#Nombre1 #',
            Apellido1='# Apellido1#', Telefono1='#Telefono1#', Ext='#Ext#', Correo='#Correo#'
  WHERE		ID = #ID#
</cfquery> 



<cfoutput>#SESSION.varsQuery# <br/></cfoutput>

<CFLOCATION URL="mostrarCF.cfm">



</body>
</html>