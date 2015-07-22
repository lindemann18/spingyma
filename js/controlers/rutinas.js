angular.module('Rutinas',['ngRoute','angularUtils.directives.dirPagination','Methods','ngCookies'])

.controller('infoRutinas',function($scope,$http,$location,$methodsService){
//Variables 
$scope.currentPage     = 1; // Página actual, para paginación
$scope.pageSize 	   = 5;   // Tamaño de la página, para paginación.
$scope.mostrarbuscando = true;	
$scope.mostrarcontent  = false;	
$scope.showfilter      = false;
$scope.disablebtn      = false;
$scope.ruttr           = 0;

//Funciones
$scope.Selecciontr = function(tr)
{
  //Verificando que no se le hizo click al mismo tr
  if(tr.rut.id_rutina == $scope.ruttr)
  {
    //Si es el mismo tr se le asigna un 0.
    $scope.ruttr = 0;
    idtr = "#table"+tr.rut.id_rutina;
    $(idtr).removeClass("bg-blue");
    console.log($scope.ruttr);
  }//if
  else
  {
    $("tr").removeClass("bg-blue");
    $scope.ruttr = tr.rut.id_rutina;
    idtr          = "#table"+tr.rut.id_rutina;
    $(idtr).addClass("bg-blue");
    console.log($scope.ruttr);
  }

}//Selecciontr

$scope.MostrarRutina = function(id)
{
  bootbox.confirm("Desea ver esta rutina?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
          $location.path('/RutinaOrdenEnt').search({Rut:id});
        });
      }//if
  });
}//MostrarRutina

$scope.Editar = function()
{
  bootbox.confirm("Desea Editar esta Rutina?", function(result) {
    console.log(result);
      if(result==true)
      {
          if($scope.ruttr!=0)
          {
            $scope.$apply(function(){
              $location.path('/EditarRutina').search({Rut:$scope.ruttr});
            });
          }
          else{$methodsService.alerta(2,"Favor de seleccionar una Rutina");} 
      }//if

  });
}//Editar

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

