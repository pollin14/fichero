<cfapplication name="sisetic" sessionmanagement="yes">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Sistema de registro de llamadas DGDGIE</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="sisetic.css"/>
</head>




<body>


<!--- Get data --->


<cfquery datasource="Fichero" name="data">
SELECT (Nombre + ' ' + Apellido) as name
FROM fichas
ORDER BY Nombre,Apellido
</cfquery>

<!--- The form --->
<cfform>
Art:
<!--- Populate auto-suggest control --->
<cfinput type="text"
        name="artname"
        style="width:200px;"
        autosuggest="#ValueList(data.name)#">
</cfform>



</body>
</html>