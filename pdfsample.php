<?php
	require("includes/PDF/fpdf.php");
/*	$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,'¡Hola, Mundo!');
$file='pdf.pdf';
 $filename= "Invoice.pdf"; 
 $filelocation = "C:\\xampp"; */ 
 
 
 class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Logo
    $this->Image('C:/xampp/htdocs/Spinpgym/includes/PDF/logo.jpg',10,8,33);
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    // Movernos a la derecha
    $this->Cell(80);
    // Título
    $this->Cell(30,10,'Title',1,0,'C');
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
for($i=1;$i<=40;$i++)
    $pdf->Cell(0,10,'Imprimiendo línea número '.$i,0,1);
 
 
 $filename="C:/xampp/htdocs/Spinpgym/test.pdf";
$pdf->Output($filename,"F");
?>

