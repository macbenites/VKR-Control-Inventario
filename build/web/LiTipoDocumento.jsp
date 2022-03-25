<%@page import="BR.TipoDocumentoBR"%>
<%@page import="Modelo.TipoDocumento"%>
<%@page import="java.util.List"%>
<%
    List<TipoDocumento> lista = new TipoDocumentoBR().listarTipoDocumento();
%>
<select id="txtTipoDocumento" class="form-control select2" style="width: 100%;">
    <option value="0">- Seleccione Tipo Documento -</option>
    <%for(TipoDocumento e:lista){%>
    <option value="<%=e.getId_tipodoc()%>"><%=e.getNom_tipo_doc()%></option><%
    }%>
</select>

