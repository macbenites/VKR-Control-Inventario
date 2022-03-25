package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>Login</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"CSS/adminlte.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <a href=\"CSS/adminlte.css.map\"></a>\n");
      out.write("    <link href=\"CSS/adminlte.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <a href=\"CSS/adminlte.min.css.map\"></a>\n");
      out.write("    <link href=\"CSS/estilo.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <script src=\"js/md5.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body class=\"hold-transition login-page\">\n");
      out.write("    <div class=\"login-box\">\n");
      out.write("        <!-- /.login-logo -->\n");
      out.write("        <div class=\"card card-outline card-primary\">\n");
      out.write("            <div class=\"card-header text-center\">\n");
      out.write("                <img src=\"IMG/Logo.jpeg\" alt=\"\"/>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("                <p class=\"login-box-msg\"><b>INICIAR SESION</p></b>\n");
      out.write("                <form class=\"form-signin\" action=\"Login.jsp\" method=\"POST\">\n");
      out.write("                    <div class=\"input-group mb-3\">\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"txtUsuario\" required placeholder=\"Usuario\" autofocus=\"\">\n");
      out.write("                        <div class=\"input-group-append\">\n");
      out.write("                            <div class=\"input-group-text\">\n");
      out.write("                                <span class=\"fas fa-envelope\"></span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"input-group mb-3\">\n");
      out.write("                        <input type=\"password\" class=\"form-control\" name=\"txtContrasena\" onkeyup=\"this.form.txtContrasena1.value = md5(this.form.txtContrasena.value)\" required placeholder=\"Contraseña\" >\n");
      out.write("                        <input type=\"hidden\" name=\"txtContrasena1\">\n");
      out.write("                        <div class=\"input-group-append\">\n");
      out.write("                            <div class=\"input-group-text\">\n");
      out.write("                                <span class=\"fas fa-lock\"></span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"mb-2\">\n");
      out.write("                            <input type=\"submit\" class=\"btn btn-primary btn-block\" name=\"btnAcceder\" value=\"Acceder\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("                ");

                    Connection c = null;
                    Statement st = null;
                    ResultSet rs = null;
                    if (request.getParameter("btnAcceder") != null) {
                        String user = request.getParameter("txtUsuario");
                        String con = request.getParameter("txtContrasena1");
                        HttpSession sesion = request.getSession();
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/pswad?useTimezone=true&serverTimezone=UTC", "root", "");
                            st = c.createStatement();
                            rs = st.executeQuery("SELECT * FROM usuario WHERE nom_usu='" + user + "' AND con_usu='" + con + "'");
                            while (rs.next()) {
                                sesion.setAttribute("id_usuario", rs.getInt("id_usuario"));
                                sesion.setAttribute("nom_usu", rs.getString("nom_usu"));
                                sesion.setAttribute("con_usu", rs.getString("con_usu"));
                                sesion.setAttribute("tipo_usuario", rs.getString("tipo_usuario"));
                                if (sesion.getAttribute("id_usuario").equals(rs.getInt("id_usuario"))) {
                                    response.sendRedirect("Menu.jsp");
                                } else {
                                    response.sendRedirect("Login.jsp");
                                }
                            }
                        } catch (SQLException e) {
                            System.out.println("Error: " + e.getMessage());
                        }
                    }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js\" integrity=\"sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://use.fontawesome.com/releases/v5.15.1/js/all.js\" data-auto-a11y=\"true\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
