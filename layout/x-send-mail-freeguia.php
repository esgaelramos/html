<?php  

// Llamando a los campos
$nombre = $_POST['name'];
$correo = $_POST['email'];
$telefono = $_POST['phone'];
$mensaje = 'Me he contactado por mi guía PDF gratis.';
$ip = $_SERVER['REMOTE_ADDR'];
    
// Datos para el correo
$destinatario = "giraprepa+freeguia@gmail.com";
$asunto = "Contact for Free Guia";

$carta = "De: $nombre \n";
$carta .= "Correo: $correo \n";
$carta .= "Telefono: $telefono \n";
$carta .= "Mensaje: $mensaje \n";
$carta .= "IP: $ip";

// Enviando Mensaje
mail($destinatario, $asunto, $carta);
header('Location:/contacto/correo-enviado.php');

?>