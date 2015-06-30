// JavaScript Document
//VARIABLES DE MENSAJE (TITULOS)
var texito 			= '<h3>ÉXITO</h3>';
var tfallo 			= '<h3>OPPS!</h3>';
var tguardado		= '<h3>PERFECTO!</h3>';
var teditado		= '<h3>EDITADO!</h3>';
var teliminado		= '<h3>ELIMINADO!</h3>';
var terror			= '<h3>OOPS, ERROR!</h3>';
var tfalloEnviar	= '<h3>OOPS, FALLO AL ENVIAR!</h3>';

//VARIABLES DE MENSAJE (CONTENIDO)
var exito 		= '<p>Operación realizada exitosamente.</p>';
var fallo 		= '<p>La operación no se ha podido llevar a cabo correctamente. Intente de nuevo.</p>';
var guardado	= '<p>Se ha guardado correctamente el registro.</p>';
var editado		= '<p>Se ha editado correctamente el regitro.</p>';
var eliminado	= '<p>Se ha eliminado correctamente el registro.</p>';
var error		= '<p>Ha ocurrido un error al ejecutar la operación. Intente de nuevo.</p>';
var falloEnviar = '<p>Ha ocurrido un error al enviar los datos. Intente de nuevo.</p>';
var redCatalogo	= 'En breve será redireccionado hacia el catalogo de ';
var modUsuario	= 'usuarios.';
var modCliente	= 'clientes.';


//Devuelve el número de día acorde al ingreso



//FUNCIONES QUE PINTAN UNA ALERTA DE DIFERENTES TIPOS, CON ESTILOS BOOTSTRAP...
//LAS FUNCIONES PUEDEN RECIBIR COMO mensaje CÓDIGO HTML.
//FUNCION ALERT
function alertBox(mensaje){
	bootbox.alert(mensaje);
}

//FUNCION CONFIRM
function confirmBox(mensaje){
	bootbox.confirm(mensaje);
}

//FUNCION PROMPT
function promptBox(mensaje, msjResultadoSiTrue, msjResultadoSiFalse){
	bootbox.prompt(mensaje, function(result) {                
	  	if (result === null) {                                             
			alertBox(msjResultadoSiFalse);
	  	} else {
			alertBox(msjResultadoSiTrue);
	  	}
	});
}


//FUNCION QUE NOS PERMITIRÁ HACER UN RESET DE UN FORMULARIO COMPLETO
jQuery.fn.reset = function () {
  $(this).each (function() { this.reset(); });
}


//FUNCION QUE NOS PERMITE LLENAR UN COMBO
//usese id vacio cuando el combo sea el padre inicial de varios
function llenarCombo(id, comboLlenar, ruta){
	$.post(
		'../../includes/'+ruta+'.php',
		{ eid: id},
		function(data){
			if( data != '' ){
				$('#'+comboLlenar).html('');
				$('#'+comboLlenar).html(data);
			}else if( data == '0' ){
				alert('POR FAVOR SELECCIONA UNA OPCION.');
			}
		}
	);
}


function checkRequeridos(accion, ruta){
	var contador 	= 0;
	var campo		= '';
	var	id			= '';
	var requeridas 	='';
	
	//PARA CADA ELEMENTO CON CLASE requerido
	$(".requerido").each(function(index){
		//SI EL VALOR DE ESTE ELEMENTO ES VACIO
		if ($(this).val() == '' ){
			contador++;									//AUMENTAMOS EN 1 A contador
			$(this).parent().addClass('has-error');		//AGREGAMOS AL DIV PADRE DEL ELEMENTO (CON CLASE requerido) LA CLASE has-error
			$(this).focus();							//LE PASAMOS EL FOCO AL ELEMENTO
			return false;								//RETORNAMOS UN FALSE PARA QUE NO SE EJECUTE EL SUBMIT
		}
		
		//SI EL DIV PADRE DEL ELEMENTO TIENE LA CLASE has-error Y EL VALOR DEL ELEMENTO CON CLASE REQUERIDO ES
		//DIFERENTE DE VACIO
		if( $(this).parent().hasClass('has-error') && $(this).val() != '' ){
			//REMOVEMOS LA CLASE has-error DEL DIV PADRE DEL ELEMENTO CON CLASE requerido
			$(this).parent().removeClass('has-error');
			//RESETEAMOS contador PARA QUE VUELVA A SER 0 Y NO AFECTE EN LA SIGUIENTE VALIDACION
			contador = 0;
		}
	});
	
	//SI CONTADOR (POR ALGUNA EXTRAÑA RAZON) ES DIFERENTE DE 0
	if( contador != 0 ){
		//RETORNAMOS FALSE PARA QUE NO SE EJECUTE EL SUBMIT
		return false;
	//SI NO EJECUTAMOS LA ACCION NECESITADA
	}else{
		if (accion == 'guardar' ){guardar(ruta)}			//GUARDAR UN REGISTRO
		if (accion == 'actualizar' ){actualizar(ruta)}		//ACTUALIZAR UN REGISTRO
	}
}