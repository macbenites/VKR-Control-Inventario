<%@page import="BR.TipousuarioBR"%>
<%@page import="Modelo.Tipousuario"%>
<%@page import="java.util.List"%>
<%
    List<Tipousuario> lista = new TipousuarioBR().listarTipoUsuarios();
%>
<select class="form-control select2 obligatorio" id="selUsu" style="width: 101%;">
    <option value="0">- Seleccione Tipo de Usuario -</option><%
        for (Tipousuario e : lista) {%>
    <option value="<%=e.getNom_tipo_usu()%>"><%=e.getNom_tipo_usu()%></option>
    <%}%>
</select>