$scope.Eliminar = function()
{
  bootbox.confirm("Desea Eliminar esta rutina?", function(result) {
    console.log(result);
      if(result==true)
      {
        if($scope.ruttr!=0)
        {
           params = $methodsService.Json("EliminarRutina",$scope.ruttr);
          //Enviando por ajax la peetición
          var url = 'modulos/Rutinas/Funciones.php';
         $http({method: "post",url: url,data: $.param({Params:params}), 
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
         .success(function(data, status, headers, config) 
         {            
              exito  = data.exito;
              exitor = data.exitor;
              switch(true)
              {
                  case exito==1 && exitor==1:
                    $scope.rutinas = data.rutinas;
                  break;

                  case exito!=1 && exitor!=1:
                    $methodsService.alerta(2,"algo falló, disculpe las molestias");
                  break;
              }//switch
          })  
         .error(function(data, status, headers, config){
          $methodsService.alerta(2,"algo falló, disculpe las molestias");
         });
        }//if
        else{$methodsService.alerta(2,"Favor de seleccionar una Rutina");}
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
$scope.Redirigir = function(direccion)
  {
    $methodsService.Redirigir(direccion);
  }//Redirigir

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
                 $scope.btnactiv = true;
                
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
                        $scope.btnactiv = false;
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

    $scope.RutinaPrefinal = function()
    {
      bootbox.confirm("Desea ir a la parte final de la rutina?", function(result) {
        if(result==true)
        {
          $scope.$apply(function(){
            $location.path('/RutinaPrefinal').search({Rut:$scope.id_rutina});
          });//aply
        }//if
      });//bootbox
    }//RutinaPrefinal

    $scope.AsignarEjercicios =  function(dia,ejercicios)
    {
        switch(dia)
        {
          case '1':
            $scope.lunes = ejercicios;
             $("#lunesbody").empty();
             $("#lunesbody").css("display","none");
             $scope.AgregarEjerciciosTabla($scope.lunes,"#lunesbody");
             $("#lunesbody").fadeIn(3000);
             $scope.InicializarTablas();
          break;

          case '2':
            $scope.martes = ejercicios;
             $("#martesbody").empty();
             $("#martesbody").css("display","none");
             $scope.AgregarEjerciciosTabla($scope.martes,"#martesbody");
             $("#martesbody").fadeIn(3000);
             $scope.InicializarTablas();
          break;

          case '3':
            $scope.miercoles = ejercicios;
            $("#miercolesbody").css("display","none");
            $("#miercolesbody").empty();
            $scope.AgregarEjerciciosTabla($scope.miercoles,"#miercolesbody");
            $("#miercolesbody").fadeIn(3000);
            $scope.InicializarTablas();
          break;

          case '4':
            $scope.jueves = ejercicios;
             $("#juevesbody").css("display","none");
             $("#juevesbody").empty();
             $scope.AgregarEjerciciosTabla($scope.jueves,"#juevesbody");
             $("#juevesbody").fadeIn(3000);
             $scope.InicializarTablas();
          break;

          case '5':
            $scope.viernes = ejercicios;
            $("#viernesbody").css("display","none");
            $("#viernesbody").empty();
            $scope.AgregarEjerciciosTabla($scope.viernes,"#viernesbody");
            $("#viernesbody").fadeIn(3000);
            $scope.InicializarTablas();
          break;

           case '6':
              $scope.sabado = ejercicios;
              $("#sabadobody").css("display","none");
              $("#sabadobody").empty();
              $scope.AgregarEjerciciosTabla($scope.sabado,"#sabadobody");
              $("#sabadobody").fadeIn(3000);
              $scope.InicializarTablas();
          break;

          case '7':
            $scope.domingo = ejercicios;
            $("#domingobody").css("display","none");
            $("#domingobody").empty();
            $scope.AgregarEjerciciosTabla($scope.domingo,"#domingobody");
            $("#domingobody").fadeIn(3000);
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

})//RutinaOrden

.controller('Rutinaprefinal',function($scope,$http,$location,$methodsService,$q,$cookies,$rootScope,$routeParams){
//Variables
$scope.Rut = $routeParams.Rut;

//Funciones
$scope.FinalizarRutina = function()
{
  bootbox.confirm("Desea finalizar la rutina?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
          var cookies = $cookies.getAll();
          angular.forEach(cookies, function (v, k) {
              $cookies.remove(k);
          });
          $location.path('/Rutinas').search({});
        });
      }//if
  });
}//FinalizarRutina

$scope.CambioTabla = function(id,newValue)
{
  if($(id2).hasClass("Repeticiones"))
  {
    if($.isNumeric(newValue))
    {
      id_rutina   = $("#id_rutina").val();
      idEjercicio = id.split("Val");
      console.log("el id es: "+idEjercicio[1]+" Las repeticiones son : "+newValue);
      $scope.InsertarRepeticionesBD(idEjercicio[1], newValue,id_rutina);
    }//if
    else
    {
      bootbox.confirm("Favor de ingresar un número válido.", function(result) {});
    }//else
    
  }//If class

  if($(id2).hasClass("Circuitos"))
  {
    if($.isNumeric(newValue))
    {
      id_rutina   = $("#id_rutina").val();
      idEjercicio = id.split("ValRu");
      console.log("el id es: "+idEjercicio[1]+" Los Circuitos son : "+newValue);
      $scope.InsertarCircuitosBD(idEjercicio[1], newValue)
    }
    else
    {
      alert("Favor de ingresar un número válido.");
    }//else
  }//if

  if($(id2).hasClass("Relacion"))
  {
    id_rutina   = $("#id_rutina").val();
    idEjercicio = id.split("ValRe");
    console.log("el id es: "+idEjercicio[1]+" La relación es : "+newValue);
    $scope.InsertarRelacionEjerciciosBD(idEjercicio[1],newValue);
  }//if
}//CambioTabla

$scope.InsertarRelacionEjerciciosBD = function (id,relacion)
{
  //Objeto con la información a guardar en la BD
    var Arr=new Object(); 
    Arr['id_ejercicio']   = id;
    Arr['relacion']       = relacion;
    Arr['Accion']         = "AgregarRelacionEjercicio";
    params                  = JSON.stringify(Arr);
    var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {})  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
}//InsertarRelacionEjerciciosBD

$scope.InsertarRepeticionesBD = function (id, repeticiones,id_rutina)
{
  
    //Objeto con la información a guardar en la BD
    var Arr                 = new Object(); 
    Arr['id_rutina']        = $scope.Rut;
    Arr['id_ejercicio']     = id;
    Arr['num_repeticiones'] = repeticiones;
    Arr['Accion']           = "AgregarRepeticionesEjercicio";
    params                  = JSON.stringify(Arr);
    var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {})  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
}//InsertarRepeticionesBD

$scope.InsertarCircuitosBD = function (id, circuitos,id_rutina)
{
  //Objeto con la información a guardar en la BD
    var Arr=new Object(); 
    Arr['id_rutina']      = id_rutina;
    Arr['id_ejercicio']     = id;
    Arr['num_circuitos']    = circuitos;
    Arr['Accion']       = "AgregarCircuitosEjercicio";
    params                  = JSON.stringify(Arr);
    console.log(params);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
       
         
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
}

//Cambios en la tabla


//Buscando la información pertinente a la rutina.
//Buscando los ejercicios para las rutinas.
params = $methodsService.Json("EjerciciosRutinaOrden",$scope.Rut);
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

            var eje = $scope.ejercicios[i];
            circuitos = (eje.num_circuitos!=null)?eje.num_circuitos:0;
            repet     = (eje.num_repeticiones!=null)?eje.num_repeticiones:0;
            rel       = (eje.ejercicio_relacion!=null)?eje.ejercicio_relacion:"";
            var tr = '<tr class="text-center" id="'+eje.id_rutina+'">';
            tr+='<td>'+eje.id_posicionejercicio+'</td><td>'+eje.nb_rutina+'</td>';
            tr+='<td>'+eje.desc_rutina+'</td><td>'+eje.nb_categoriarutina+'</td>';
            tr+='<td>'+eje.nb_ejercicio+'</td><td id="Val'+eje.id_ejercicio+'" class="Repeticiones">'+repet+'</td>';
            tr+='<td id="ValRu'+eje.id_ejercicio+'" class="Circuitos">'+circuitos+'</td>';
            tr+='<td>'+eje.nb_dia+'</td><td>'+eje.nb_tiporutina+'</td>';
            tr+='<td>'+eje.nb_musculo+'</td><td>'+eje.nb_nombre+eje.nb_apellidos+'</td>';
            tr+='<td>'+eje.fh_creacion+'</td>';
            tr+='<td id="ValRe'+eje.id_ejercicio+'" class="Relacion">'+rel+'</td></tr>';
            $("#tablecontent").append(tr);
          }//for
          $('#listados').editableTableWidget();
          $('table td').on('change', function(evt, newValue) {
                id=evt.currentTarget.id;
                id2="#"+id;
                $scope.CambioTabla(id2,newValue);
            });
        }//if
         
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });

})

