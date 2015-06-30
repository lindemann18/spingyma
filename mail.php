<?php
	//mail('ashernetz@hotmail.com',"sample mail","sample content", "From: chuvaca@gmail.com")
	
require 'includes/PhpMailer/PHPMailerAutoload.php';
require 'includes/PhpMailer/class.smtp.php';
$mail  = new PHPMailer();
$body="<b>This mail is sent using PHP Mailer</b>";#HTML tags can be included
$mail->IsSMTP();
$mail->SMTPAuth  = true;                 #enable SMTP authentication
$mail->SMTPSecure = "ssl";               #sets the prefix to the server
$mail->Host  = "smtp.gmail.com";         #sets GMAIL as the SMTP server
$mail->Port       = 465;                 #set the SMTP port
$mail->Username   = "ashernetz@gmail.com";                  #your gmail username
$mail->Password   = "corridorsoftime5";                  #Your gmail password
$mail->From       = "ashernetz";                  #your gmail id
$mail->FromName   = "chuvaca";                  #your name
$mail->Subject    = "Subject of the mail";
$mail->Body    = 'Hi Iam using PHPMailer library to sent SMTP mail from localhost';
 $mail->AddAttachment($_FILES['uploaded_file']['tmp_name'],
                         $_FILES['uploaded_file']['name']);
$mail->WordWrap   = 50;
$mail->AddAddress("ashernetz@hotmail.com","que pedo");
$mail->IsHTML(true); // send as HTML
if(!$mail->Send())
{
echo "Mailer Error: " . $mail->ErrorInfo;
}
else
{
echo "Message has been sent";
}

?>