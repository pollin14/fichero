<cfapplication name="sisetic" sessionmanagement="yes">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sistema de registro de llamadas DGDGIE</title>
<link rel="stylesheet" type="text/css" href="sisetic.css"/>

</head>


<body>


<cfquery name="borra" datasource="Fichero">
  delete from fichas where id=#url.id#
</cfquery>

<!---update fichas set nombre = nombre + ' Del' where id = #url.id# --->

<cfoutput>#SESSION.varsQuery# <br/></cfoutput>

<CFLOCATION URL="mostrarCF.cfm">



</body>
</html>