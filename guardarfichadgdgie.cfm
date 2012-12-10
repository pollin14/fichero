<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Usuarios de la DGDGIE</title>
<meta http-equiv="refresh" content="2;URL='http://192.168.25.201/fichero/ficherodgdgie.cfm'">
</head>
<body>

<cfquery name="Q4" datasource="Fichero">
    select max(id) as tope from dgdgie
</cfquery>
<cfset Id = #Q4.tope# + 1>

<!--- ASIGNACION DE VARIABLES --->
<cfquery name="actualiza" datasource="Fichero">
  Insert into DGDGIE(ID, Nombre, Apellido, Usuario, Depto, Piso, Ext, CPU, Monitor, Teclado, Mouse, UPS, Bocinas, Comentarios) values(#ID#, '#Nombre#', '#Apellido#', '#Usuario#', '#Depto#', '#Piso#', '#Ext#', '#CPU#', '#Monitor#', '#Teclado#', '#Mouse#', '#UPS#', '#Bocinas#', '#Comentarios#')
</cfquery> 

<table width="20%" align="center" bgcolor="#B3BADC" cellspacing="1">
    <tr>
        <td>
            <table width="99%" bgcolor="#DFE4F4" cellpadding="8" cellspacing="1" bordercolor="#B3BADC">
                <tr><td align="center" >FICHA REGISTRADA</td></tr>
                <tr><td align="center" ></td></tr>
            </table>
        </td>
    </tr>
</table>
<br />
                </td>
        </table>
    </body>
    </html>
