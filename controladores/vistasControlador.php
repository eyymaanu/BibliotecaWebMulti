<?php
    require_once "./modelos/vistamodelo.php";
    class vistasControlador extends vistasmodelo{
/*-------------------------Controlador Obtener PLantilla------------------------------*/
    public function obtener_plantilla_controlador(){
        return require_once "./vistas/plantilla.php";
    }
    /*-------------------------Controlador Obtener Vista------------------------------*/
    public function obtener_vistas_controlador(){
        if(isset($_GET['views'])){
            $ruta = explode("/",$_GET['views']);
            $respuesta = vistasmodelo::obtener_vistas_modelo($ruta[0]);
        }else{
            $respuesta="login";
        }
        return $respuesta;
    }
} 