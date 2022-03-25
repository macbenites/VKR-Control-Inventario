<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.Marca"%>
<%@page import="Modelo.Modelo"%>
<jsp:useBean id="cx" class="Config.bd" scope="page"></jsp:useBean>
<% String s_marca = request.getParameter("f_marca");
   String s_modelo = request.getParameter("f_modelo");
   String s_opc = request.getParameter("f_opc");
 if(s_opc.equals("1")){
%>
<select name="f_modelo" >
	<option value="">- Seleccione Modelo-</option>
	<% String com = "select * from modelo where id_marca='"+s_marca+"'";
	ResultSet rs = 	cx.getDatos(com);
	while (rs.next()){%>
	<option value="<%=rs.getString("id_modelo")%>"><%=rs.getString("nom_mod")%></option>
	<%}
	cx.desconectar();
	%>
</select>
<%}else if(s_opc.equals("2")){
%>
<select name="f_UM" >
        <% String com = "select * from modelo where id_modelo='"+s_modelo+"'";
	ResultSet rs = 	cx.getDatos(com);
	while (rs.next()){%>
        <option><%=rs.getString("um_mod")%></option>
        <%session.setAttribute("model", rs.getString("um_mod"));%>
        <%}
	cx.desconectar();
	%>
</select>
<%}%>