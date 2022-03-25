<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/calprusof">
        INSERT INTO `producto` (`id_producto`, `id_marca`, `id_modelo`, `um_producto`, `des_producto`, `stock_producto`) VALUES (${param.codigo}, ${param.marca}, ${param.modelo}, '${param.um}' , '${param.descripcion}' , ${param.stock}); 
</sql:update>