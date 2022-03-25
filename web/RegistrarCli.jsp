<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/calprusof">
        INSERT INTO `clientes` (`id_clientes`, `nom_cliente`, `dni_cliente`, `IdDepartamento`, `IdProvincia`, `IdDistrito`, `direccion_cliente`, `telefono_cliente` ) VALUES (${param.codigo}, '${param.nombre}', ${param.dni}, ${param.dep}, ${param.pro}, ${param.dis}, '${param.direccion}', ${param.telefono}); 
</sql:update>