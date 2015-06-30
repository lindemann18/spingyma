
var miModulo = angular.module("Methods", []);

 	miModulo.service('$methodsService', function($location){
    	
		this.alerta = function(tipo_cambio,texto)
		{
			// Los tipos de cambio serán 1 y 2
			// 1) cuando la alerta es verde, mostrando algo positivo.
			// 2) cuando la alerta es roja, mostrando algo negativo, como errores.
			switch(tipo_cambio)
			{
				case 1:
				//Aquí la alerta se vuelve positiva.
				if($("#alerta").hasClass("alert-danger"))
				{
					$("#alerta").removeClass("alert-danger");
					$("#alerta").addClass("alert-success");
				}//if
				break;

				case 2:
				//Aquí la alerta se vuelve negativa.
				if($("#alerta").hasClass("alert-success"))
				{
					$("#alerta").removeClass("alert-success");
					$("#alerta").addClass("alert-danger");
				}//if
				break;
			} // switch

			$("#ErrorTexto").text(texto);
			$("#alerta").css("display","inherit");
			$("#alerta").fadeOut(5000);
			//
		};

		this.Json = function(accion,id)
		{
			Arr           = new Object();
			Arr['Accion'] = accion;
			Arr['id'] 	  = id;
			params        = JSON.stringify(Arr);
			return params;
		};

		this.Redirigir = function(direcction)
		{
			$location.path('/'+direcction).search({});
		};
    })	
