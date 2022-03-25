<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <link href="CSS/adminlte.css" rel="stylesheet" type="text/css"/>
    <a href="CSS/adminlte.css.map"></a>
    <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
    <a href="CSS/adminlte.min.css.map"></a>
    <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
    <script src="js/md5.js"></script>
</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <!-- /.login-logo -->
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
                <img src="IMG/Logo.jpeg" alt=""/>
            </div>
            <div class="card-body">
                <p class="login-box-msg"><b>INICIAR SESION</p></b>
                <form class="form-signin" action="Login.jsp" method="POST">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="txtUsuario" required placeholder="Usuario" autofocus="">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" name="txtContrasena" onkeyup="this.form.txtContrasena1.value = md5(this.form.txtContrasena.value)" required placeholder="Contraseña" >
                        <input type="hidden" name="txtContrasena1">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-2">
                            <input type="submit" class="btn btn-primary btn-block" name="btnAcceder" value="Acceder">
                        </div>
                    </div>
                </form>
                <%
                    Connection c = null;
                    Statement st = null;
                    ResultSet rs = null;
                    if (request.getParameter("btnAcceder") != null) {
                        String user = request.getParameter("txtUsuario");
                        String con = request.getParameter("txtContrasena1");
                        HttpSession sesion = request.getSession();
                        try {
                        Class.forName("com.mysql.jdbc.Driver");
                            c = DriverManager.getConnection("jdbc:mysql://localhost:3307/pswad?useTimezone=true&serverTimezone=UTC", "root", "1234");
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
                %>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" data-auto-a11y="true"></script>
</body>
</html>