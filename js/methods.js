
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

		this.dias = function()
		{
			dias = [];
			for(i=1; i<32; i++)
			{
				var dia = new Object();
				dia['dia'] = i.toString();
				dia['num'] = i.toString();
				dias.push(dia);
			}//for;
			return dias;
		}///dias

		this.meses = function()
		{
			var meses = [];
			
			for(i=1; i<12; i++)
			{
				switch(i)
				{
					case 1:
						var mes = new Object();
						mes['num'] = (1).toString();
						mes['mes'] = "Enero";
						meses.push(mes);
					break;

					case 2:
						var mes = new Object();
						mes['num'] = (2).toString();
						mes['mes'] = "Febrero";
						meses.push(mes);
					break;

					case 3:
						var mes = new Object();
						mes['num'] = (3).toString();
						mes['mes'] = "Marzo";
						meses.push(mes);
					break;

					case 4:
						var mes = new Object();
						mes['num'] = (4).toString();
						mes['mes'] = "Abril";
						meses.push(mes);
					break;

					case 5:
						var mes = new Object();
						mes['num'] = (5).toString();
						mes['mes'] = "Mayo";
						meses.push(mes);
					break;

					case 6:
						var mes = new Object();
						mes['num'] = (6).toString();
						mes['mes'] = "Junio";
						meses.push(mes);
					break;

					case 7:
						var mes = new Object();
						mes['num'] = (7).toString();
						mes['mes'] = "Julio";
						meses.push(mes);
					break;

					case 8:
						var mes = new Object();
						mes['num'] = (8).toString();
						mes['mes'] = "Agosto";
						meses.push(mes);
					break;

					case 9:
						var mes = new Object();
						mes['num'] = (9).toString();
						mes['mes'] = "Septiembre";
						meses.push(mes);
					break;

					case 10:
						var mes = new Object();
						mes['num'] = (10).toString();
						mes['mes'] = "Octubre";
						meses.push(mes);
					break;

					case 11:
						var mes = new Object();
						mes['num'] = (11).toString();
						mes['mes'] = "Noviembre";
						meses.push(mes);
					break;

					case 12:
						var mes = new Object();
						mes['num'] = (12).toString();
						mes['mes'] = "Diciembre";
						meses.push(mes);
					break;
				}//switch	
			}//for
			return meses;
		}//meses

		this.years = function()
		{
			var years = [];

			for(i=1950; i<2008; i++)
			{
				year = new Object();
				year['num']  = i.toString();
				year['year'] = i.toString();
				years.push(year);
			}
			return years;
		};
    })	
