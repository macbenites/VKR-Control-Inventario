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
	if(!validarCampoNombre($("#txtNombre").val())){
		str_errores = str_errores + "* El campo NOMBRE no puede contener numeros.<br/>";
	}
	if(!validarCampoProcedencia($("#txtProcedencia").val())){
		str_errores = str_errores + "* El campo PROCEDENCIA no puede contener numeros.";
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
var validarCampoNombre = function(txtNombre){
	var es_nombre = true;
	//validar que no tiene ningun numero
	for(var i = 0; i < txtNombre.length; i++){
		if($.isNumeric(txtNombre[i])){
			es_nombre = false;
		}
	}
	return es_nombre;
}
var validarCampoProcedencia = function(txtProcedencia){
	var es_apellidos = true;
	//validar que no tiene ningun numero
	for(var i = 0; i < txtProcedencia.length; i++){
		if($.isNumeric(txtProcedencia[i])){
			es_apellidos = false;
		}
	}
	return es_apellidos;
}
