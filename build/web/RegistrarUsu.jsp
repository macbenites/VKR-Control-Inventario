<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:update var="sqli" dataSource="jdbc/calprusof">
        INSERT INTO `usuario` (`id_usuario`, `id_emp`, `nom_usu`, `con_usu`, `tipo_usuario`) VALUES (${param.codigo}, ${param.idemp}, '${param.usuario}', '${param.contraseña}', '${param.tusuario}'); 
</sql:update>
