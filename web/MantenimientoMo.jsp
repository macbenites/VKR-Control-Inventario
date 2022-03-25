<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:set var="opcion" value="${param.opc}"/>
<c:choose>
    <c:when test="${opcion == 2}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            UPDATE `modelo` SET nom_mod='${param.modelo}', um_mod='${param.um}' WHERE id_modelo=${param.codigo};
        </sql:update>
    </c:when>
            
    <c:when test="${opcion == 3}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            DELETE FROM `modelo` WHERE `id_modelo` = '${param.codigo}';
        </sql:update>
    </c:when>
</c:choose>