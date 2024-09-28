<?php

require_once "mainModel.php";

class usuarioModelo extends mainModel{

     /*----------Modelo Agregar usuario----------*/
     protected static function agregar_usuario_modelo($datos){

          $sql=mainModel::conectar()->prepare("INSERT INTO usuarios(usu_cedula,usu_nombre,usu_apellido)
           VALUES(:DNI,:Nombre,:Apellido)");
          $sql->bindParam(":DNI",$datos['DNI']);
          $sql->bindParam(":Nombre",$datos['Nombre']);
          $sql->bindParam(":Apellido",$datos['Apellido']);
          $sql->execute();

          return $sql;
     }
}