<%@page import="BR.MarcaBR"%>
<%@page import="Modelo.Marca"%>
<%@page import="java.util.List"%>

<%
    List<Marca> lista = new MarcaBR().listarMarcas();
%>
<select id="selMar" name="selMar">
    <option value="0">- Seleccione Marca -</option>
    <%for(Marca e:lista){%>
    <option value="<%=e.getId_marca()%>"><%=e.getNom_mar()%></option><%
    }%>
</select>
