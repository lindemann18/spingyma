<?php
	require("includes/PDF/fpdf.php");
	include("libs/libs.php");
/*	$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,'¡Hola, Mundo!');
$file='pdf.pdf';
 $filename= "Invoice.pdf"; 
 $filelocation = "C:\\xampp"; */ 
 	 //Consiguiendo la info de la rutina
 
 $consultar=new consultar();

 $id_rutina=1;


$html = '
<h1><a name="top"></a>mPDF</h1>
<h2>Basic HTML Example</h2>
This file demonstrates most of the HTML elements.
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>
<p>P: Nulla felis erat, imperdiet eu, ullamcorper non, nonummy quis, elit. Suspendisse potenti. Ut a eros at ligula vehicula pretium. Maecenas feugiat pede vel risus. Nulla et lectus. Fusce eleifend neque sit amet erat. Integer consectetuer nulla non orci. Morbi feugiat pulvinar dolor. Cras odio. Donec mattis, nisi id euismod auctor, neque metus pellentesque risus, at eleifend lacus sapien et risus. Phasellus metus. Phasellus feugiat, lectus ac aliquam molestie, leo lacus tincidunt turpis, vel aliquam quam odio et sapien. Mauris ante pede, auctor ac, suscipit quis, malesuada sed, nulla. Integer sit amet odio sit amet lectus luctus euismod. Donec et nulla. Sed quis orci. </p>

<hr />

<div><img src="tiger.wmf" style="float:right;">DIV: Proin aliquet lorem id felis. Curabitur vel libero at mauris nonummy tincidunt. Donec imperdiet. Vestibulum sem sem, lacinia vel, molestie et, laoreet eget, urna. Curabitur viverra faucibus pede. Morbi lobortis. Donec dapibus. Donec tempus. Ut arcu enim, rhoncus ac, venenatis eu, porttitor mollis, dui. Sed vitae risus. In elementum sem placerat dui. Nam tristique eros in nisl. Nulla cursus sapien non quam porta porttitor. Quisque dictum ipsum ornare tortor. Fusce ornare tempus enim. </div>
';



 class PDF extends FPDF
{
	

// Cabecera de página
function Header()
{
	global $id_rutina;
	$consultar=new consultar();
	 $result2=$consultar->_ConsultarInformacionRutinaPreFinalClientePorId($id_rutina);
 $fila2=$result2->fetch_assoc();
  $nb_rutina=$fila2['nb_rutina'];
    // Logo
    $this->Image('C:/xampp/htdocs/Spinpgym/includes/PDF/logo.jpg',10,8,33);
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    // Movernos a la derecha
    $this->Cell(80);
    // Título
    $this->Cell(110,10,$nb_rutina,1,0,'C');
    // Salto de línea
    $this->Ln(20);
}

// Pie de página
function Footer()
{
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}
}

// Creación del objeto de la clase heredada
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',12);

 $result=$consultar->_ConsultarInformacionRutinaPreFinalClientePorId($id_rutina);
$num_ejercicios=$result->num_rows;
$contLunes=0;
for($i=1;$i<$num_ejercicios;$i++)
{
	$fila=$result->fetch_assoc();
	if($fila['nb_dia']=="Lunes")
	{
		if($contLunes==0)
		{
			$pdf->Cell(0,10,$fila['nb_dia'],0,1);
			$contLunes++;
		}	
		$TipoRutina=$fila['nb_TipoRutina'];
		$pdf->MultiCell(63, 10, $TipoRutina, 1);
		$pdf->Ln(0);
		$nb_Ejercicio=$fila['nb_ejercicio'];
		$pdf->MultiCell(63, 10, $nb_Ejercicio, 1);
		
	}//día lunes
		
}
    //$pdf->Cell(0,10,'Imprimiendo línea número '.$i,0,1);
 
 
 $filename="C:/xampp/htdocs/Spinpgym/test.pdf";
$pdf->Output($filename,"F");
?>

