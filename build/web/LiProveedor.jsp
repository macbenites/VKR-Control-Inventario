<%@page import="BR.ProveedorBR"%>
<%@page import="Modelo.Proveedor"%>
<%@page import="java.util.List"%>
<%
    List<Proveedor> lista = new ProveedorBR().listarProveedor();
%>
<select id="selPro" class="form-control select2" style="width: 100%;">
    <option value="0">- Seleccione Proveedor -</option><%
        for(Proveedor e:lista){%>
        <%System.err.println(e.getRaz_soc_prove());%>
            <option value="<%=e.getId_proveedor()%>"><%=e.getRaz_soc_prove()%></option><%
        }%>
        
       
</select>
