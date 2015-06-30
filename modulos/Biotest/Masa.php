<style type="text/css">
	#ContentCondicion h2{text-align: center; margin-right: 18%;}
	#ContentCondicion img {width: 34%; float: right; margin-right: 41%;}
	.formulario {margin-top: 4%;}
	.pregunta {float: right; margin-right: 26%; }
	.pregunta label {float: left; margin-top: 0%; font-size: 22px; margin-bottom: 3%; margin-left: 0%;}
</style>
<?php
	
	if(isset($_SESSION['Sesion']) && $_SESSION['Sesion']['id_usuario']!="")
	{
		$id_cliente=$_GET['id'];
		//verificar si el usuario ya se hizo alguna vez el biotest
			require_once("libs/libs.php");
			$consultar=new Consultar();
			$result=$consultar->_ConsultarBioTestPorIdCliente($id_cliente);
			$num=$result->num_rows;
			//Si existe más de 0 registros, la persona ya hizo el biotest, lo que significa que ahora se editan los datos del biotest
			$permiso=false; //si lapersona ya hizo el formulario puede hacer el biotest, si no, no puede.
			if($num>0)
			{
				$permiso=true;	
			}
?>
		<?php if($permiso==true){?>
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        BioTest
                        <small>Evaluación F&iacute;sica</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="">BioTest</li>
                         <li class="fa fa-dashboard">Condici&oacute;n</li>
                    </ol>
                </section>
                
                
                <!-- Main content -->
                <section class="content">
                	<!-- HEADER DEL CONTENIDO-->
                    <h4 class="page-header">
                        Apartado de Masa Muscular
                        <small>
                        	En este apartado podr&aacute; hacer el test de Masa Muscular  a todos los Clientes registrados 
                            en <span class="text-red">spin gym</span>,además podrá ver resultados y consejos para mejorar o mantener
                             su Peso.
                        </small>
                    </h4>
                    <!-- HEADER DEL CONTENIDO-->
                    <div class="alert alert-success alert-dismissible" role="alert" style="display:none;" id="UsuarioEliminadoNotificacion">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Bien Hecho!</strong> Cliente Eliminado.</div>
					<div class="row">
                    	<div class="col-xs-12">
							<div class="box">
                            
                            <!-- APARTADO DEL FORMULARIO DONDE NO SE HA HECHO LA EVALUACIÓN FÍSICA-->
                                <div class="box-header">
                                    <div class="col-sm-12">
                                    	<h4 class="text-center">Para comenzar el examen de Masa Muscular, debe medir la Masa Muscular del cliente
                                       en todos los músculos pertinentes he ingresar el Resultado en la caja de texto. </h4>
                                        
                                        <div class="col-sm-12" id="ContentCondicion">
                                        	<h2 id="titleCondicion">Masa Muscular</h2>
                                            <img src="css/img/masa.jpg" alt="">
                                        </div><!--ContentCondicion -->
                                        
                                        <div class="formulario col-xs-12">
                                            <form action="index.php?nav=Resultado2" method="post">
                                            <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-5 text-right">Cintura: </label>
                                                    <div class="col-xs-5">
                                                        <input type="text" name="Cintura" id="Cintura" placeholder="Ingrese IMM De cintura"
                                                        class="form-control">
                                                    </div>
												</div><!--pregunta -->
                                                
                                                   <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-5 text-right">Cadera: </label>
                                                    <div class="col-xs-5">
                                                        <input type="text" name="Cadera" id="Cadera" placeholder="Ingrese IMM De Cadera"
                                                        class="form-control">
                                                    </div>
												</div><!--pregunta -->
                                                
                                                <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-5 text-right">Perímetro Espalda: </label>
                                                    <div class="col-xs-5">
                                                        <input type="hidden" id="Id_Cliente" name="Id_Cliente" value="<?php echo $id_cliente?>">
                                                        <input type="hidden" name="TipoPrueba" id="TipoPrueba" value="4">
                                                        <input type="text" name="Perimetro_Espalda" id="Perimetro_Espalda" placeholder="Ingrese IMM De Espalda"
                                                        class="form-control">
                                                    </div>
												</div><!--pregunta -->
                                                    <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-5 text-right">Perímetro Pecho: </label>
                                                    	<div class="col-xs-5">
                                                            <input type="text" name="Perimetro_Pecho" id="Perimetro_Pecho" placeholder="Ingrese IMM De Pecho"
                                                            class="form-control">
                                                        </div>
                                                    </div>
                                                
                                               <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-5 text-right">Perímetro Brazo Relajado: </label>
                                                    <div class="col-xs-5">
                                                        <input type="text" name="Perimetro_brazo_relajado" id="Perimetro_brazo_relajado" 
                                                        placeholder="Ingrese IMM De Brazo Relajado" class="form-control">
                                                    </div>
												</div><!--pregunta -->
                                                
                                                 <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-5 text-right">Perímetro Brazo Flexionado: </label>
                                                    <div class="col-xs-5">
                                                        <input type="text" name="Perimetro_brazo_flexionado" id="Perimetro_brazo_flexionado"
                                                         placeholder="Ingrese IMM De Brazo Flexionado" class="form-control">
                                                    </div>
												</div><!--pregunta -->
                                                
                                                 <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-5 text-right">Perímetro Femoral: </label>
                                                    <div class="col-xs-5">
                                                        <input type="text" name="Perimetro_femoral" id="Perimetro_femoral" 
                                                        placeholder="Ingrese IMM De perímetro Femoral" class="form-control">
                                                    </div>
												</div><!--pregunta -->
                                                
                                                 <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-5 text-right">Perímetro Pantorrilla: </label>
                                                    <div class="col-xs-5">
                                                        <input type="text" name="Perimetro_Pantorrilla" id="Perimetro_Pantorrilla" placeholder="Ingrese IMM De Pantorrilla"
                                                        class="form-control">
                                                    </div>
                                                    
                                                         <button type="submit" class="btn btn-success" >Evaluar</button>
												</div><!--pregunta -->
                                                
                                                </div><!--formulario -->
                                            </form>
                                    </div><!--col-sm-12 -->
                                </div><!-- /.box-header -->
                                
                                
                             	<div class="box-body">
                                
                                </div><!-- box-body-->
                            </div><!--box -->
                        </div><!--col-xs-12 -->
                    </div><!--row -->
                </section>
            </aside>

</div>
<?php }else {?>
 <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        BioTest
                        <small>Evaluación F&iacute;sica</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="">BioTest</li>
                         <li class="fa fa-dashboard">Condici&oacute;n</li>
                    </ol>
                </section>
                
                
                <!-- Main content -->
                <section class="content">
                	<!-- HEADER DEL CONTENIDO-->
                    <h4 class="page-header">
                        Apartado de Peso
                        <small>
                        	En este apartado podr&aacute; hacer el test de Peso  a todos los Clientes registrados 
                            en <span class="text-red">spin gym</span>,además podrá ver resultados y consejos para mejorar o mantener
                             su Peso.
                        </small>
                    </h4>
                    <!-- HEADER DEL CONTENIDO-->
                    <div class="alert alert-success alert-dismissible" role="alert" style="display:none;" id="UsuarioEliminadoNotificacion">
  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <strong>Bien Hecho!</strong> Cliente Eliminado.</div>
					<div class="row">
                    	<div class="col-xs-12">
							<div class="box">
                            
                            <!-- APARTADO DEL FORMULARIO DONDE NO SE HA HECHO LA EVALUACIÓN FÍSICA-->
                                <div class="box-header">
                                    <div class="col-sm-12">
                                    	<h4 class="text-center">
                                        	Para Poder hacer el biotest debe Llenar el formulario OBLIGATORIO de salud. De click en el botón para
                                            hacer el formulario.
                                        </h4>
                                            <div class="col-sm-2 pull-right" id="">
	                                            <input type="hidden" id="Id_Cliente" name="Id_Cliente" value="<?php echo $id_cliente?>">
                                                <label>Formulario: </label>
                                                <button type="submit" class="btn btn-success pull-right" onclick="LlevarAlFormulario()" >Formulario</button>
                                            </div>
                                    </div><!--col-sm-12 -->
                                </div><!-- /.box-header -->
                                
                                
                             	<div class="box-body">
                                
                                </div><!-- box-body-->
                            </div><!--box -->
                        </div><!--col-xs-12 -->
                    </div><!--row -->
                </section>
            </aside>

</div>

<?php }?>


        
      
<?php include('includes/footer.php');?>


<?php } else {header("Location: Login.php");}?>
<script>
$(document).ready(function(){
	var raizModulo = 'clientes_listadp.php';
	//AÑADIMOS LA CLASE ACTIVE, AL <LI> DEL MENU LATERAL, ESTO CON LA
	//FINALIDAD DE QUE SE SEPA EN QUE SECCIÓN SE ENCUENTRA EL USUARIO
	$('#m-biotest').addClass('active');
	
	//DAMOS EL FOCO AL INPUT DEL NOMBRE
	//$('#nb_cliente').focus();
	
	idClienteEliminar=0;
		
	
});//document ready

function TestCondicion()
{
	var Arr=new Object();	
	Arr['Id_Cliente']		= $("#Id_Cliente").val();
	Arr['ResultadoEvaluado']= $("#ResultadoEvaluado").val();
	Arr['Accion']			="CondicionFisica";
	
	var Params= JSON.stringify(Arr);	
	console.log(Params);
		$.ajax({
				
				cache: false,
				type: "GET",
				contentType:false,
				processData:false,
				url: "modulos/Biotest/Funciones.php?Params="+Params,
				data: Params,
				datatype:"json",
				success: function(response){
					console.log(response);	
					var objJSON = eval("(function(){return " + response + ";})()");
					
					
				}
				
			});	
}//TestCondicion
</script>