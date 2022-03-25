<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:query var="sqlproducto" dataSource="jdbc/calprusof">
    select T1.id_producto,T2.id_marca,T2.nom_marca,T2.proce_marca,T3.id_modelo,T3.nom_mod,T3.um_mod,T1.des_producto,T1.stock_producto
    from producto T1
    inner join marca T2 on T2.id_marca=T1.id_marca
    inner join modelo T3 on T3.id_modelo=T1.id_modelo
    ORDER BY T1.id_producto ASC;
</sql:query>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>VKR | Lista de Productos</title>
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="CSS/adminlte.min.css">
        <script src="js/BuscadorTabla.js" type="text/javascript" ></script> 
        <link href="CSS/index.css" rel="stylesheet"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/vProducto.js" type="text/javascript"></script>
        <script>
            function Editar(cod, mar, mod, um, des, st) {
                document.getElementById("titulomodal").innerHTML = "Producto " + mar;
                document.getElementById("textoGuardar").innerHTML = "Actualizar Producto";
                document.getElementById("txtCodigo").value = cod;
                document.getElementById("txtMarca").value = mar;
                document.getElementById("txtModelo").value = mod;
                document.getElementById("txtUM").value = um;
                document.getElementById("txtDescripcion").value = des;
                document.getElementById("txtStock").value = st;
                document.getElementById("opc").value = 2;
                document.getElementById("btnGuardar").className = "btn btn-block btn-outline-success";
                $("#modal-datos").modal("show");
            }
            function Eliminar(cod, mar, mod, um, des, st) {
                document.getElementById("titulomodal").innerHTML = "Eliminar Producto " + mar;
                document.getElementById("textoGuardar").innerHTML = "Eliminar Producto";
                document.getElementById("txtCodigo").value = cod;
                document.getElementById("txtMarca").value = mar;
                document.getElementById("txtModelo").value = mod;
                document.getElementById("txtUM").value = um;
                document.getElementById("txtDescripcion").value = des;
                document.getElementById("txtStock").value = st;
                document.getElementById("opc").value = 3;
                document.getElementById("btnGuardar").className = "btn btn-block btn-outline-success";
                $("#modal-datos").modal("show");
            }
            function Guardarp() {
                cod = document.getElementById("txtCodigo").value;
                des = document.getElementById("txtDescripcion").value;
                st = document.getElementById("txtStock").value;
                op = document.getElementById("opc").value;
                datos = {codigo: cod, descripcion: des, stock: st, opc: op};
                $.ajax({
                    data: datos,
                    type: 'POST',
                    url: "MantenimientovPro.jsp",
                    success: function (data) {
                        location.reload();
                    }
                });
            }
        </script>
    </head>
    <body class="hold-transition sidebar-mini">

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
                                <h1>Lista de Productos</h1>
                            </div>
                        </div>
                    </section>
                    <table id="datos" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th><th>Descripcion</th><th>Marca</th><th>Modelo</th><th>Procedencia</th><th>U.M</th><th>Stock</th><th colspan="2"><input size=10 type="text" name="table_search" id="searchTerm" onkeyup="doSearch()" class="form-control float-right" placeholder="Buscar"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="i" items="${sqlproducto.rows}">
                                <tr>
                                    <td >${i.id_producto}</td>
                                    <td>${i.des_producto}</td>
                                    <td>${i.nom_marca}</td>
                                    <td>${i.nom_mod}</td>
                                    <td>${i.proce_marca}</td>
                                    <td>${i.um_mod}</td>
                                    <td>${i.stock_producto}</td>
                                    <td>
                                        <button type="button" class="btn btn-block btn-info btn-sm" onclick="Editar(${i.id_producto}, '${i.nom_marca}', '${i.nom_mod}', '${i.um_mod}', '${i.des_producto}', ${i.stock_producto})">Editar</button>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-block btn-warning btn-sm" onclick="Eliminar(${i.id_producto}, '${i.nom_marca}', '${i.nom_mod}', '${i.um_mod}', '${i.des_producto}', ${i.stock_producto})">Eliminar</button>
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
                                    <input readonly=»readonly» type="text" class="form-control" id="txtCodigo">
                                </div>
                                <div class="form-group">
                                    <label for="txtMarca">Marca</label>
                                    <input readonly=»readonly» type="text" class="form-control" id="txtMarca">
                                </div>
                                <div class="form-group">
                                    <label for="txtModelo">Modelo</label>
                                    <input readonly=»readonly» type="text" class="form-control" id="txtModelo">
                                </div>
                                <div class="form-group">
                                    <label for="txtUM">U.M</label>
                                    <input readonly=»readonly» type="text" class="form-control" id="txtUM">
                                </div>
                                <div class="form-group">
                                    <label for="txtDescripcion">Descripcion *</label>
                                    <input type="text" class="form-control obligatorio" id="txtDescripcion">
                                </div>
                                <div class="form-group">
                                    <label for="txtStock">Stock *</label>
                                    <input type="number"  min="0" class="form-control obligatorio" id="txtStock">
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
