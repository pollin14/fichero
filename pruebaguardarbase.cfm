<cfquery name="queryData" datasource="Fichero">
SELECT * FROM fichas
</cfquery>

<body>

<cfheader name="Content-Disposition" 
value="inline; filename=BasedeDatosDGDGIE.xls">
<cfcontent type="application/vnd.ms-excel">

<table border="2">

<tr bgcolor="#DFE4F4">
<td> <b>Nombre </b></td><td><b> Apellido </b></td><td><b> Instancia </b></td><td><b> Entidad Federativa </b></td><td><b> Domicilio </b></td><td><b> Cargo </b></td><td><b> Tel&eacute;fono </b></td><td><b> Extenci&oacute;n </b></td><td><b> Fax </b></td><td><b> M&oacute;vil </b></td><td><b> Casa </b></td><td><b> Nextel </b></td><td><b> Otros </b></td><td><b> Correo 1 </b></td><td><b> Correo 2 </b></td><td><b> Web Site </b></td><td>      </td><td><b> Nombre (s) </b></td><td><b> Apellidos </b></td><td><b> Tel&eacute;fono </b></td><td><b> Extenci&oacute;n </b></td><td><b>  Correo </b></td>
<cfoutput query="queryData">
<tr>
<td>#Nombre#</td><td>#Apellido#</td><td>#Instancia#</td><td>#EntidadFederativa#</td><td>#Domicilio#</td><td>#Cargo#</td><td>#Telefono#</td><td>#Extension#</td><td>#Fax#</td><td>#Mov#</td><td>#Casa#</td><td>#Next#</td><td>#Otros#</td><td>#Correo1#</td><td>#Correo2#</td><td>#WebSite#</td><td>      </td><td>#Nombre1#</td><td>#Apellido1#</td><td>#Telefono1#</td><td>#Ext#</td><td>#Correo#</td>
</tr>
</cfoutput>
</table>

</cfcontent>
</body>