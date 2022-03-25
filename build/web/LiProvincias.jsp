<%@page import="BR.ProvinciaBR"%>
<%@page import="Modelo.Provincia"%>
<%@page import="java.util.List"%>
<%
    List<Provincia> lista = new ProvinciaBR().listarProvincias();
%>
<select id="i_provincia" class="form-control select2" style="width: 100%;">
    <option value="0">- Seleccione una Provincia -</option>
    <%for(Provincia e:lista){%>
    <option value="<%=e.getIdProvincia()%>"><%=e.getProvincia()%></option><%
    }%>
</select>
