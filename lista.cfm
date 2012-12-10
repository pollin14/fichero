<HTML>
 <HEAD>
   <TITLE>Gestión de BBDD</TITLE>
   <STYLE>
      TABLE, A, INPUT {font: 14px "monospace"}
   </STYLE>
 </HEAD>
 <BODY>
	<CENTER>
	<H2> Manejando consultas <BR> -cfquery- </H2>
            <cfquery name="consulta" datasource="Fichero">
                SELECT * FROM nivel
            </cfquery>
            <cfoutput>
                <P> Recuperados #consulta.RecordCount# registro/s en #CFQUERY.ExecutionTime# mseg. </P>
            </cfoutput>
   </CENTER>
 </BODY>
</HTML>