//Aquí comienza la edición de las rutinas en cuestión de ejercicios.

.controller('RutinaEditar',function($scope,$http,$location,$methodsService,$routeParams){
  //Variables
  $scope.Rut         = $routeParams.Rut;
  $scope.btndisabled = true;

  //Funciones
  $scope.EditarDiasRutina = function()
  {
    bootbox.confirm("Desea editar los ejercicios de esta rutina?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
          $location.path('/EditarDiasRutina').search({Rut:$scope.Rut});
        });
      }//if
    });//bootbox
  }//EditarDiasRutina

  $scope.Redirigir = function(direccion)
  {
    $methodsService.Redirigir(direccion);
  }//Redirigir

  $scope.EditarRutinaInfo = function()
  {
    bootbox.confirm("Desea editar esta rutina?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            $scope.btndisabled = false;
            $scope.rutina.Accion = "EditarInfoRutina";
            var params = JSON.stringify($scope.rutina);
            var url = 'modulos/Rutinas/Funciones.php';
           $http({method: "post",url: url,data: $.param({Params:params}), 
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
          })
           .success(function(data, status, headers, config) 
           {            
              $scope.btndisabled = true;
              exito = data.exito;
              if(exito==1) 
              {
                $methodsService.alerta(1,"Información Editada");
              }else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
            })  
           .error(function(data, status, headers, config){
            $methodsService.alerta(2,"algo falló, disculpe las molestias");
           });
        });
      }//if
  });
  }//EditarRutinaInfo

  //Buscando los datos pertinentes
  var params = $methodsService.Json("DatosEditarRutina",$scope.Rut);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exito  = data.exito;  exitot = data.exitot; 
          exitog = data.exitog; exitoc = data.exitoc;
          exitor = data.exitor;
          switch(true)
          {
            case exito==1 && exitot==1 && exitog==1 && exitoc==1 && exitor==1:
              //Tomando los datos
              $scope.rutina  = data.rutina;
              $scope.cat_rut = data.cat_rut;
              $scope.generos = data.generos;
              $scope.cuerpos = data.cuerpos;
            break;

            case exito!=1 || exitot!=1 || exitog!=1 || exitoc!=1 || exitor!=1:
              $methodsService.alerta(2,"algo falló, disculpe las molestias");
            break;
          }//switch
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})//RutinaEditar


