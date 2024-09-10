<?php

class vistasmodelo{
/*--------------------Este es un modelo para obtener las vistas--------------------- */
    protected static function obtener_vistas_modelo($vistas){
        $whitelist = ["client-new","client-search","client-update","item-list","item-new","item-search","item-update" ,"login","reservation-list","reservation-new","home","client-list","reservation-pending","reservation-reservation","reservation-search","reservation-update","user-new","user-search","user-update","user-list"];
        if(in_array($vistas,$whitelist)){
            if(is_file("./vistas/contenidos/".$vistas."-view.php")){
                $contenido ="./vistas/contenidos/".$vistas."-view.php";
            }else{
    $contenido="404";
            }
        }else if($vistas=="login" || $vistas=="index"){
            $contenido = "login";
        }else{
            $contenido = "404";
        }
        return $contenido;
    }
 
}






?>