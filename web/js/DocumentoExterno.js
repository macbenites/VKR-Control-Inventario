$(window).ready(function(){
	$("#btnGuardar").click(function(){
		validarFormulario();
	});
});
var validarFormulario = function(){
	var str_errores = "";
	//reiniciar el campo de errores
	$(".texto-errores").html("");
	//validar campos obligatorios
	$(".obligatorio").each(function(){
		if(!validarCampoObligtaorio($(this).val())){
			str_errores = "* Los campos obligatorios no pueden estar vacios<br/>";
		}
	});
	//validar formato campos obligatorios
	if(!validarCampoProveedor($("#selPro").val())){
		str_errores = str_errores + "* Debe elegir un Proveedor<br/>";
	}
        if(!validarCampoDocumento($("#txtTipoDocumento").val())){
		str_errores = str_errores + "* Debe elegir un tipo de Documento<br/>";
	}
	if(str_errores == ""){
		alert("REGISTRADO CORRECTAMENTE");	
                Guardar();
	}else{
		$(".texto-errores").html(str_errores);
	}
}
var validarCampoObligtaorio = function(campoP){
	var es_completo = true;
	//validar que no está completamente vacío
	if(campoP.length == 0){
		es_completo = false;
	}
	//validar que no son solamente espacios
	if(campoP.split(" ").join("").length == 0){
		es_completo = false;
	}
	return es_completo;
}

var validarCampoProveedor = function (selPro){
    var es_completo = true;
    
    if(selPro == '0'){
        es_completo = false;
    }    
    return es_completo;
}
var validarCampoDocumento = function (txtTipoDocumento){
    var es_completo = true;
    
    if(txtTipoDocumento == '0'){
        es_completo = false;
    }    
    return es_completo;
}

