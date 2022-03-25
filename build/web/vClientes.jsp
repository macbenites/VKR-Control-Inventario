<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="sqlclientes" dataSource="jdbc/calprusof">
    select T1.id_clientes,T1.nom_cliente,T1.dni_cliente,T2.IdDepartamento,T2.Departamento,T3.IdProvincia,T3.Provincia,T4.IdDistritos,T4.Distrito,T1.direccion_cliente,T1.telefono_cliente
    from clientes T1
    inner join departamentos T2 on T2.IdDepartamento=T1.IdDepartamento
    inner join provincias T3 on T3.IdProvincia=T1.IdProvincia
    inner join distritos T4 on T4.IdDistritos=T1.IdDistrito
    ORDER BY T1.id_clientes ASC;
</sql:query>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>VKR | Lista de Clientes</title>
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="CSS/adminlte.min.css">
        <script src="js/BuscadorTabla.js" type="text/javascript" ></script> 
        <link href="CSS/index.css" rel="stylesheet"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/vCliente.js" type="text/javascript"></script>
        <script>
            function Editar(cod, nom, dni, dep, pro, dis, dir, tel) {
                document.getElementById("titulomodal").innerHTML = "Cliente: " + nom;
                document.getElementById("textoGuardar").innerHTML = "Actualizar Cliente";
                document.getElementById("txtCodigo").value = cod;
                document.getElementById("txtNombre").value = nom;
                document.getElementById("txtDNI").value = dni;
                document.getElementById("i_Departamento").value = dep;
                document.getElementById("i_provincia").value = pro;
                document.getElementById("i_distrito").value = dis;
                document.getElementById("txtDireccion").value = dir;
                document.getElementById("txtTelefono").value = tel;
                document.getElementById("opc").value = 2;
                document.getElementById("btnGuardar").className = "btn btn-block btn-outline-success";
                $("#modal-datos").modal("show");
            }
            function Eliminar(cod, nom, dni, dep, pro, dis, dir, tel) {
                document.getElementById("titulomodal").innerHTML = "Eliminar Cliente " + nom;
                document.getElementById("textoGuardar").innerHTML = "Eliminar Cliente";
                document.getElementById("txtCodigo").value = cod;
                document.getElementById("txtNombre").value = nom;
                document.getElementById("txtDNI").value = dni;
                document.getElementById("i_Departamento").value = dep;
                document.getElementById("i_provincia").value = pro;
                document.getElementById("i_distrito").value = dis;
                document.getElementById("txtDireccion").value = dir;
                document.getElementById("txtTelefono").value = tel;
                document.getElementById("opc").value = 3;
                document.getElementById("btnGuardar").className = "btn btn-block btn-outline-success";
                $("#modal-datos").modal("show");
            }
            function Guardarcli() {
                cod = document.getElementById("txtCodigo").value;
                nom = document.getElementById("txtNombre").value;
                dni = document.getElementById("txtDNI").value;
                dep = document.getElementById("i_Departamento").value;
                pro = document.getElementById("i_provincia").value;
                dis = document.getElementById("i_distrito").value;
                dir = document.getElementById("txtDireccion").value;
                tel = document.getElementById("txtTelefono").value;
                op = document.getElementById("opc").value;
                datos = {codigo: cod, nombre: nom, dni: dni, dep: dep, pro: pro, dis: dis, dir: dir, tel: tel, opc: op};
                $.ajax({
                    data: datos,
                    type: 'POST',
                    url: "MantenimientoCliente.jsp",
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
                                <h1>Lista de Clientes</h1>
                            </div>
                        </div>
                    </section>
                    <table id="datos" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 70px;">Codigo</th><th>Nombre</th><th>DNI</th><th>Departamento</th><th>Provincia</th><th>Distrito</th><th>Direccion</th><th>Telefono</th><th colspan="2"><input size=10 type="text" name="table_search" id="searchTerm" onkeyup="doSearch()" class="form-control float-right" placeholder="Buscar"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${sqlclientes.rows}">
                                <tr>
                                    <td>${i.id_clientes}</td>
                                    <td>${i.nom_cliente}</td>
                                    <td>${i.dni_cliente}</td>
                                    <td>${i.Departamento}</td>
                                    <td>${i.Provincia}</td>
                                    <td>${i.Distrito}</td>
                                    <td>${i.direccion_cliente}</td>
                                    <td>${i.telefono_cliente}</td>
                                    <td>
                                        <button type="button" class="btn btn-block btn-info btn-sm" onclick="Editar(${i.id_clientes}, '${i.nom_cliente}',${i.dni_cliente}, '${i.IdDepartamento}', '${i.IdProvincia}', '${i.IdDistritos}', '${i.direccion_cliente}',${i.telefono_cliente})">Editar</button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-block btn-warning btn-sm" onclick="Eliminar(${i.id_clientes}, '${i.nom_cliente}',${i.dni_cliente}, '${i.IdDepartamento}', '${i.IdProvincia}', '${i.IdDistritos}', '${i.direccion_cliente}',${i.telefono_cliente})">Eliminar</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
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
                                    <input readonly=»readonly» type="number" class="form-control" id="txtCodigo" placeholder="Ingrese Codigo">
                                </div>
                                <div class="form-group">
                                    <label for="txtNombre">Nombre</label>
                                    <input type="text" class="form-control" id="txtNombre" placeholder="Ingrese Nombre">
                                </div>
                                <div class="form-group">
                                    <label for="txtDNI">DNI</label>
                                    <input type="number" class="form-control" id="txtDNI" placeholder="Ingrese DNI">
                                </div>
                                <div class="form-group">
                                    <label for="txtDepartamento">Departamento</label>
                                    <jsp:include page="LiDepartamentos.jsp"/>
                                </div>
                                <div class="form-group">
                                    <label for="txtProvincia">Provincia</label>
                                    <jsp:include page="LiProvincias.jsp"/>
                                </div>
                                <div class="form-group">
                                    <label for="txtDistrito">Distrito</label>
                                    <jsp:include page="LiDistritos.jsp"/>
                                </div>
                                <div class="form-group">
                                    <label for="txtDireccion">Direccion</label>
                                    <input type="text" class="form-control" id="txtDireccion" placeholder="Ingrese Distrito">
                                </div>
                                <div class="form-group">
                                    <label for="txtTelefono">Telefono</label>
                                    <input type="number" class="form-control" id="txtTelefono" placeholder="Ingrese Telefono">
                                </div>
                                <div class="texto-errores">Los campos marcados con (*) Son obligatorios. </div>
                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-block btn-outline-info" data-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-primary" id="btnGuardar" onclick="Guardar()"><span id="textoGuardar">Grabar</span></button> 
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


