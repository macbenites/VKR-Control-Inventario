<%@page import="BR.DepartamentoBR"%>
<%@page import="Modelo.Departamento"%>
<%@page import="java.util.List"%>
<%
    List<Departamento> lista = new DepartamentoBR().listarDepartamentos();
%>
<select id="i_Departamento" class="form-control select2" style="width: 100%;">
    <option value="0">- Seleccione un Departamento -</option>
    <%for (Departamento e : lista) {%>
    <option value="<%=e.getIdDepartamento()%>"><%=e.getDepartamento()%></option><%
        }%>
</select>
