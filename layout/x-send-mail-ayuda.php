<?php  

// Llamando a los campos
$nombre = $_POST['name'];
$correo = $_POST['email'];
$telefono = $_POST['phone'];
$mensaje = $_POST['message'];
$ip = $_SERVER['REMOTE_ADDR'];
    
// Datos para el correo
$destinatario = "giraprepa+ayuda@gmail.com";
$asunto = "Contact for Help";

$carta = "De: $nombre \n";
$carta .= "Correo: $correo \n";
$carta .= "Telefono: $telefono \n";
$carta .= "Mensaje: $mensaje \n";
$carta .= "IP: $ip";

// Enviando Mensaje
mail($destinatario, $asunto, $carta);
header('Location:/contacto/correo-enviado.php');

?>