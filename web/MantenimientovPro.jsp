<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:set var="opcion" value="${param.opc}"/>
<c:choose>
    <c:when test="${opcion == 2}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            UPDATE `producto` SET des_producto='${param.descripcion}', stock_producto='${param.stock}' WHERE id_producto=${param.codigo};
        </sql:update>
    </c:when>
    <c:when test="${opcion == 3}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            DELETE FROM `producto` WHERE `id_producto` = '${param.codigo}';
        </sql:update>
    </c:when>
</c:choose>