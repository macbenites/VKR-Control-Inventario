<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:set var="opcion" value="${param.opc}"/>
<c:choose>
    <c:when test="${opcion == 2}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            UPDATE `empleado` SET nom_emp='${param.nombre}', apepat_emp='${param.apepat}', apemat_emp='${param.apemat}', dni_emp=${param.dni}, IdDepartamento='${param.dep}', IdProvincia='${param.pro}', IdDistrito='${param.dis}', dir_emp='${param.dir}', tel_emp=${param.tel} WHERE id_empleado=${param.codigo};
        </sql:update>
    </c:when>
    <c:when test="${opcion == 3}">
        <sql:update var="sqli" dataSource="jdbc/calprusof">
            DELETE FROM `empleado` WHERE `id_empleado` = '${param.codigo}';
        </sql:update>
    </c:when>
</c:choose>