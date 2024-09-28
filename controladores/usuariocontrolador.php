<?php 
if($peticionAjax){
    require_once "../modelos/usuariomodelo.php";
}else{
    require_once "../modelos/usuariomodelo.php";
}
 
class usuariocontrolador extends usuarioModelo{
     /*----------Contrlador Agregar usuario----------*/
     public static function agregar_usuario_controlador(){
       $dni = mainModel::limpiar_cadena($_POST['usuario_dni_reg']);
       $nombre = mainModel::limpiar_cadena($_POST['usuario_nombre_reg']);
       $apellido = mainModel::limpiar_cadena($_POST['usuario_apellido_reg']);
       $usuario = mainModel::limpiar_cadena($_POST['usuario_usuario_reg']);
       $clave1 = mainModel::limpiar_cadena($_POST['usuario_clave_1_reg']);
       $clave2 = mainModel::limpiar_cadena($_POST['usuario_clave_2_reg']);
       
       /* Comprobar campos vacios */
       if($dni == "" || $nombre == "" || $apellido == "" || $usuario == "" || $clave1 == "" || $clave2 == ""){
           $alerta = [
               "Alerta" => "simple",
               "Titulo" => "Ocurrio un error inesperado",
               "Texto" => "No has llenado todos los campos requeridos",
               "Tipo" => "error"
           ];  
           echo json_encode($alerta);
           exit();
       }
    }
}
?>