$(window).ready(function () {
    $("#btnGuardar").click(function () {
        validarFormulario();
    });
});
var validarFormulario = function () {
    var str_errores = "";
    //reiniciar el campo de errores
    $(".texto-errores").html("");
    //validar campos obligatorios
    $(".obligatorio").each(function () {
        if (!validarCampoObligtaorio($(this).val())) {
            str_errores = "* Los campos obligatorios no pueden estar vacios<br/>";
        }
    });
    //validar formato campos obligatorios
    if (!validarCampoNombre($("#txtNombre").val())) {
        str_errores = str_errores + "* El campo NOMBRE no puede contener numeros.<br/>";
    }
    if (!validarCampoApellidoP($("#txtApePat").val())) {
        str_errores = str_errores + "* El campo Apellido Paterno no puede contener numeros.<br/>";
    }
    if (!validarCampoApellidoM($("#txtApeMat").val())) {
        str_errores = str_errores + "* El campo Apellido Materno no puede contener numeros.<br/>";
    }
    if (!validarCampoDNI($("#txtDNI").val())) {
        str_errores = str_errores + "* El DNI tiene que tener 8 digitos<br/>";
    }
    if (!validarCampoDepartamento($("#i_Departamento").val())) {
        str_errores = str_errores + "* Debe elegir un Departamento<br/>";
    }
    if (!validarCampoProvincia($("#i_provincia").val())) {
        str_errores = str_errores + "* Debe elegir una Provincia<br/>";
    }
    if (!validarCampoDistrito($("#i_distrito").val())) {
        str_errores = str_errores + "* Debe elegir un Distrito<br/>";
    }
    if (!validarCampoTelefono($("#txtTelefono").val())) {
        str_errores = str_errores + "* El Telefono tiene que tener 9 numeros<br/>";
    }
    if (str_errores == "") {
        alert("Empleado Actualizado Correctamente.");
        $("#modal-datos").modal("hide");
        Guardarr();
    } else {
        $(".texto-errores").html(str_errores);
    }
}
var validarCampoObligtaorio = function (campoP) {
    var es_completo = true;
    //validar que no está completamente vacío
    if (campoP.length == 0) {
        es_completo = false;
    }
    //validar que no son solamente espacios
    if (campoP.split(" ").join("").length == 0) {
        es_completo = false;
    }
    return es_completo;
}
var validarCampoNombre = function (txtNombre) {
    var es_nombre = true;
    //validar que no tiene ningun numero
    for (var i = 0; i < txtNombre.length; i++) {
        if ($.isNumeric(txtNombre[i])) {
            es_nombre = false;
        }
    }
    return es_nombre;
}
var validarCampoApellidoP = function (txtApePat) {
    var es_nombre = true;
    //validar que no tiene ningun numero
    for (var i = 0; i < txtApePat.length; i++) {
        if ($.isNumeric(txtApePat[i])) {
            es_nombre = false;
        }
    }
    return es_nombre;
}
var validarCampoApellidoM = function (txtApeMat) {
    var es_nombre = true;
    //validar que no tiene ningun numero
    for (var i = 0; i < txtApeMat.length; i++) {
        if ($.isNumeric(txtApeMat[i])) {
            es_nombre = false;
        }
    }
    return es_nombre;
}
var validarCampoDNI = function (txtDNI) {
    var es_dni = true;
    //validar que tiene 11 digitos
    if (txtDNI.length != 8) {
        es_dni = false;
    }
    return es_dni
}
var validarCampoDepartamento = function (i_Departamento) {
    var es_completo = true;

    if (i_Departamento == '0') {
        es_completo = false;
    }
    return es_completo;
}
var validarCampoProvincia = function (i_provincia) {
    var es_completo = true;

    if (i_provincia == '0') {
        es_completo = false;
    }
    return es_completo;
}
var validarCampoDistrito = function (i_distrito) {
    var es_completo = true;

    if (i_distrito == '0') {
        es_completo = false;
    }
    return es_completo;
}
var validarCampoTelefono = function (txtTelefono) {
    var es_telefono = true;
    //validar que tiene  9 digitos
    if (txtTelefono.length != 9) {
        es_telefono = false;
    }
    return es_telefono;
}
