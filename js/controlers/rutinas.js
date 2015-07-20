angular.module('Rutinas',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies'])

.controller('infoRutinas',function($scope,$http,$location,$methodsService){
//Variables 
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mostrarbuscando = true;	
$scope.mostrarcontent  = false;	
$scope.showfilter      = false;
$scope.clitr           = 0;
$scope.disablebtn      = false;

//funciones

$scope.Agregar = function()
{
	bootbox.confirm("Desea Agregar una rutina?", function(result) {
		console.log(result);
	  	if(result==true)
	  	{
	  		$scope.$apply(function(){
	  			$location.path('/AgregarRutina').search({});
	  		});
	  	}//if
	});
}//Agregar

$scope.FiltrarRutinas = function()
{
	$scope.rutina.Accion = "FiltrarRutinas";
	params   			 = JSON.stringify($scope.rutina);
	$scope.disablebtn    = true;
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		$scope.disablebtn = false;
       		exito  		      = data.exito;
       		if(exito==1)
       		{
       			cantidad = data.cantidad;
       			if(cantidad>0)
       			{
       				$methodsService.alerta(1,"Rutinas Filtradas");
       				$scope.rutinas = data.rutinas;
       			}//if
       			else{$methodsService.alerta(2,"No existen rutinas con estos criterios");}
       		}
       		else
       		{
       			$methodsService.alerta(2,"algo falló, disculpe las molestias");
       		}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
}//FiltrarRutinas

$scope.CategoriasporEnt = function()
{
	if($scope.rutina.entrenador!=undefined)
	{
		//Buscando las catgegorias
	params = $methodsService.Json("BuscarCategoriasPorEntrenador",$scope.rutina.entrenador);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito  = data.exito;
       		exitog = data.exitog;
       		if(exito==1)
       		{
       			$scope.tipos_rut = data.tipos_rut;
       			$scope.generos   = data.generos;
       		}//if
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
	}//if
	
}//CategoriasporEnt

//Buscando las rutinas
params = $methodsService.Json("Rutinas",1);
var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		exito    = data.exito;
       		exitot   = data.exitot;
       		exitog   = data.exitog;
       		exitoe   = data.exitoe;
       		switch(true)
       		{
       			case exito==1 && exitot==1 && exitog==1 && exitoe==1:
       				$scope.rutinas        = data.rutinas;
       				$scope.entrenadores    = data.entrenadores;
	       			$scope.mostrarbuscando = false;	
					$scope.mostrarcontent  = true;
					console.log($scope.entrenadores);
       			break;

       			case exito!=1 || exitot!=1 || exitog!=1 || exitoe!=1:
       				$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			break;
       		}//switch
       		if(exito==1)
       		{
       			
	
       		}//if
       		else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
       		
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})

.controller('RutinaAgregar',function($scope,$http,$location,$methodsService,$q,$cookies,$rootScope){
//Variables
/*var cookies = $cookies.getAll();
angular.forEach(cookies, function (v, k) {
    $cookies.remove(k);
});*/

//Funciones
$scope.AgregarRutina = function()
{
	//Si se llegó aquí es por que la rutina se puede registrar
	$scope.rutina.Accion = "AgregarRutina";
	//Tomando los textos de los días de rutina
  
  var lunes = $scope.rutina.lunes;

  $scope.estructuraRutina(); //Inicializando el objeto TipoRutinaDias
  $scope.TipoRutinaDias.Lunes     = $("#lunes option:selected").text();
  $scope.TipoRutinaDias.Martes    = $("#martes option:selected").text();
  $scope.TipoRutinaDias.Miercoles = $("#miercoles option:selected").text();
  $scope.TipoRutinaDias.Jueves    = $("#jueves option:selected").text();
  $scope.TipoRutinaDias.Viernes   = $("#viernes option:selected").text();
  $scope.TipoRutinaDias.Sabado    = $("#sabado option:selected").text();
  $scope.TipoRutinaDias.Domingo   = $("#domingo option:selected").text();
  var resps = JSON.stringify($scope.TipoRutinaDias);
  $cookies.put('TiposRutinasSemana', resps)
  // Definiendo las cookies de los días.
  //$cookies.put("TiposRutinasSemana",$scope.TipoRutinaDias);
  $cookies.put('id_categoriarutina', $scope.rutina.categoria);
  $cookies.put('Ejercicio_Lunes', $scope.TipoRutinaDias.lunes);
  $cookies.put('Ejercicio_Martes', $scope.TipoRutinaDias.martes);
  $cookies.put('Ejercicio_Miercoles', $scope.TipoRutinaDias.miercoles);
  $cookies.put('Ejercicio_Jueves', $scope.TipoRutinaDias.jueves);
  $cookies.put('Ejercicio_Viernes', $scope.TipoRutinaDias.viernes);
  $cookies.put('Ejercicio_Sabado', $scope.TipoRutinaDias.sabado);
  $cookies.put('Ejercicio_Domingo', $scope.TipoRutinaDias.domingo);

  //DEfiniendo el array de rutina días
  var RutinasDias = new Array();
  RutinasDias.push($scope.rutina.lunes)
  RutinasDias.push($scope.rutina.martes)
  RutinasDias.push($scope.rutina.miercoles)
  RutinasDias.push($scope.rutina.jueves)
  RutinasDias.push($scope.rutina.viernes)
  RutinasDias.push($scope.rutina.sabado)
  RutinasDias.push($scope.rutina.domingo)
  var respsrutinas = JSON.stringify(RutinasDias);
  $cookies.put('RutinasDias', respsrutinas);
 // console.log($cookies.get('RutinasDias'));

  var ContadorRutinasDias=0; //Contador para ir recorriendo ambos vectores, el de que valor tienes las categorías y el texto
  $cookies.put('ContadorRutinasDias', ContadorRutinasDias);

	//Definir el día actual para editar
  $cookies.put('Dia_ActualRutina', "Ejercicio_Lunes");  
  TipoRutina = $scope.TipoRutinaDias.Lunes; //Tomando el tipo de rutina
  Tipo_RutinaActual=(TipoRutina!="Varios")?"Simple":"Compleja"; //Se toma el tipo de rutina que se ha seleccionado para ver a donde se 
  //Dirige al usuario, si a elegir varios tipos de rutina o ejercicios de forma directa.
  
   //Tipo de rutina a la que se mandará la primera opción si es Varios es rutina compleja, si no sencilla.
   $cookies.put('Tipo_RutinaActual',Tipo_RutinaActual);
   DiaActual = $methodsService.VerificarDiaPorCodigo("Ejercicio_Lunes");

   //Registrar la rutina
   params = JSON.stringify($scope.rutina);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exito = data.exito;
          if(exito==1)
          {
            //si llegó quí es que se va a registrar la rutina debes mandar por 
            //parámetro get el id de la sesión,en el proyecto viejo se guarda en sesión.
            // Se debe retornar el id de la rutina agregada y guardar en cookie.
            id_rutina = data.id_rutina;
             $cookies.put("id_rutina",id_rutina);
            console.log(Tipo_RutinaActual);
            if(Tipo_RutinaActual!="Compleja")
            {
              $location.path('/AgregarRutina2').search({Day:DiaActual,Rut:$scope.rutina.lunes});
            }
            else{$location.path('/RutinaComp').search({Day:DiaActual});}
            
          }//if
          else
          {
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
          }
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
}//AgregarRutina

$scope.estructuraRutina = function()
{
  $scope.TipoRutinaDias = {
    Lunes:"",
    Martes:"",
    Miercoles:"",
    Jueves:"",
    Viernes:"",
    Sabado:"",
    Domingo:""
  };
}//estructuraRutina 

$scope.veriricarRutina = function()
{
	bootbox.confirm("Desea Agregar esta rutina?", function(result) {
		$scope.rutina.Accion = "VerificarRutina";
		// Buscando que no exista una rutina con ese nombre y para esas
		// características
		params = JSON.stringify($scope.rutina);
		var url = 'modulos/Rutinas/Funciones.php';
		     $http({method: "post",url: url,data: $.param({Params:params}), 
		      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
		    })
		     .success(function(data, status, headers, config) 
		     {          	
		       		exito =  data.exito;
		       		if(exito==1)
		       		{
		       			$scope.AgregarRutina();
		       		}else{$methodsService.alerta(2,"ya existe una rutina con esos criterios");}
		      })  
		     .error(function(data, status, headers, config){
		     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
		     });
		     	
		});
}//veriricarRutina
	
	//Buscando las categorías de las rutinas.
	params = $methodsService.Json("RutinasAgregarCategorias",1);
	var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {          	
       		//Tomando los datos
       		exitot = data.exitot;
       		exitog = data.exitog;
       		exitoc = data.exitoc;
       		exitor = data.exitor;
       		console.log(data);
       		switch(true)
       		{
       			case exitot==1 && exitog==1 && exitoc==1 && exitor==1:
       				//Tomando los arrays de criterios
       				$scope.generos  = data.generos;
       				$scope.cuerpos  = data.cuerpos;
       				$scope.cat_rut  = data.cat_rut;
       				$scope.tiposRut = data.tiposRut;
       			break;

       			case exitot!=1 || exitog!=1 || exitoc!=1 || exitor!=1:
       				$methodsService.alerta(2,"algo falló, disculpe las molestias");
       			break;

       		}//switch
      })  
     .error(function(data, status, headers, config){
     	$methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})//RutinaAgregar

.controller('RutinaCompleja',function($scope,$http,$location,$methodsService,$q,$cookies,$routeParams,$rootScope){
  //Variables
  $scope.id_dia    = $routeParams.Day;
  $scope.DiaActual = $methodsService.DefinirDia($scope.id_dia);
  $scope.btnactiv  = false;
  console.log($cookies.get('id_categoriarutina'));

  //funciones
  $scope.ComenzarSeleccion = function()
  {
    bootbox.confirm("Desea agregar estos tipos de rutina?", function(result) {
    if(result==true)
      {
        $scope.$apply(function(){
             //Tomando las tipos de rutina
            CantidadTiposRutina=document.getElementById("bootstrap-duallistbox-nonselected-list_duallistbox_demo2");

            if(CantidadTiposRutina.length==$scope.tiposRut.length)
            {
                $methodsService.alerta(2,"Favor de seleccionar tipos de rutinas");
            }//if
            else
            {
                // Definiendo variables y cookies para la selecciónd e ejercicios de las rutinas
                DiaRutina=new Array(); //Array donde se guardarán los tipos de rutina para este día.
                $(".box2 .Actividad").each(function(){
                  TipoRutina=$(this).val(); //Valor de la rutina tomada de las que están seleccionadas.
                  DiaRutina.push(TipoRutina); //Insertando las Rutinas en el array.
                });//each
                console.log(DiaRutina);
                Contador         = 0;//Contador de actividades
                TotalActividades = DiaRutina.length;
                $cookies.put("Contador",Contador); //Se guarda en una cookie para ir acarreando el dato.
                $cookies.put("TotalActividades",TotalActividades); //Número total de actividades con el que se comara el contador.
                $cookies.put("DiaRutina",DiaRutina); //Vector con las rutinas que deben hacerse.
                Rut=DiaRutina[Contador];
                //Redirigiendo a la selección de ejercicios.
                $location.path('/AgregarRutina2').search({Day:$scope.id_dia,Rut:Rut});
            } //ELSE              
        });
      }//if
  });
  }//ComenzarSeleccion

  //inicializando el bootlist
  var demo2 = $('.demo2').bootstrapDualListbox({
          nonSelectedListLabel: 'Non-selected',
          selectedListLabel: 'Selected',
          preserveSelectionOnMove: 'moved',
          moveOnSelect: false
        });

  //Buscar la información
  params = $methodsService.Json("InfoRutinaCompleja",1);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exitor = data.exitor;
          if(exitor==1)
          {
            $scope.tiposRut = data.tiposRut;
            //console.log($scope.tiposRut);
            //Pegando los tipos rut en la tabla de selección
            var size = $scope.tiposRut.length;
            
            for(i=0; i<size; i++)
            {
              var object = $scope.tiposRut[i];
              var row ='<option value="'+object.id+'" class="Actividad">'+object.nb_tiporutina+'</option>';
              demo2.append(row);
            }//for
             demo2.bootstrapDualListbox('refresh');
          }//if
          else
          {
            $methodsService.alerta(2,"algo falló, disculpe las molestias");      
          }
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})//RutinaCompleja

.controller('RutinaAgregar2',function($scope,$http,$location,$methodsService,$q,$cookies,$routeParams,$rootScope){
 //Variables
 $scope.Day = $routeParams.Day;
 $scope.Rut = $routeParams.Rut;
 $scope.dia = $methodsService.DefinirDia($scope.Day);

 //Funciones
 $scope.FuncionDia = function(dia)
 {
    rutina = "";
    switch(dia)
    {
      case '1':
        rutina = $scope.TiposRutinasVector.lunes;
      break;

      case '2':
        rutina = $scope.TiposRutinasVector.martes;
      break;

      case '3':
        rutina = $scope.TiposRutinasVector.miercoles;
      break;

      case '4':
        rutina = $scope.TiposRutinasVector.jueves;
      break;

      case '5':
        rutina = $scope.TiposRutinasVector.viernes;
      break;

      case '6':
        rutina = $scope.TiposRutinasVector.sabado;
      break;

      case '7':
        rutina = $scope.TiposRutinasVector.domingo;
      break;
    }//switch
    return rutina;
 }//FuncionDIa

 $scope.GuardarEjercicios = function()
 {
    //Verificando si se eligieron ejercicios
     $scope.btnactiv = true;
     bootbox.confirm("Desea agregar estos ejercicios?", function(result) {
    if(result==true)
      {
        $scope.$apply(function(){
             //Tomando las tipos de rutina
            CantidadTiposRutina=document.getElementById("bootstrap-duallistbox-nonselected-list_duallistbox_demo2");

            if(CantidadTiposRutina.length==$scope.ejercicios.length)
            {
                //Si entra aquí es por que no había ejercicios seleccionados.
                $methodsService.alerta(2,"Favor de seleccionar tipos de rutinas");
                $scope.btnactiv = false;
            }//if
            else
            {
                $scope.btnactiv = false;
                // Definiendo variables y cookies para la selecciónd e ejercicios de las rutinas
                EjerciciosRutina = new Array(); //Array donde se guardarán los tipos de rutina para este día.
                $(".box2 .Actividad").each(function(){
                  TipoRutina=$(this).val(); //Valor de la rutina tomada de las que están seleccionadas.
                  EjerciciosRutina.push(TipoRutina); //Insertando las Rutinas en el array.
                });//each
                
                //Aquí se procede a obtener los datos para guardar los ejercicios.
                CantidadEjercicios  = DiaRutina.length;
                id_tiporutina       = $scope.ejercicios[0].id_tiporutina;
                id_CategoriaRutina  = $cookies.get("id_categoriarutina");
                Arr=new Object();
                Arr['id_dia']             = $scope.Day;
                Arr['id_CategoriaRutina'] = $cookies.get("id_categoriarutina");     
                Arr['EjerciciosRutina']   = EjerciciosRutina;
                Arr['CantidadEjercicios'] = CantidadEjercicios;
                Arr['id_TipoRutina']      = $scope.Rut;
                Arr['Accion']             = "RegistrarEjerciciosRutinas";
                var Params= JSON.stringify(Arr);
                //Mandando por ajax a guardar 
               
                // Verificando el tipo de rutina actual, si es compleja o simple
                var url = 'modulos/Rutinas/Funciones.php';
                 $http({method: "post",url: url,data: $.param({Params:Params}), 
                  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }})
                 .success(function(data, status, headers, config) 
                 {            
                      exito = data.exito;
                      if(exito==1)
                      {
                        var Tipo_RutinaActual = $cookies.get("Tipo_RutinaActual"); //tipo de rutina
                          //si tuvo exito se procede a continuar con la siguiente etapa
                          if(Tipo_RutinaActual=="Compleja")
                          {
                              //Rutina Compleja
                              // se toman los datos para continuar con el procedimiento.
                               Contador         = $cookies.get("Contador"); //Las cantidades actuales que se llevan registradas.
                               TotalActividades = $cookies.get("TotalActividades");  //Total de cantidades  de tipos de rutina que se definirán.
                               Contador++; //Se aumenta el contador para decir que ya va una más registrada
                               Dia_ActualRutina = $cookies.get('Dia_ActualRutina');
                               Rutina           = $cookies.get("DiaRutina");
                               DiaRutina        = Rutina.split(","); //Dia 
                               rut              = DiaRutina[Contador];
                              //Verificando en que tipo de rutina se encuentra, simple o compleja.
                               if(Contador==TotalActividades)
                                {
                                  // Aquí es cuando llegaste al tope de tipos de rutina para 
                                  // un solo día
                                  Dia_Codigo       = $methodsService.CambiarDiaActualRutina(Dia_ActualRutina); //Se cambia el día de la rutina
                                  $scope.DiaActual = $methodsService.VerificarDiaPorCodigo(Dia_Codigo);
                                  $cookies.put("Dia_ActualRutina",Dia_Codigo);//Se asigna a la variable de sesión el nuevo día de rutina.

                                  //Obtener que tipo de rutina será la del siguiente día
                                  ContadorRutinasDias = $cookies.get("ContadorRutinasDias"); //Contador. 
                                  ContadorRutinasDias++;
                                  $cookies.put("ContadorRutinasDias",ContadorRutinasDias); //Contador.
                                  console.log("el contador de días: "+ContadorRutinasDias);
                                  //Trayendo ambos vectores, valor de tipo rutina y su texto
                                  var RutinasVector       = JSON.parse($cookies.get('RutinasDias'));
                                  var TiposRutinasVector  = JSON.parse($cookies.get('TiposRutinasSemana'));
                                  

                                  //Separando ambos con split para poder acceder y evitar contar las "," como parte del vector.
                                  //RutinasDias             = RutinasVector.split(",");
                                  //TiposRutinasVector      = TiposRutinasVector.split(",");

                                  //Cambiar el tipo de rutina actual, ya sea sencilla o complicada.
                                  var Rut                        = RutinasVector[ContadorRutinasDias]; //Tipo de rutina que será, es número
                                  var diaPornumero               = $methodsService.DefinirDia($scope.DiaActual);
                                  var Tipo_RutinaActualVerificar = TiposRutinasVector[diaPornumero]; //Tomando el valor para verificar si es simple o compleja
                                  var Tipo_RutinaActual          = (Tipo_RutinaActualVerificar!="Varios")?"Simple":"Compleja"; //Definiendo que es
                                  //var Rut = rut.parseInt();
                                  //var Rut = rut.split('"',2);
                                  //Rut = Rut[1];
                                  console.log(Rut);
                                  console.log(Tipo_RutinaActualVerificar);
                                  console.log(Tipo_RutinaActual);
                                  console.log("dia codigo: "+Dia_Codigo);
                                  $scope.Day = $methodsService.VerificarDiaPorCodigo(Dia_Codigo);
                                  $cookies.put("Tipo_RutinaActual",Tipo_RutinaActual); // Actualizando la cookie.
                                  if(Dia_Codigo=="Ejercicio_Terminado")
                                  {
                                      // Si entra aquí es que la rutina ya se terminó.
                                      var id_rutina = $cookies.get("id_rutina");
                                      $location.path('/RutinaOrdenEnt').search({Rut:id_rutina});
                                  }//if
                                  else
                                  {
                                      // SI entra aquí es por que la rutina todavía continua.
                                      // Verificando si el siguiente día es rutina sencilla o compleja.
                                      console.log(Tipo_RutinaActual);
                                      if(Tipo_RutinaActual=="Compleja")
                                      {
                                        $location.path('/RutinaComp').search({Day:$scope.Day});
                                      }//if
                                      else
                                      {
                                        $location.path('/AgregarRutina2').search({Day:$scope.Day,Rut:Rut});
                                      }
                                  }//else
                                }//if
                                else
                                {
                                  //Aquí es cuando debes seguir con más actividades
                                  $cookies.put("Contador",Contador); // Actualizando la cookie de contador.
                                  $scope.day = $methodsService.VerificarDiaPorCodigo(Dia_ActualRutina);
                                  $location.path('/AgregarRutina2').search({Day:$scope.day,Rut:rut});
                                }//else
                          }//if

                          //rutina Sencilla
                          else
                          {
                              //Si entra aquí es porq ue era una rutina sencilla.
                              var Dia_ActualRutina = $cookies.get("Dia_ActualRutina"); //Día en el que se encuentra el proceso de rutinas
                              var Dia_Codigo       = $methodsService.CambiarDiaActualRutina(Dia_ActualRutina); //Se cambia el día de la rutina
                              var DiaActual        = $methodsService.VerificarDiaPorCodigo(Dia_Codigo);
                              $cookies.put("Dia_ActualRutina",Dia_Codigo); // Actuañozamdp eñ nuevo día

                              //Obtener que tipo de rutina será la del siguiente día
                              ContadorRutinasDias  = $cookies.get("ContadorRutinasDias");
                              ContadorRutinasDias++;
                              console.log(ContadorRutinasDias);
                              $cookies.put("ContadorRutinasDias",ContadorRutinasDias); //Actualizando el contador
                              //Trayendo ambos vectores, valor de tipo rutina y su texto
                              var RutinasVector      = JSON.parse($cookies.get("RutinasDias"));
                              var TiposRutinasVector = JSON.parse($cookies.get("TiposRutinasSemana"));
                              console.log(RutinasVector);
                              console.log(TiposRutinasVector);
                              //Separando ambos con split para poder acceder y evitar contar las "," como parte del vector.
                             // var RutinasDias        = RutinasVector.split(",");
                              //var TiposRutinasVector = TiposRutinasVector.split(",");
                              
                              //Cambiar el tipo de rutina actual, ya sea sencilla o complicada.
                              // Se saca el nombre del día en NombreDia para acceder en TiposRutinasVector
                              // Al valor que contiene para ese día el tipo de rutina.
                              rut                        = RutinasVector[ContadorRutinasDias]; //Tipo de rutina que será, es número
                              var NombreDia              = $methodsService.DefinirDia(DiaActual); // para sacar el tipo de rutina del objeto de tipos de rutina
                              Tipo_RutinaActualVerificar = TiposRutinasVector[NombreDia]; //Tomando el valor para verificar si es simple o compleja
                              
                              Tipo_RutinaActual = (Tipo_RutinaActualVerificar!="Varios")?"Simple":"Compleja"; //Definiendo que es
                              $cookies.put("Tipo_RutinaActual",Tipo_RutinaActual); // Actualizando la cookie.
                              //Se verifica si es el último día de la semana, para pasar al final de la rutina
                              console.log(Tipo_RutinaActual);
                              if(Dia_Codigo=="Ejercicio_Terminado")
                              {
                                  //Aquí se termina y se manda al rutina Orden
                                  var id_rutina = $cookies.get("id_rutina");
                                  $location.path('/RutinaOrdenEnt').search({Rut:id_rutina});
                              }
                              else
                              {
                                //Si el siguiente día tiene rutina compleja se dirige a elegir los ejercicios de la rutina de esedía
                                if(Tipo_RutinaActual=="Compleja")
                                {
                                  $location.path('/RutinaComp').search({Day:DiaActual});
                                } //if compleja
                                else{$location.path('/AgregarRutina2').search({Day:DiaActual,Rut:rut});}
                              }//else
                          }//else
                      }else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
                  })  
                 .error(function(data, status, headers, config){ $methodsService.alerta(2,"algo falló, disculpe las molestias");});
                
            } //ELSE              
        });
      }//if
  });
 }//GuardarEjercicios

 //Situaciones


 //inicializando el bootlist
  var demo2 = $('.demo2').bootstrapDualListbox({
          nonSelectedListLabel: 'Non-selected',
          selectedListLabel: 'Selected',
          preserveSelectionOnMove: 'moved',
          moveOnSelect: false
  });

  //Obteniendo los datos de las cookies.
  //Añadiendo la cabeza del tipo de rutina que tendrá
  ContadorRutinasDiasTitulo = $cookies.get("ContadorRutinasDias"); //Contador.
  TiposRutinasSemana = $cookies.get('TiposRutinasSemana');
  $scope.TiposRutinasVector = JSON.parse(TiposRutinasSemana); // Tomando los valores para los dias de rutina
  $scope.nombreDia = $methodsService.DefinirDia($scope.Day); // Definiendo el nombre del día
  var tiporutinaPordia = $scope.TiposRutinasVector[$scope.nombreDia]; //Tomando el tipo de rutina por dia
  $scope.TipoRutinaTitulo = "Tipo de Rutina: "+tiporutinaPordia; // Asignando el scope el texto
  
  //Variables para manejo de rutina
  $scope.DiaActual       = 0;
  $scope.RutinaSiguiente = 0;

 //Buscando los ejercicios por tipos de rutina.
 params = $methodsService.Json("BuscarEjerciciosPorRutina",$scope.Rut);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exito =  data.exito;
          if(exito==1)
          {
            $scope.ejercicios = data.ejercicios;
            //Pegando los datos al select
            var size = $scope.ejercicios.length;
            
            for(i=0; i<size; i++)
            {
              var object = $scope.ejercicios[i];
              var row ='<option value="'+object.id+'" class="Actividad">'+object.nb_ejercicio+'</option>';
              demo2.append(row);
            }//for
             demo2.bootstrapDualListbox('refresh');
          }//if
          else
          {
            $methodsService.alerta(2,"algo falló, disculpe las molestias");      
          }//else
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})

.controller('RutinaOrden',function($scope,$http,$location,$methodsService,$q,$cookies,$rootScope,$routeParams){
//variables
$scope.id_rutina = $routeParams.Rut;
params = $methodsService.Json("EjerciciosRutinaOrden",$scope.id_rutina);


    //inicializando todo lo necesario para las tablas 
    $('#listados').editableTableWidget().numericInputExample();
    $('#textAreaEditor').editableTableWidget({editor: $('<textarea>')});
    window.prettyPrint && prettyPrint();

    //Contenedores de los ejercicios de cada dia.
    $scope.lunes     = [];
    $scope.martes    = [];
    $scope.miercoles = [];
    $scope.jueves    = [];
    $scope.viernes   = [];
    $scope.sabado    = [];
    $scope.domingo   = [];

    //funciones
    $scope.AsignarEjercicios =  function(dia,ejercicios)
    {
        switch(dia)
        {
          case '1':
            $scope.lunes = ejercicios;
             $("#lunesbody").empty();
             $scope.AgregarEjerciciosTabla($scope.lunes,"#lunesbody");
             $scope.InicializarTablas();
          break;

          case '2':
            $scope.martes = ejercicios;
             $("#martesbody").empty();
             $scope.AgregarEjerciciosTabla($scope.martes,"#martesbody");
             $scope.InicializarTablas();
          break;

          case '3':
            $scope.miercoles = ejercicios;
             $("#miercolesbody").empty();
             $scope.AgregarEjerciciosTabla($scope.miercoles,"#miercolesbody");
             $scope.InicializarTablas();
          break;

          case '4':
            $scope.jueves = ejercicios;
             $("#juevesbody").empty();
             $scope.AgregarEjerciciosTabla($scope.jueves,"#juevesbody");
             $scope.InicializarTablas();
          break;

          case '5':
            $scope.viernes = ejercicios;
             $("#viernesbody").empty();
             $scope.AgregarEjerciciosTabla($scope.viernes,"#viernesbody");
             $scope.InicializarTablas();
          break;

           case '6':
            $scope.sabado = ejercicios;
             $("#sabadobody").empty();
             $scope.AgregarEjerciciosTabla($scope.sabado,"#sabadobody");
             $scope.InicializarTablas();
          break;

          case '7':
            $scope.domingo = ejercicios;
             $("#domingobody").empty();
             $scope.AgregarEjerciciosTabla($scope.domingo,"#domingobody");
             $scope.InicializarTablas();
          break;
        }//switch
    }//AsignarEjercicios

    $scope.AgregarEjerciciosTabla = function(ejercicios,tabla)
    {
      for(i=0; i<ejercicios.length; i++)
      {
        var eje = ejercicios[i];
        var tr = '<tr class="text-center" id="'+eje.id_posicionejercicio+'"><td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_ejercicio+'</td><td>'+eje.nb_musculo+'</td></tr>'
        $(tabla).append(tr);
      }//for
      
    }//AgregarEjerciciosTabla

    $scope.CambiarDia = function(id_par,dia_semana)
    {
        //Obtener el tr que está encima
        var idJquery = "#"+id;
        var Padre = $(idJquery).prev()[0];
        var son = $(idJquery).next()[0];
        
        id = parseInt(id_par);

        //Situación en la que el ejercicio que se ha movido no tiene un nodo padre.
        if(Padre == undefined) 
        {
          var id_Padre       = 0;
          var AccionCambio   = "SinPadre";
        }else {id_Padre = Padre.id;}
        
        //Situación en la que el ejercicio que se ha movido no tiene un nodo hijo.
        if(son == undefined) 
        {
          var id_Hijo        = 0;
          var AccionCambio   = "SinHijo";
        }else {id_Hijo = son.id;}

        if(Padre != undefined && son !=undefined)
    {
      var id_Padre   = Padre.id;
      var id_Hijo    = son.id;
      
      //verificando si se bajó o subió posiciones
      // 1) si el padre es mayor, es por que se bajó la posición
      if(id_Padre>id)
      {
        var AccionCambio   = "ConAmbosBajoPosicion";
        var Cantidad_Puestos = id_Padre - id; 
      }//if
      
      if(id_Padre<id)
      {
        AccionCambio   = "ConAmbosSubioPosicion";
        var Cantidad_Puestos = id - id_Hijo;
      }//if
    }//if

        // Escenarios posibles del cambio de lugar
    
        // 1) Cuando no se tiene padre -> Esto significa que se movió al primer puesto de la lista

        if (id_Padre == 0)
        {
          //Tomar la cantidad de puestos que se movió
          var Cantidad_Puestos = id-id_Hijo;
        } // id_Padre == 0

        if (id_Hijo == 0)
        {
          Cantidad_Puestos = id_Padre-id;
        }

        //Tomando los valores para mandarlos al controller
        $scope.valores = 
        {
          id_rutina: $scope.id_rutina,
          id_cambio: id,
          id_Hijo:   id_Hijo,
          id_Padre: id_Padre,
          Cantidad_Puestos: Cantidad_Puestos,
          AccionCambio: AccionCambio,
          Accion: "CambioLugarEjercicio"           
        };
        console.log($scope.valores);
        var Params= JSON.stringify($scope.valores);

        //Validación, si el hijo es mayor por solo 1 o el padre menor por 1
        Cantidad_DiferenciaHijo  = id_Hijo - id; //Diferencia entre id_hijo y el id que fue movido
        Cantidad_DiferenciaPadre = id - id_Padre;
        Actividad_Sola       = 0;
        MismoLugar_Hijo      = 0;
        MismoLugar_Padre     = 0;
        
        console.log(Cantidad_DiferenciaHijo+" diferencia");
        //Verificando, si no tiene ni padre o hijio, es que es una sola actividad
        if(id_Hijo==0 && id_Padre==0 )
        {
          Actividad_Sola = 1;
        }//if

        if(Cantidad_DiferenciaHijo!=1 && Cantidad_DiferenciaPadre!=1 && Actividad_Sola!=1 )
      {
        var url = 'modulos/Rutinas/Funciones.php';
         $http({method: "post",url: url,data: $.param({Params:Params}), 
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
         .success(function(data, status, headers, config) 
         {            
              exito = data.exito;
              if(exito==1)
              {
                var id_diaCambio = data.dia;
                var ejercicios   = data.ejercicios;
                $scope.AsignarEjercicios(id_diaCambio,ejercicios);
              }//if
          }) //success 
         .error(function(data, status, headers, config){
          $methodsService.alerta(2,"algo falló, disculpe las molestias");
         });
        }//if 

    }//CambiarDia

    $scope.definirEjercicioDia = function(dia,ejercicio)
    {
      switch(dia)
      {
        case '1':
          $scope.lunes.push(ejercicio);
        break;

        case '2':
          $scope.martes.push(ejercicio);
        break;

        case '3':
          $scope.miercoles.push(ejercicio);
        break;

        case '4':
          $scope.jueves.push(ejercicio);
        break;

        case '5':
          $scope.viernes.push(ejercicio);
        break;

        case '6':
          $scope.sabado.push(ejercicio);
        break;

        case '7':
          $scope.domingo.push(ejercicio);
        break;
      }//switch
    }//definirEjercicioDia

    $scope.InicializarTablas = function ()
    {
     
      //Drag and drop table
      $("#table-1").tableDnD();
      $("#table-2").tableDnD();
      $("#table-3").tableDnD();
      $("#table-4").tableDnD();
      $("#table-5").tableDnD();
      $("#table-6").tableDnD();
      $("#table-7").tableDnD();
       //Acciones
       
       // día lunes //
       $('#table-1').tableDnD({
          onDrop: function(table, row) 
         {
            //Tomando los datos del row que se movió
            id       = row.id;
            dia_semana = "Actualiza_Lunes";
            $scope.CambiarDia(id,dia_semana) 
          } //onDrop
      });
      
      // día Martes //
       $('#table-2').tableDnD({
          onDrop: function(table, row) 
          {
            //Tomando los datos del row que se movió
            id = row.id;
            dia_semana = "Actualiza_Martes";
            $scope.CambiarDia(id,dia_semana) 
          } 
      });
      
      // día miércoles//
       $('#table-3').tableDnD({
          onDrop: function(table, row) 
        {
            //Tomando los datos del row que se movió
            id = row.id;
            dia_semana = "Actualiza_Miercoles";
            $scope.CambiarDia(id,dia_semana); 
          } 
      });
      
      // día Jueves//
       $('#table-4').tableDnD({
          onDrop: function(table, row) 
        {
           //Tomando los datos del row que se movió
            id = row.id;
            dia_semana = "Actualiza_Jueves";
            $scope.CambiarDia(id,dia_semana); 
          } 
      });
      
      // día Viernes//
       $('#table-5').tableDnD({
          onDrop: function(table, row) 
        {
          console.log(row);
          //Tomando los datos del row que se movió
          id = row.id;
          dia_semana = "Actualiza_Viernes";
          $scope.CambiarDia(id,dia_semana); 
          } 
      });
      
      // día Sábado//
       $('#table-6').tableDnD({
          onDrop: function(table, row) 
        {
          
          //Tomando los datos del row que se movió
          id = row.id;
          dia_semana = "Actualiza_Sabado";
          $scope.CambiarDia(id,dia_semana) 
          } 
      });
      
      // día Domingo//
       $('#table-7').tableDnD({
          onDrop: function(table, row) 
        {
          
          //Tomando los datos del row que se movió
          id = row.id;
          dia_semana = "Actualiza_Domingo";
          $scope.CambiarDia(id,dia_semana) 
          } 
      });
    }//InicializarTablas


    //Buscando los ejercicios para las rutinas.
    var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
        exito = data.exito;
        if(exito==1)
        {
          $scope.ejercicios = data.ejercicios;
          var cantidad      = $scope.ejercicios.length;

          //definiendo los ejercicios por dia.
          for(i=0; i<cantidad; i++)
          {
            var id_dia = $scope.ejercicios[i].id_dia;
            $scope.definirEjercicioDia(id_dia,$scope.ejercicios[i]);
          }//for

          //Pegando los ejercicios para cada lista con jquery.
          for(i=0; i<$scope.lunes.length;i++)
          {
              var eje = $scope.lunes[i];
              var tr = '<tr class="text-center" id="'+eje.id_posicionejercicio+'"><td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_ejercicio+'</td><td>'+eje.nb_musculo+'</td></tr>'
              $("#lunesbody").append(tr);

          }//for

          for(i=0; i<$scope.martes.length;i++)
          {
              var eje = $scope.martes[i];
              var tr = '<tr class="text-center" id="'+eje.id_posicionejercicio+'"><td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_ejercicio+'</td><td>'+eje.nb_musculo+'</td></tr>'
              $("#martesbody").append(tr);

          }//for

          for(i=0; i<$scope.miercoles.length;i++)
          {
              var eje = $scope.miercoles[i];
              var tr = '<tr class="text-center" id="'+eje.id_posicionejercicio+'"><td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_ejercicio+'</td><td>'+eje.nb_musculo+'</td></tr>'
              $("#miercolesbody").append(tr);

          }//for

          for(i=0; i<$scope.jueves.length;i++)
          {
              var eje = $scope.jueves[i];
              var tr = '<tr class="text-center" id="'+eje.id_posicionejercicio+'"><td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_ejercicio+'</td><td>'+eje.nb_musculo+'</td></tr>'
              $("#juevesbody").append(tr);
          }//for

          for(i=0; i<$scope.viernes.length;i++)
          {
              var eje = $scope.viernes[i];
              var tr = '<tr class="text-center" id="'+eje.id_posicionejercicio+'"><td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_ejercicio+'</td><td>'+eje.nb_musculo+'</td></tr>'
              $("#viernesbody").append(tr);
          }//for

          for(i=0; i<$scope.sabado.length;i++)
          {
              var eje = $scope.sabado[i];
              var tr = '<tr class="text-center" id="'+eje.id_posicionejercicio+'"><td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_ejercicio+'</td><td>'+eje.nb_musculo+'</td></tr>'
              $("#sabadobody").append(tr);
          }//for

          for(i=0; i<$scope.domingo.length;i++)
          {
              var eje = $scope.domingo[i];
              var tr = '<tr class="text-center" id="'+eje.id_posicionejercicio+'"><td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_ejercicio+'</td><td>'+eje.nb_musculo+'</td></tr>'
              $("#domingobody").append(tr);
          }//for

          $scope.InicializarTablas();
        }//if
         
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})

