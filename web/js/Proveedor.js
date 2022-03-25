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
        if(!validarCampoRazonSocial($("#txtRazonSocial").val())){
		str_errores = str_errores + "* El campo NOMBRE no puede contener numeros.<br/>";
	}
        if(!validarCampoRUC($("#txtRuc").val())){
		str_errores = str_errores + "* El RUC tiene que tener 11 digitos<br/>";
	}
        if(!validarCampoRUC2($("#txtRuc").val())){
		str_errores = str_errores + "* El RUC tiene que comenzar con 20, 10, 17 o 15<br/>";
	}
	if(!validarCampoDepartamento($("#i_Departamento").val())){
		str_errores = str_errores + "* Debe elegir un Departamento<br/>";
	}
        if(!validarCampoProvincia($("#i_provincia").val())){
		str_errores = str_errores + "* Debe elegir una Provincia<br/>";
	}
        if(!validarCampoDistrito($("#i_distrito").val())){
		str_errores = str_errores + "* Debe elegir un Distrito<br/>";
	}
        if(!validarCampoTelefono($("#txtTelefono").val())){
		str_errores = str_errores + "* El Telefono tiene que tener 7 numeros<br/>";
	}
	if(str_errores == ""){
			
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
var validarCampoRazonSocial = function(txtRazonSocial){
	var es_nombre = true;
	//validar que no tiene ningun numero
	for(var i = 0; i < txtRazonSocial.length; i++){
		if($.isNumeric(txtRazonSocial[i])){
			es_nombre = false;
		}
	}
	return es_nombre;
}
var validarCampoRUC = function(txtRuc){
	var es_ruc = true;
	//validar que tiene 11 digitos
	if(txtRuc.length != 11){
		es_ruc = false;
	}
        return es_ruc;
}

var validarCampoRUC2 = function(txtRuc){
	var es_ruc = true;
	//validar que comienze con 20,10,17,15
	if(!txtRuc.startsWith("10",0) && !txtRuc.startsWith("20",0) && !txtRuc.startsWith("17",0) && !txtRuc.startsWith("15",0)){
            console.log("entro");
            es_ruc = false;
        }
        return es_ruc;
}

var validarCampoDepartamento = function (i_Departamento){
    var es_completo = true;
    
    if(i_Departamento == '0'){
        es_completo = false;
    }    
    return es_completo;
}
var validarCampoProvincia = function (i_provincia){
    var es_completo = true;
    
    if(i_provincia == '0'){
        es_completo = false;
    }    
    return es_completo;
}
var validarCampoDistrito = function (i_distrito){
    var es_completo = true;
    
    if(i_distrito == '0'){
        es_completo = false;
    }    
    return es_completo;
}
var validarCampoTelefono = function(txtTelefono){
	var es_telefono = true;
	//validar que tiene 7 o 9 digitos
	if(txtTelefono.length != 7){
			es_telefono = false;
	}
        return es_telefono;
}