//Aquí comienza la edición de ejercicios.
.controller('DiasRutinaEditar',function($scope,$http,$location,$methodsService,$routeParams,$cookies){
  $scope.Rut = $routeParams.Rut;
  var demo2 = $('.demo2').bootstrapDualListbox({
          nonSelectedListLabel: 'Non-selected',
          selectedListLabel: 'Selected',
          preserveSelectionOnMove: 'moved',
          moveOnSelect: false
            } );
/*var cookies = $cookies.getAll();
angular.forEach(cookies, function (v, k) {
    $cookies.remove(k);
});*/
  //Funciones
  $scope.checkRequeridos = function()  
  {
    bootbox.confirm("Desea eliminar los ejercicios de esto días?", function(result) {
    if(result==true)
      {
        $scope.$apply(function(){
             //Tomando las tipos de rutina
            CantidadDias=document.getElementById("bootstrap-duallistbox-nonselected-list_duallistbox_demo2").length;

            if(CantidadDias==$scope.dias.length)
            {
                $methodsService.alerta(2,"Favor de seleccionar días");
            }//if
            else
            {
                // Definiendo variables y cookies para la selecciónd e ejercicios de las rutinas
                DiasEdicion=new Array(); //Array donde se guardarán los tipos de rutina para este día.
                $(".box2 .Actividad").each(function(){
                  dia=$(this).val(); //Valor de la rutina tomada de las que están seleccionadas.
                  DiasEdicion.push(dia); //Insertando las Rutinas en el array.
                });//each
                
                CantidadDias = DiasEdicion.length;
                // definiendo todas las variables
                var Contador = 0; // Días editados
                $cookies.put("Contador",Contador);
                $cookies.put("DiasEdicion",DiasEdicion); //Vector con los días a editar
                $cookies.put("CantidadDias",CantidadDias); //Cantidad de días que se editarán, se compararán el contador y este para ver si ya se terminó.
                
                //Eliminando los ejercicios de los días seleccionados
                Arr                 = new Object();
                Arr['id_rutina']    = $scope.Rut;
                Arr['DiasEdicion']  = DiasEdicion;
                Arr['CantidadDias'] = DiasEdicion.length;
                Arr['Accion']       = "DesactivarEjerciciosPorRutina";
                params              = JSON.stringify(Arr);
                
                //Enviando al controller para desactivar.
                var url = 'modulos/Rutinas/Funciones.php';
                 $http({method: "post",url: url,data: $.param({Params:params}), 
                  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
                })
                 .success(function(data, status, headers, config) 
                 {            
                      exito = data.exito;
                      if(exito==1)
                      {
                        $location.path('/Rutinas_EditarDias').search({Rut:$scope.Rut});
                      }//if
                      else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
                  })  
                 .error(function(data, status, headers, config){
                  $methodsService.alerta(2,"algo falló, disculpe las molestias");
                 });

            } //ELSE              
        });
      }//if
  });
  }//checkRequeridos

  var params = $methodsService.Json("DatosEditarRutinaDias",$scope.Rut);
  var url = 'modulos/Rutinas/Funciones.php';
     $http({method: "post",url: url,data: $.param({Params:params}), 
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
    })
     .success(function(data, status, headers, config) 
     {            
          exito = data.exito;
          if(exito==1)
          {
              $scope.dias = data.dias;
              //Pegando los tipos rut en la tabla de selección
            var size = $scope.dias.length;
            
            for(i=0; i<size; i++)
            {
              var object = $scope.dias[i];
              var row ='<option value="'+object.id+'" class="Actividad">'+object.nb_dia+'</option>';
              demo2.append(row);
            }//for
             demo2.bootstrapDualListbox('refresh');   
          }
            
            
          
          else{$methodsService.alerta(2,"algo falló, disculpe las molestias");}
      })  
     .error(function(data, status, headers, config){
      $methodsService.alerta(2,"algo falló, disculpe las molestias");
     });
})//DiasRutinaEditar


