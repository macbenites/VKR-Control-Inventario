<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/calprusof">
        INSERT INTO `marca` (`id_marca`, `nom_marca`, `proce_marca`) VALUES (${param.codigo}, '${param.nombre}', '${param.proce}'); 
</sql:update>