<%@page import="BR.ModeloBR"%>
<%@page import="Modelo.Modelo"%>
<%@page import="java.util.List"%>

<%
    List<Modelo> lista = new ModeloBR().listarModelos();
%>
<select id="selMod" name="selMod">
    <%for(Modelo e:lista){%>
    <option value="<%=e.getId_modelo()%>"><%=e.getNom_mod()%></option>
    <%}%>
</select>
