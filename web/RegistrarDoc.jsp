<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/calprusof">
        INSERT INTO `documentoext` (`id_doc`, `id_proveedor`, `id_tipodoc`, `num_doc`, `fecha`) VALUES (${param.codigo}, ${param.proveedor}, ${param.documento}, ${param.ndocumento}, '${param.fecha}'); 
</sql:update>