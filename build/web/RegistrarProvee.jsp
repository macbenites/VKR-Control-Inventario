<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/calprusof">
        INSERT INTO `proveedores` (`id_proveedor`, `razon_social_prove`, `ruc_prove`, `IdDepartamento`, `IdProvincia`, `IdDistrito`, `dir_prove`, `tele_prove` ) VALUES (${param.codigo}, '${param.razonso}', ${param.ruc}, ${param.dep}, ${param.pro}, ${param.dis}, '${param.direccion}', ${param.telefono}); 
</sql:update>