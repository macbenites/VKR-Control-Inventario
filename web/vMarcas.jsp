<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:query var="sqlmarcas" dataSource="jdbc/calprusof">
    select id_marca, nom_marca, proce_marca from marca
</sql:query>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>VKR | Lista de Marcas</title>
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="CSS/adminlte.min.css">
        <script src="js/BuscadorTabla.js" type="text/javascript" ></script> 
        <link href="CSS/index.css" rel="stylesheet"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/vMarca.js"></script>
        <script>
            function Editar(cod, nom, pro) {
                document.getElementById("titulomodal").innerHTML = "Marca: " + nom;
                document.getElementById("textoGuardar").innerHTML = "Actualizar Marca";
                document.getElementById("txtCodigo").value = cod;
                document.getElementById("txtNombre").value = nom;
                document.getElementById("txtProcedencia").value = pro;
                document.getElementById("opc").value = 2;
                document.getElementById("btnGuardar").className = "btn btn-block btn-outline-success";
                $("#modal-datos").modal("show");
            }
            function Eliminar(cod, nom, pro) {
                document.getElementById("titulomodal").innerHTML = "Eliminar Marca: " + nom;
                document.getElementById("textoGuardar").innerHTML = "Eliminar Marca";
                document.getElementById("txtCodigo").value = cod;
                document.getElementById("txtNombre").value = nom;
                document.getElementById("txtProcedencia").value = pro;
                document.getElementById("opc").value = 3;
                document.getElementById("btnGuardar").className = "btn btn-block btn-outline-success";
                $("#modal-datos").modal("show");
            }
            function Guardarm() {
                cod = document.getElementById("txtCodigo").value;
                nom = document.getElementById("txtNombre").value;
                pro = document.getElementById("txtProcedencia").value;
                op = document.getElementById("opc").value;
                datos = {codigo: cod, nombre: nom, proce: pro, opc: op};
                $.ajax({
                    data: datos,
                    type: 'POST',
                    url: "MantenimientovMa.jsp",
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
                        <div class="row">
                            <div class="col">
                                <h1>Lista de Marcas</h1>
                            </div>
                        </div>
                    </section>
                    <table id="datos" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th><th>Nombre</th><th>Procedencia</th><th colspan="2"><input size=10 type="text" name="table_search" id="searchTerm" onkeyup="doSearch()" class="form-control float-right" placeholder="Buscar"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${sqlmarcas.rows}">
                                <tr>
                                    <td>${i.id_marca}</td>
                                    <td>${i.nom_marca}</td>
                                    <td>${i.proce_marca}</td>
                                    <td>
                                        <button type="button" class="btn btn-block btn-info btn-sm" onclick="Editar(${i.id_marca}, '${i.nom_marca}', '${i.proce_marca}')">Editar</button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-block btn-warning btn-sm" onclick="Eliminar(${i.id_marca}, '${i.nom_marca}', '${i.proce_marca}')">Eliminar</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.container-fluid -->
                <div class="modal fade" id="modal-datos">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"> <span id="titulomodal">...</span> </h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" id="opc">
                                <div class="form-group">
                                    <label for="txtCodigo">Codigo</label>
                                    <input readonly=�readonly� type="number" class="form-control" id="txtCodigo" placeholder="Ingrese Codigo">
                                </div>
                                <div class="form-group">
                                    <label for="txtNombre">Nombre *</label>
                                    <input type="text" class="form-control obligatorio" id="txtNombre" placeholder="Ingrese Nombre">
                                </div>
                                <div class="form-group">
                                    <label for="txtProcedencia">Procedencia *</label>
                                    <input type="text" class="form-control obligatorio" id="txtProcedencia" placeholder="Ingrese Procedencia">
                                </div>
                                <div class="texto-errores">Los campos marcados con (*) Son obligatorios. </div>
                                <div class="modal-footer justify-content-between">
                                    <button type="button" class="btn btn-block btn-outline-info" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-primary" id="btnGuardar" onclick="Guardar()"><span id="textoGuardar">Grabar</span></button> 
                                </div>
                                </form>
                            </div>
                        </div>
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
