<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:set var="opcion" value="${param.opc}"/>
<c:choose>
    <c:when test="${opcion == 2}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            UPDATE `proveedores` SET razon_social_prove='${param.razonso}', ruc_prove=${param.ruc}, IdDepartamento=${param.dep}, IdProvincia=${param.pro}, IdDistrito=${param.dis}, dir_prove='${param.direccion}', tele_prove=${param.telefono} WHERE id_proveedor=${param.codigo};
        </sql:update>
    </c:when>
    <c:when test="${opcion == 3}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            DELETE FROM `proveedores` WHERE `id_proveedor` = '${param.codigo}';
        </sql:update>
    </c:when>
</c:choose>

       
            