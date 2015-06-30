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
                         <li class="fa fa-dashboard">IMC</li>
                    </ol>
                </section>
                
                
                <!-- Main content -->
                <section class="content">
                	<!-- HEADER DEL CONTENIDO-->
                    <h4 class="page-header">
                        Apartado de IMC
                        <small>
                        	En este apartado podr&aacute; hacer el test de índice de masa corporal  a todos los Clientes registrados 
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
                                    	<h4 class="text-center">Para comenzar el examen de índice de masa corporal, debe medir el <strong>Peso</strong> 
                                        	y la <strong>Altura</strong> en  <strong>Kilogramos</strong> y en <strong>Cent&iacute;metros</strong>,
                                            esto es de manera <strong>Forzosa</strong>.
                                        </h4>
                                        
                                        <div class="col-sm-12" id="ContentCondicion">
                                        	<h2 id="titleCondicion">IMC</h2>
                                            <img src="css/img/imc.jpg" alt="">
                                        </div><!--ContentCondicion -->
                                        
                                        <div class="formulario col-xs-12">
                                            <form action="index.php?nav=Resultado" method="post">
                                                <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-2">Peso: </label>
                                                    <div class="col-xs-5">
                                                        <input type="hidden" id="Id_Cliente" name="Id_Cliente" value="<?php echo $id_cliente?>">
                                                        <input type="hidden" name="TipoPrueba" id="TipoPrueba" value="3">
                                                        <input type="text" name="Peso" id="Peso" placeholder="Ingrese el Peso KG"
                                                        class="form-control">
                                                    </div>
												</div><!--pregunta -->
                                                    <div class="pregunta col-xs-6">
                                                    <label for="" class="col-sm-2">Altura: </label>
                                                    	<div class="col-xs-5">
                                                            <input type="text" name="Altura" id="Altura" placeholder="Ingrese la Altura CM"
                                                            class="form-control">
                                                        </div>
                                                         <button type="submit" class="btn btn-success" >Evaluar</button>
                                                    </div>
                                                
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