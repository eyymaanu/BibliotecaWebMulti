<?php
class mainModel {
    // Configura tus constantes para la conexión
    private const SGBD = 'mysql:host=localhost;dbname=nombre_de_base_de_datos';
    private const USER = 'usuario';
    private const PASS = 'contraseña';

    // Método para conectar a la base de datos
    protected static function conectar() {
        try {
            // Crear una instancia de PDO
            $conexion = new PDO(self::SGBD, self::USER, self::PASS);
            
            // Establecer el modo de error de PDO para lanzar excepciones
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            // Establecer el conjunto de caracteres a UTF-8
            $conexion->exec("SET CHARACTER SET utf8");
            
            return $conexion;
        } catch (PDOException $e) {
            // Manejo de excepciones si hay un error en la conexión
            echo 'Error de conexión: ' . $e->getMessage();
            return null;
        }
    }
}
?>
_