//Aquí eliges los tipos de rutina en los días a editar.
.controller('DiasRutinaSeleccion',function($scope,$http,$location,$methodsService,$routeParams,$cookies){
//variables
$scope.mostrarbuscando = true;
$scope.mostrarcontent  = false;

//funciones
$scope.RegistrarEjercicios = function()
{

  bootbox.confirm("Desea continuar?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
              IdDiasRutinas = new Array(); //Vector con los ids de los inputs
              DiasRutinas   = new Array(); //Vector con los id de los tipos de rutinas, números 1,2,3,etc.
              TextoRutinas  = new Array(); //Vector con los textos de tipos de rutina

              //haciendo un ciclo para tomar los valores y demás del dom
             IdDiasRutinas = $scope.IdDiasRutinas;

              for(i=0; i<$scope.IdDiasRutinas.length; i++)
              {
                var id       ="#"+$scope.IdDiasRutinas[i];
                var valInput = $(id).val();
                DiasRutinas.push(valInput);

                var id2 = id+" option:selected";
                TextoInput=$(id2).text();
                TextoRutinas.push(TextoInput);
              }//for
              
              // Definiendo lo necesario para pasar a la selección
              // de ejercicios.
              Cantidad   = DiasRutinas.length; //Para comparar con el contador
              Contador   = 0;          //Contador de cuantos días se llevan hechos
              TipoRutina = TextoRutinas[Contador]; //Texto de la rutina del primer elemento del vectór para determinar si es simple o complicada
              CodigoDia  = $methodsService.VerificarDiaPorCodigo(IdDiasRutinas[Contador]); //número de día para mandar a la siguiente pantalla el día que será editado

              //Definiendo que tipo de rutina será la primera a editar
              Tipo_RutinaActual = (TipoRutina!="Varios")?"Simple":"Compleja"; //Se toma el tipo de rutina que se ha seleccionado para ver a donde se 

              //Definiendo el día actual de la rutina
              Dia_ActualRutina=IdDiasRutinas[Contador];

              //Definiendo las cookies necesarias.
              $cookies.put("DiasRutinas",DiasRutinas);
              $cookies.put("IdDiasRutinas",IdDiasRutinas);
              $cookies.put("TextoRutinas",TextoRutinas);
              $cookies.put("ContadorDiasEditar",Contador); 
              $cookies.put("Tipo_RutinaActual",Tipo_RutinaActual); //Cookie para saber en que tipo de rutina se encuentra la edición actual 
              $cookies.put("Dia_ActualRutina",Dia_ActualRutina);//Día actual de la rutina donde nos encontramos

              //Definiendo a donde se dirige por el tipo de rutina.
              if(Tipo_RutinaActual=="Compleja")
              {
                console.log("hola dude complejo.");
                $location.path('/Rutina_CompEdit').search({Rut:$scope.Rut,Day:CodigoDia});
                //window.location='index.php?nav=Rutina_CompEdit&Rut='+id_rutina+'&Day='+CodigoDia; //Elegir rutinas porm día
              }//if Tipo_RutinaActual=="Compleja
              else
              {
                //Tomando la rutina actual  a seguir 
                RutinaActualEditar = DiasRutinas[Contador];
                $location.path('/Rutina_EditarSencillo').search({Rut:$scope.Rut,Day:CodigoDia,TipoRut:RutinaActualEditar});
                //window.location='index.php?nav=Rutina_EditarSencillo&Day='+CodigoDia+"&Rut="+id_rutina+"&TipoRut="+RutinaActualEditar;  
              } //else  

        });
      }//if
  });
    
}//RegistrarEjercicios

