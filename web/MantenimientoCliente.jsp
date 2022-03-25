<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:set var="opcion" value="${param.opc}"/>
<c:choose>
    <c:when test="${opcion == 2}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            UPDATE `clientes` SET nom_cliente='${param.nombre}', dni_cliente=${param.dni}, IdDepartamento='${param.dep}', IdProvincia='${param.pro}', IdDistrito='${param.dis}', direccion_cliente='${param.dir}', telefono_cliente=${param.tel} WHERE id_clientes=${param.codigo};
        </sql:update>
    </c:when>
    <c:when test="${opcion == 3}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            DELETE FROM `clientes` WHERE `id_clientes` = '${param.codigo}';
        </sql:update>
    </c:when>
</c:choose>
