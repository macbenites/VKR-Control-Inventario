<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:query var="sqlidproducto" dataSource="jdbc/calprusof">
    select max(id_producto)as id_producto from producto
</sql:query>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>VKR | Registro Producto</title>
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="CSS/adminlte.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
        <link href="CSS/index.css" rel="stylesheet"/>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/Producto.js"></script>
        <script type="text/javascript">
            function combo_modelo() {
                $("#i_opc").val("1");
                $.post("comboP.jsp", $("#data").serialize(), function (data) {
                    $("#i_modelo").html(data);
                });
            }
            function combo_UM() {
                $("#i_opc").val("2");
                $.post("comboP.jsp", $("#data").serialize(), function (data) {
                    $("#i_UM").html(data);
                });
            }
        </script>
        <script>
            function TraerCodigo(codigo) {
                document.getElementById("txtCodigo").value = codigo;
            }
            function Guardar() {
                cod = document.getElementById("txtCodigo").value;
                mar = document.getElementById("txtMarca").value;
                mod = document.getElementById("i_modelo").value;
                um = document.getElementById("i_UM").value;
                des = document.getElementById("txtDescripcion").value;
                sto = document.getElementById("txtStock").value;
                datos = {codigo: cod, marca: mar, modelo: mod, um: um, descripcion: des, stock: sto};
                $.ajax({
                    data: datos,
                    type: 'POST',
                    url: "RegistrarPro.jsp",
                    success: function (data) {
                        location.reload();
                    }
                });
            }
        </script>
    </head>
    <body class="hold-transition sidebar-mini">
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("id_usuario") == null || session.getAttribute("id_usuario") == "0") {
                response.sendRedirect("Login.jsp");
            }
        %>
        <div class="wrapper">
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="Menu.jsp" class="nav-link">Inicio</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="LogOut.jsp" class="nav-link">Salir</a>
                    </li>
                </ul>
            </nav>
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <div class="sidebar">
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="info">
                            <a class="d-block">VOLCKER DEL PERU</a>
                        </div>
                    </div>
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">  
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-edit"></i>
                                    <p>
                                        Registros
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">   
                                    <li class="nav-item">
                                        <a href="rProducto.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registrar Producto</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="rMarca.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registrar Marca</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="rModelo.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registrar Modelo</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="rDocumentoExterno.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registrar Documento</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="rCliente.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registrar Cliente</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="rProveedor.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registrar Proveedor</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="rIngreso.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registrar Ingreso</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="rSalida.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registrar Salidas</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-table"></i>
                                    <p>
                                        Vistas
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="vProductos.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Ver Productos</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="vMarcas.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Ver Marcas</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="vModelos.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Ver Modelos</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="vDocumentos.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Ver Documentos</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="vClientes.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Ver Clientes</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="vProveedores.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Ver Proveedores</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="vRegistroIngreso.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Ver Registro de Ingreso</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="vRegistroSalida.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Ver Registro Salida</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon far fa-plus-square"></i>
                                    <p>
                                        Extras
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">   
                                    <li class="nav-item">
                                    <li class="nav-item">
                                        <a href="rEmpleado.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registro de Empleado</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="rUsuario.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Registro de Usuario</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Ver +
                                                <i class="fas fa-angle-left right"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item ">
                                                <a href="vEmpleados.jsp" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>Ver Empleados</p>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="vUsuarios.jsp" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>Ver Usuarios</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </aside>
            <div class="content-wrapper">
                <div class="content">
                    <section class="content-header">
                        <div class="col-sm-6">
                            <h1>Registro de Producto</h1>
                        </div>
                    </section>
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Nuevo Producto</h3>
                        </div>
                        <form class="form-horizontal" method="post" id="data">
                            <div class="card-body">
                                <div class="form-group row">
                                    <input type="hidden" name="f_opc" id="i_opc">
                                    <label class="col-sm-2 col-form-label">Codigo *</label>
                                    <div class="col-sm-2">
                                        <input readonly=»readonly» type="number" class="form-control obligatorio" id="txtCodigo">
                                    </div>
                                    <c:forEach var="i" items="${sqlidproducto.rows}">
                                        <div class="2">
                                            <button type="button" class="btn btn-info" onclick="TraerCodigo(${i.id_producto+1})">Generar Codigo</button>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="form-group row">
                                    <label for="txtMarca" class="col-sm-2 col-form-label">Marca *</label>
                                    <div class="col-sm-2">
                                        <select name="f_marca" id="txtMarca" onchange="combo_modelo()" class="form-control select2" style="width: 100%;" <jsp:include page="LiMarcas.jsp"/>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtModelo" class="col-sm-2 col-form-label">Modelo* </label>
                                    <div class="col-sm-2">
                                        <select name="f_modelo" onchange="combo_UM()" id="i_modelo" class="form-control select2" style="width: 100%;">
                                            <option value="0">- Seleccione Modelo -</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtUM" class="col-sm-2 col-form-label">U.M *</label> 
                                    <div class="col-sm-2">
                                        <select readonly=»readonly» name="f_UM" id="i_UM"  class="form-control select2" style="width: 100%;"></select>
                                    </div>
                                </div>  
                                <div class="form-group row">
                                    <label for="txtDescripcion" class="col-sm-2 col-form-label">Descripcion *</label>
                                    <div class="col-sm-2">
                                        <input type="text" class="form-control obligatorio" id="txtDescripcion" placeholder="Descripcion">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtStock" class="col-sm-2 col-form-label">Stock *</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control obligatorio" id="txtStock" placeholder="Stock">
                                    </div>
                                </div>
                                <div class="texto-errores">Los campos marcados con (*) Son obligatorios. </div>
                            </div>
                            <div class="card-footer">
                                <button type="button" id="btnGuardar" class="btn btn-info">Registrar</button>
                                <button type="submit" class="btn btn-default float-right">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <footer class="main-footer">
                <strong>Copyright &copy; 2021-2021</strong>
                Todos los derechos reservados.
                <div class="float-right d-none d-sm-inline-block">
                    <b>Version</b> 2.0
                </div>
            </footer>
        </div>
        <script src="plugins/jquery/jquery.min.js"></script>
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="dist/js/adminlte.js"></script>
    </body>
</html>