// Tomando los datos necesarios.
$scope.Rut         = $routeParams.Rut;
var diasa           = $cookies.get("DiasEdicion");
$scope.DiasEdicion = diasa.split(",");
$scope.Contador    = $cookies.get("Contador");
var cantidad       = $scope.DiasEdicion.length;
$scope.dias        = [];
$scope.IdDiasRutinas = [];
console.log($scope.DiasEdicion);

//Definiendo los objetos de días para cambiar los valores
for(i=0; i<cantidad; i++)
{
  var diaEdicion = $scope.DiasEdicion[i];
  var NombreDia  = $methodsService.DefinirDia(diaEdicion);
  var id_input   = $methodsService.RetornarIdPorNombre(NombreDia);
  var dia = new Object();
  dia['diaEdicion']  = diaEdicion
  dia['NombreDia']  = NombreDia
  dia['id_input']  = id_input;
  $scope.dias.push(dia);
}//for

//BUscando los tipos de rutinas que existen
var params = $methodsService.Json("TiposRutina",1);
var url = 'modulos/Rutinas/Funciones.php';
 $http({method: "post",url: url,data: $.param({Params:params}), 
  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
})
 .success(function(data, status, headers, config) 
 {            console.log(data);
     existe = data.existe;
     if(existe==1)
     {
        $scope.mostrarbuscando = false;
        $scope.mostrarcontent  = true;
        $scope.tiposRut = data.tiposRut;

        //Pegando las opciones al contenedor
        for(i=0; i<cantidad; i++)
        {
            var div = '<div class="form-group">';
                div+= '<h2 class="text-center">'+$scope.dias[i].NombreDia+'</h2>';
                div+= '<select class="form-control"  class="form-control SelectDia"  id="'+$scope.dias[i].id_input+'" required>';
                div+= '<option value="">Seleccionar...</option>';
                div+= '</select>';
                div+= '</div>';
                $(".container").append(div);

                //tomando todos los ids
                $scope.IdDiasRutinas.push($scope.dias[i].id_input);
                idjquery = "#"+$scope.dias[i].id_input;
            //Pegando las opciones a los div
            for(f=0; f<$scope.tiposRut.length; f++)
            {
              rut = $scope.tiposRut[f];
              var option = '<option value="'+rut.id+'">'+rut.nb_tiporutina+'</option>';

              $(idjquery).append(option);
            }//for
        }//for

     }else{ $methodsService.alerta(2,"algo falló, disculpe las molestias");}
  })  
 .error(function(data, status, headers, config){
  $methodsService.alerta(2,"algo falló, disculpe las molestias");
 });
})//DiasRutinaSeleccion

