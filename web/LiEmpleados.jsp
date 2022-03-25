<%@page import="BR.EmpleadoBR"%>
<%@page import="Modelo.Empleado"%>
<%@page import="java.util.List"%>
<%
    List<Empleado> lista = new EmpleadoBR().listarEmpleados();
%>
<select id="selEmp" class="form-control select2 obligatorio" style="width: 100%;">
    <option value="0">- Seleccione Empleado -</option><%
        for(Empleado e:lista){%>
            <option value="<%=e.getId_emp()%>"><%=e.getNom_emp()%></option>
            <%}%>
</select>
