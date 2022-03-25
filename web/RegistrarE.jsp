<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/calprusof">
        INSERT INTO `empleado` (`id_empleado`, `nom_emp`, `apepat_emp`, `apemat_emp`, `dni_emp`, `IdDepartamento`, `IdProvincia`, `IdDistrito`,`dir_emp`, `tel_emp`) VALUES (${param.codigo}, '${param.nombre}', '${param.apepat}', '${param.apemat}', ${param.dni}, ${param.dep}, ${param.pro}, ${param.dis}, '${param.direc}', ${param.telf}); 
</sql:update>