//Aquí es la rutina compleja donde seleccions tipos de rutina por día.
.controller('RutinaCompEdit',function($scope,$http,$location,$methodsService,$routeParams,$cookies){
// Tomando las variables
$scope.Rut = $routeParams.Rut;
$scope.Day = $routeParams.Day;

//Funciones
$scope.Guardar = function()
{
  bootbox.confirm("Desea ver esta rutina?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            //Verificando si eligieron clases de rutina
            CantidadTiposRutina=document.getElementById("bootstrap-duallistbox-nonselected-list_duallistbox_demo2").length;
          
            if(CantidadTiposRutina==$scope.TiposRut.length)
            {
                $methodsService.alerta(2,"Favor de seleccionar tipos de rutinas");
            }//if
            else
            {
                // Definiendo variables y cookies para la selecciónd e ejercicios de las rutinas
                RutinasDiaEdicion = new Array(); //Array donde se guardarán los tipos de rutina para este día.
                $(".box2 .Actividad").each(function(){
                  TipoRutina=$(this).val(); //Valor de la rutina tomada de las que están seleccionadas.
                  RutinasDiaEdicion.push(TipoRutina); //Insertando las Rutinas en el array.
                });//each
                console.log(RutinasDiaEdicion);
                
                //Tomando los valores para agregar a la BD
                TotalActividadesDiaActual    = RutinasDiaEdicion.length;  //Cantidad de actividades a realizar, se comparará con contador para saber si se completaron todas.
                ContadorActividadesDiaActual = 0; //Contador de cuantas actividades se harán por este día
                RutinaActual                 = RutinasDiaEdicion[ContadorActividadesDiaActual]; //Tipo de actividad que toca para el día actual
                
                //definiendo las cookies
                $cookies.put("RutinasDiaEdicion",RutinasDiaEdicion); //Array donde se guardan las cantidades de rutinas a realizar.
                $cookies.put("TotalActividadesDiaActual",TotalActividadesDiaActual); //Cantidad total de actividades.
                $cookies.put("ContadorActividadesDiaActual",ContadorActividadesDiaActual); //Contador para saber cuantas llevan hechas.
                $cookies.put("RutinaActual",RutinaActual); //Rutina Actual que será

                //Mandando a definir la los ejercicios por rutina.
                $location.path('/Rutina_EditarSencillo').search({Rut:$scope.Rut,TipoRut:RutinaActual});

            } //ELSE 
        });
      }//if
  });
}//Guardar

//Pintando los datos pertinentes-
$scope.nombreDia = $methodsService.DefinirDia($scope.Day);

//Variable del dualbox
var demo2 = $('.demo2').bootstrapDualListbox({
        nonSelectedListLabel: 'Non-selected',
        selectedListLabel: 'Selected',
        preserveSelectionOnMove: 'moved',
        moveOnSelect: false
      });

