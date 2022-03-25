<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.Departamento"%>
<%@page import="Modelo.Distrito"%>
<jsp:useBean id="cx" class="Config.bd" scope="page"></jsp:useBean>
<% String s_departamento = request.getParameter("f_departamento");
   String s_provincia = request.getParameter("f_provincia");
   String s_opc = request.getParameter("f_opc");
 if(s_opc.equals("1")){
%>
<select name="f_provincia" >
	<option value="">- Seleccione una Provincia -</option>
        <% String com = "select * from provincias where IdDepartamento='"+s_departamento+"'";
	ResultSet rs = 	cx.getDatos(com);
	while (rs.next()){%>
	<option value="<%=rs.getString("IdProvincia")%>"><%=rs.getString("Provincia")%></option>
	<%}
	cx.desconectar();
	%>  
</select>
<%}else if(s_opc.equals("2")){
%>
<select name="f_distrito" >
	<option value="">- Seleccione un Distrito -</option>
        <% String com = "select * from distritos where IdProvincia='"+s_provincia+"'";
	ResultSet rs = 	cx.getDatos(com);
	while (rs.next()){%>
	<option value="<%=rs.getString("IdDistritos")%>"><%=rs.getString("Distrito")%></option>
	<%}
	cx.desconectar();
	%>
</select>
<%}%>