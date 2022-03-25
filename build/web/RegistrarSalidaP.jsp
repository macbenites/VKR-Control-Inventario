<%-- 
    Document   : RegistrarSalidaP
    Created on : 24/06/2021, 10:53:54 PM
    Author     : chris
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/sowad">
        INSERT INTO `salidap` (`id_salida`, `fecha_salida`, `id_usuario`, `id_cliente`) VALUES (${param.codigos}, '${param.fechas}', ${param.codigoe}, ${param.codigoc}); 
</sql:update>