//Obteniendo los tipos de rutina para colocarlos.
var params = $methodsService.Json("BuscarTiposRutinaEdit",1);
console.log(params);
var url = 'modulos/Rutinas/Funciones.php';
$http({method: "post",url: url,data: $.param({Params:params}), 
headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
})
.success(function(data, status, headers, config) 
{            
  exito = data.exito;
   if(exito==1)
   {
      
      $scope.TiposRut =  data.TiposRut;

      //Pegando las opciones en el dual box.
      var size = $methodsService.sizeObject($scope.TiposRut);
      console.log($scope.TiposRut);
      for(i=0; i<size; i++)
      {
        var object = $scope.TiposRut[i];
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

})

.controller('RutinaEditarSencillo',function($scope,$http,$location,$methodsService,$routeParams,$cookies){

//Tomando los valores
$scope.Rut         = $routeParams.Rut;
$scope.Day         = $routeParams.Day;

//Definiendo los elementos en la pantalla.
$scope.DiasEdicion = $cookies.get("DiasEdicion"); //ids de los dias
$scope.Contador    = $cookies.get("Contador"); //Contador de los días
var numdia         = $scope.DiasEdicion[$scope.Contador];
$scope.nombreDia   = $methodsService.DefinirDia(numdia);
var params         = "";

//Funciones
$scope.RegistrarEjercicios = function()
{
  bootbox.confirm("Desea Registrar estos ejercicios para el día "+$scope.nombreDia+"?", function(result) {
    console.log(result);
      if(result==true)
      {
        $scope.$apply(function(){
            //Verificando si realmente se eligieron ejecicios.
            CantidadTiposRutina=document.getElementById("bootstrap-duallistbox-nonselected-list_duallistbox_demo2").length;
          
            if(CantidadTiposRutina==$scope.ejercicios.length)
            {
                $methodsService.alerta(2,"Favor de seleccionar tipos de rutinas");
            }//if
            else
            {
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
                CantidadEjercicios  = EjerciciosRutina.length;
                Arr=new Object();
                Arr['id_rutina']          = $scope.Rut;
                Arr['id_dia']             = $scope.Day;
                Arr['id_CategoriaRutina'] = $scope.rutina.id_categoriarutina;     
                Arr['EjerciciosRutina']   = EjerciciosRutina;
                Arr['CantidadEjercicios'] = CantidadEjercicios;
                Arr['id_TipoRutina']      = $scope.ejercicios[0].id_tiporutina;
                Arr['Accion']             = "RegistrarEjerciciosRutinas";
                //Mandando por ajax a guardar 
                params = JSON.stringify(Arr);
                
                // Mandando por AJax a la bd los ejercicios.
                var url = 'modulos/Rutinas/Funciones.php';
                 $http({method: "post",url: url,data: $.param({Params:params}), 
                  headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
                })
                 .success(function(data, status, headers, config) 
                 {            
                      exito = data.exito;
                      if(exito==1)
                      {
                        //Verificando que tipo de rutina es
                        Tipo_RutinaActual=$cookies.get("Tipo_RutinaActual");
                        //Se trae los datos de los días actuales
                        DiasRutinas   = $cookies.get("DiasRutinas");//Vector con los id de los tipos de rutinas (1-8) (Declarado en Rutina_CompEdit)
                        IdDiasRutinas = $cookies.get("IdDiasRutinas"); //Vector con los ids de los inputs ej. lunes_Ejercicio(Declarado en Rutina_CompEdit)
                        TextoRutinas  = $cookies.get("TextoRutinas");//Vector con los textos de tipos de rutina (Declarado en Rutina_CompEdit)
                        DiasEdicion   = $cookies.get("DiasEdicion") //Vector con el id de los días que serán editados, ej: Lunes, martes, etc. (Rutinas_editar.php)
                        ContadorDias  = $cookies.get("ContadorDiasEditar"); //Contador de los días (Declarado en rutinas_EditarDias)
                        CantidadDias  = $cookies.get("CantidadDias"); //cantidad total de los días a editar(Declarado en rutinas_EditarDias)
                      }
                  })  
                 .error(function(data, status, headers, config){
                  $methodsService.alerta(2,"algo falló, disculpe las molestias");
                 });

            } //ELSE
        });
      }//if
  });
}//RegistrarEjercicios


//Variable para pegar opciones
var demo2 = $('.demo2').bootstrapDualListbox({
        nonSelectedListLabel: 'Non-selected',
        selectedListLabel: 'Selected',
        preserveSelectionOnMove: 'moved',
        moveOnSelect: false
      });

//Definiendo el tipo de rutina actual
$scope.Tipo_RutinaActual = $cookies.get("Tipo_RutinaActual");

if($scope.Tipo_RutinaActual=="Compleja")
{
  //Si se entra aquí es que se eligió el tipo de rutina compleja
  //Tipo de rutina
  $scope.RutinasDiaEdicion = $cookies.get("RutinasDiaEdicion"); //Tipos de rutina elegidas para este día.
  var ContadorActividadesDiaActual = $cookies.get("ContadorActividadesDiaActual");
  var rutinaEjercicios = $scope.RutinasDiaEdicion[ContadorActividadesDiaActual];
  params = $methodsService.Json("BuscarEjerciciosPorRutina",rutinaEjercicios);
 
}//if
else
{
    $scope.TipoRut = $routeParams.TipoRut;
    params         = $methodsService.Json("BuscarEjerciciosPorRutina",$scope.TipoRut);
  
}//else

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
          //Pegando las opciones en el dual box.
          var size = $methodsService.sizeObject($scope.ejercicios);
          
          for(i=0; i<size; i++)
          {
            var object = $scope.ejercicios[i];
            var row ='<option value="'+object.id+'" class="Actividad">'+object.nb_ejercicio+'</option>';
            demo2.append(row);
          }//for
           demo2.bootstrapDualListbox('refresh');
      }//if

      
  })  
 .error(function(data, status, headers, config){
  $methodsService.alerta(2,"algo falló, disculpe las molestias");
 });

//Buscando el id de tipo
var params2 = $methodsService.Json("DatosEditarRutina",$scope.Rut);
var url = 'modulos/Rutinas/Funciones.php';
$http({method: "post",url: url,data: $.param({Params:params2}), 
headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
})
 .success(function(data, status, headers, config) 
 {   
      exito = data.exito;
      if(exito==1)
      {
        $scope.rutina = data.rutina;
      }
  })  
 .error(function(data, status, headers, config){$methodsService.alerta(2,"algo falló, disculpe las molestias");});


})//RutinaEditarSencillo