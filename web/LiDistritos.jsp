<%@page import="BR.DistritoBR"%>
<%@page import="Modelo.Distrito"%>
<%@page import="java.util.List"%>
<%
    List<Distrito> lista = new DistritoBR().listarDistritos();
%>
<select id="i_distrito" class="form-control select2" style="width: 100%;">
    <option value="0">- Seleccione un Distrito -</option>
    <%for (Distrito e : lista) {%>
    <option value="<%=e.getIdDistritos()%>"><%=e.getDistrito()%></option><%
        }%>
</select>
