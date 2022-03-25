<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:query var="sqlidsalida" dataSource="jdbc/calprusof">
    select max(id_salida)as id_salida from salidap
</sql:query> 
<sql:query var="sqlproducto" dataSource="jdbc/calprusof">
    select T1.id_producto,T1.des_producto,T2.nom_marca,T3.nom_mod,T3.um_mod,T1.stock_producto
    from producto T1
    inner join marca T2 on T2.id_marca=T1.id_marca
    inner join modelo T3 on T3.id_modelo=T1.id_modelo
    ORDER BY T1.id_producto ASC;
</sql:query>
<sql:query var="sqlcliente" dataSource="jdbc/calprusof">
    select id_clientes, nom_cliente, dni_cliente from clientes;
</sql:query>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>VKR | Salida</title>
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="CSS/adminlte.min.css">   
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/es-mx.min.js"></script>
        <script src="js/BuscadorTabla.js" type="text/javascript" ></script> 
        <script src="js/BuscarTabla2.js" type="text/javascript" ></script> 
        <script>
            function TraerCodigo(codigo) {
                document.getElementById("txtCodigoS").value = codigo;
            }
            function ElegirCliente(cod, nom, dni) {
                document.getElementById("txtCodigoC").value = cod;
                document.getElementById("txtNombreC").value = nom;
                document.getElementById("txtDNIC").value = dni;
                $("#BuscarCliente").modal("hide");
            }
            function ElegirProducto(cod, des, mar, mod, um, stock) {
                document.getElementById("txtCodigoP").value = cod;
                document.getElementById("txtDescripcion").value = des;
                document.getElementById("txtMarca").value = mar;
                document.getElementById("txtModelo").value = mod;
                document.getElementById("txtUM").value = um;
                document.getElementById("txtStock").value = stock;
                $("#BuscarProducto").modal("hide");
            }
        </script>
    </head>
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("id_usuario") == null || session.getAttribute("id_usuario") == "0") {
            response.sendRedirect("Login.jsp");
        }
    %>
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
                        <div class="col-sm-6">
                            <h4>Registro de Salida de Productos</h4>
                        </div>
                    </section>
                    <div class="card card-info">
                        <form id="FormSalida">
                            <div class="card-body">
                                <div class="form-group-lg row">
                                    <label for="txtCodigo" class="col-sm-auto col-form-label">CODIGO DE SALIDA:</label>
                                    <div class="col-sm-9">
                                        <input readonly=»readonly» type="text" class="form-control text-center" id="txtCodigoS">
                                    </div>                                                           
                                    <c:forEach var="i" items="${sqlidsalida.rows}">
                                        <div class="col-sm-auto">
                                            <button type="button" class="btn btn-info" onclick="TraerCodigo(${i.id_salida+1})">Generar Codigo</button>
                                        </div>
                                    </c:forEach>
                                    <label for="txtAlmacen2" class="col-sm-auto col-form-label">ALMACEN:</label>
                                    <div class="col-sm-auto">
                                        <input  id="txtAlmacenS" type="text"  class="form-control text-center" readonly="readonly" value="Almacen 1">
                                    </div>
                                    <label for="txtCodigo" class="col-sm-auto col-form-label">FECHA DE SALIDA:</label>
                                    <div class="col-sm-auto">
                                        <input  id="txtFechaS" name="fechaa" type="text"  class="form-control text-center" readonly="readonly">
                                    </div> 
                                    <label for="txtNombreU" class="col-sm-auto col-form-label">USUARIO:</label>
                                    <div class="col-sm-1">
                                        <input type="hidden" class="form-control text-center" id="txtCodigoE" value="${id_usuario}">
                                        <input readonly=»readonly» type="text" class="form-control text-center" id="txtNombreE" value="${nom_usu}">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="card-body">
                                <div class="form-group-lg row">
                                    <input type="hidden" class="form-control text-center" id="txtCodigoC">
                                    <label for="txtNombreC" class="col-sm-auto col-form-label">NOMBRE O RAZON SOCIAL:</label>
                                    <div class="col-sm-2">
                                        <input readonly=»readonly» type="text" class="form-control" id="txtNombreC">
                                    </div>
                                    <label for="txtDNIC" class="col-sm-auto col-form-label">DNI ó RUC:</label>
                                    <div class="col-sm-2">
                                        <input readonly=»readonly» type="text" class="form-control" id="txtDNIC">
                                    </div>
                                    <div class="col-sm-auto">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#BuscarCliente">Buscar Cliente</button>
                                    </div>
                                </div>
                            </div>                           
                            <hr>
                            <div class="card-body">
                                <div class="form-group-sm row">
                                    <input type="hidden" name="f_opc" id="i_opc">
                                    <input readonly=»readonly» type="hidden" class="form-control text-center" id="txtCodigoP">
                                    <label for="txtDescripcion" class="col-sm-auto col-form-label">DESCRIPCION:</label>
                                    <div class="col-sm-1">
                                        <input readonly=»readonly» type="text" class="form-control" id="txtDescripcion">
                                    </div>
                                    <label for="txtMarca" class="col-sm-auto col-form-label">MARCA:</label>
                                    <div class="col-sm-1">
                                        <input readonly=»readonly» type="text" class="form-control" id="txtMarca">
                                    </div>
                                    <label for="txtModelo" class="col-sm-auto col-form-label">MODELO:</label>
                                    <div class="col-sm-1">
                                        <input readonly=»readonly» type="text" class="form-control" id="txtModelo">
                                    </div>
                                    <label for="txtUM" class="col-sm-auto col-form-label">U.M:</label>
                                    <div class="col-sm-1">
                                        <input style="width: 90px;" readonly=»readonly» type="text" class="form-control" id="txtUM">
                                    </div>
                                    <label  class="col-sm-auto col-form-label">STOCK ACTUAL:</label>
                                    <div class="col-sm-1">
                                        <input readonly=»readonly» type="text" class="form-control text-center" id="txtStock">
                                    </div>
                                    <label for="txtCantidad" class="col-sm-auto col-form-label">CANTIDAD:</label>
                                    <div class="col-sm-1">
                                        <input style="width: 90px;" type="number" class="form-control text-center" id="txtCantidad" min="0">
                                    </div>
                                    <div class="col-sm-auto">
                                        <button type="button" id="btnGuardar" class="btn btn-info" data-toggle="modal" data-target="#BuscarProducto">Buscar Producto</button>
                                    </div>  
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-primary" onclick="addList()">Agregar Producto</button>
                                <button type="submit" class="btn btn-success">Registrar Salida</button>
                            </div>    
                            <div class="card-body">
                                <hr>
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 20px;">#</th>
                                            <th style="width: 90px;">Codigo</th>
                                            <th style="width: 300px;">Descripcion</th>
                                            <th style="width: 200px;">Marca</th>
                                            <th style="width: 200px;">Modelo</th>
                                            <th style="width: 100px;">U.M</th>                                         
                                            <th style="width: 100px;">Cantidad</th>
                                            <th style="width: 100px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableBody">

                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal fade" id="BuscarCliente">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Seleccionar Cliente</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table id="datos" method="post" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 90px;">Codigo</th>
                                            <th style="width: 300px;">Nombre</th>
                                            <th style="width: 200px;">DNI o RUC</th>
                                            <th colspan="1" style="width: 300px;">
                                                <input size=10 type="text" name="table_search" id="searchTerm" onkeyup="doSearch()" class="form-control float-right" placeholder="Buscar">
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" items="${sqlcliente.rows}">
                                            <tr>
                                                <td>${i.id_clientes}</td>
                                                <td>${i.nom_cliente}</td>
                                                <td>${i.dni_cliente}</td>
                                                <td>
                                                    <button type="button" class="btn btn-block btn-info btn-sm" onclick="ElegirCliente(${i.id_clientes}, '${i.nom_cliente}', ${i.dni_cliente})">Seleccionar</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="BuscarProducto">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Seleccionar Producto</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <table id="datos2" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="width: 90px;">Codigo</th>
                                            <th style="width: 200px;">Descripcion</th>
                                            <th style="width: 200px;">Marca</th>
                                            <th style="width: 200px;">Modelo</th>
                                            <th style="width: 100px;">U.M</th>
                                            <th style="width: 100px;">STOCK</th>
                                            <th colspan="1">
                                                <input size=10 type="text" name="table_search" id="searchTerm2" onkeyup="doSearch2()" class="form-control float-right" placeholder="Buscar">
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" items="${sqlproducto.rows}">
                                            <tr>
                                                <td>${i.id_producto}</td>
                                                <td>${i.des_producto}</td>
                                                <td>${i.nom_marca}</td>
                                                <td>${i.nom_mod}</td>
                                                <td>${i.um_mod}</td>
                                                <td>${i.stock_producto}</td>
                                                <td>
                                                    <button type="button" class="btn btn-block btn-info btn-sm" onclick="ElegirProducto(${i.id_producto}, '${i.des_producto}', '${i.nom_marca}', '${i.nom_mod}', '${i.um_mod}',${i.stock_producto})">Seleccionar</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
        <script type="text/javascript">
            $('input[name="fechaa"]').val(moment().format('YYYY-MM-DD'));
        </script>
        <script>
            let arrayList = [];
            $('#FormSalida').submit(function (e) {
                e.preventDefault();
                if (arrayList.length > 0) {
                    let form = {
                        action: 'Guardar',
                        idsalida: $("#txtCodigoS").val(),
                        almacen: $("#txtAlmacenS").val(),
                        fechas: $("#txtFechaS").val(),
                        codem: $("#txtCodigoE").val(),
                        codcl: $("#txtCodigoC").val(),
                        productos: JSON.stringify(arrayList)
                    };
                    $.ajax({
                        type: "post",
                        url: "SalidaControlador",
                        data: form,
                        success: function (response) {
                            let res = $.trim(response);
                            if (res === "OK") {
                                alert("Registro Guardado Correctamente");
                                location.reload();
                            } else {
                                alert(res);
                            }
                        }
                    });
                } else {
                    alert("No se ha registrado ningun producto");
                }
            });
            function addList() {
                let stock = parseInt($('#txtStock').val());
                let can = parseInt($('#txtCantidad').val());
                if (can < 0) {
                    alert("Ingrese una cantidad mayor a 0");
                    return;
                } else if (stock < can) {
                    alert("Stock insuficiente");
                    return;
                }
                if ($('#txtCodigoP').val() !== "" && $('#txtCantidad').val() !== "") {
                    let lista = {
                        p_codigo: $('#txtCodigoP').val(),
                        p_descripcion: $('#txtDescripcion').val(),
                        p_marca: $('#txtMarca').val(),
                        p_modelo: $('#txtModelo').val(),
                        p_um: $('#txtUM').val(),
                        p_stock: $('#txtStock').val(),
                        p_cantidad: parseInt($('#txtCantidad').val())
                    };
                    arrayList.push(lista);
                    showLista();
                    $('#txtCodigoP').val("");
                    $('#txtDescripcion').val("");
                    $('#txtMarca').val("");
                    $('#txtModelo').val("");
                    $('#txtUM').val("");
                    $('#txtStock').val("");
                    $('#txtCantidad').val("");
                } else {
                    alert("Debe completar todos los campos!");
                }
            }
            function showLista() {
                let list = '';
                for (let i = 0; i < arrayList.length; i++) {
                    let obj = arrayList[i];
                    list += `
                    <tr>
                        <td>` + (i + 1) + `</td>
                        <td class="text-center">` + obj.p_codigo + `</td>
                        <td>` + obj.p_descripcion + `</td>
                        <td>` + obj.p_marca + `</td>
                        <td>` + obj.p_modelo + `</td>
                        <td>` + obj.p_um + `</td>
                        <td>` + obj.p_cantidad + `</td>
                        <td><button type="button" class="btn btn-block btn-warning btn-sm" onclick="eliminarList()">Eliminar</button></td>
                    </tr>`;
                }
                $("#tableBody").html(list);
            }
            function eliminarList(indice) {
                arrayList.splice(indice, 1);
                showLista();
            }
        </script>
    </body>
</html>

