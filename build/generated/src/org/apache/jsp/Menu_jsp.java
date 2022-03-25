package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Menu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <title>VOLCKER | Menu</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"plugins/fontawesome-free/css/all.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/adminlte.min.css\">    \n");
      out.write("    </head>\n");
      out.write("    <body class=\"hold-transition sidebar-mini\"> \n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("\n");
      out.write("            <!-- Navbar -->\n");
      out.write("            <nav class=\"main-header navbar navbar-expand navbar-white navbar-light\">\n");
      out.write("                <!-- Left navbar links -->\n");
      out.write("                <ul class=\"navbar-nav\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" data-widget=\"pushmenu\" href=\"#\" role=\"button\"><i class=\"fas fa-bars\"></i></a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item d-none d-sm-inline-block\">\n");
      out.write("                        <a href=\"Menu.jsp\" class=\"nav-link\">Inicio</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item d-none d-sm-inline-block\">\n");
      out.write("                        <a href=\"LogOut.jsp\" class=\"nav-link\">Salir</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("            <aside class=\"main-sidebar sidebar-dark-primary elevation-4\">\n");
      out.write("                <div class=\"sidebar\">\n");
      out.write("                    <div class=\"user-panel mt-3 pb-3 mb-3 d-flex\">\n");
      out.write("                        <div class=\"info\">\n");
      out.write("                            <a class=\"d-block\">VOLCKER DEL PERU</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <nav class=\"mt-2\">\n");
      out.write("                        <ul class=\"nav nav-pills nav-sidebar flex-column\" data-widget=\"treeview\" role=\"menu\" data-accordion=\"false\">  \n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a href=\"#\" class=\"nav-link\">\n");
      out.write("                                    <i class=\"nav-icon fas fa-edit\"></i>\n");
      out.write("                                    <p>\n");
      out.write("                                        Registro\n");
      out.write("                                        <i class=\"fas fa-angle-left right\"></i>\n");
      out.write("                                    </p>\n");
      out.write("                                </a>\n");
      out.write("                                <ul class=\"nav nav-treeview\">   \n");
      out.write("                                    <li class=\"nav-item\">\n");
      out.write("                                    <li class=\"nav-item\">\n");
      out.write("                                        <a href=\"rEmpleado.jsp\" class=\"nav-link\">\n");
      out.write("                                            <i class=\"far fa-circle nav-icon\"></i>\n");
      out.write("                                            <p>Registro de Empleado</p>\n");
      out.write("                                        </a>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li class=\"nav-item\">\n");
      out.write("                                        <a href=\"rUsuario.jsp\" class=\"nav-link\">\n");
      out.write("                                            <i class=\"far fa-circle nav-icon\"></i>\n");
      out.write("                                            <p>Registro de Usuario</p>\n");
      out.write("                                        </a>\n");
      out.write("                                    </li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"nav-item\">\n");
      out.write("                                <a href=\"#\" class=\"nav-link\">\n");
      out.write("                                    <i class=\"nav-icon fas fa-table\"></i>\n");
      out.write("                                    <p>\n");
      out.write("                                        Vistas\n");
      out.write("                                        <i class=\"fas fa-angle-left right\"></i>\n");
      out.write("                                    </p>\n");
      out.write("                                </a>\n");
      out.write("                                <ul class=\"nav nav-treeview\">\n");
      out.write("                                    <li class=\"nav-item \">\n");
      out.write("                                        <a href=\"vEmpleados.jsp\" class=\"nav-link\">\n");
      out.write("                                            <i class=\"far fa-circle nav-icon\"></i>\n");
      out.write("                                            <p>Ver Empleados</p>\n");
      out.write("                                        </a>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li class=\"nav-item\">\n");
      out.write("                                        <a href=\"vUsuarios.jsp\" class=\"nav-link\">\n");
      out.write("                                            <i class=\"far fa-circle nav-icon\"></i>\n");
      out.write("                                            <p>Ver Usuarios</p>\n");
      out.write("                                        </a>\n");
      out.write("                                    </li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </nav>\n");
      out.write("                </div>\n");
      out.write("            </aside>\n");
      out.write("            <div class=\"content-wrapper\">\n");
      out.write("                <div class=\"content\">\n");
      out.write("                    <div class=\"container-fluid\">\n");
      out.write("                        <div class=\"row\">     \n");
      out.write("                            <h5></h5>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <footer class=\"main-footer\">\n");
      out.write("                <strong>Copyright &copy; 2021</strong>\n");
      out.write("                Todos los derechos reservados.\n");
      out.write("                <div class=\"float-right d-none d-sm-inline-block\">\n");
      out.write("                    <b>Version</b> 2.0\n");
      out.write("                </div>\n");
      out.write("            </footer>\n");
      out.write("        </div>\n");
      out.write("        <!-- jQuery -->\n");
      out.write("        <script src=\"plugins/jquery/jquery.min.js\"></script>\n");
      out.write("        <!-- Bootstrap -->\n");
      out.write("        <script src=\"plugins/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <!-- AdminLTE -->\n");
      out.write("        <script src=\"dist/js/adminlte.js\"></script>\n");
      out.write("        <!-- OPTIONAL SCRIPTS -->\n");
      out.write("        <script src=\"plugins/chart.js/Chart.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
