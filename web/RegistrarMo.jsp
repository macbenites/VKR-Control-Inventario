<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/calprusof">
        INSERT INTO `modelo` (`id_modelo`, `id_marca`, `nom_mod`, `um_mod`) VALUES (${param.codigo}, ${param.codigom}, '${param.nommo}', '${param.um}'); 
</sql:update>