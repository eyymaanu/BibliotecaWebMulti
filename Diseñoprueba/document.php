<?php
// Incluye el archivo que contiene la definición de la clase mainModel
require_once 'mainModel.php';

// Extiende la clase para usarla
class libroModel extends mainModel {
    public function obtenerLibros() {
        // Conectar a la base de datos
        $conn = self::conectar();
        
        if ($conn) {
            try {
                // Consulta SQL
                $sql = "SELECT id, titulo, autor, imagen_url FROM libros";
                
                // Preparar y ejecutar la consulta
                $stmt = $conn->prepare($sql);
                $stmt->execute();
                
                // Obtener los resultados
                $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
                
                if (count($result) > 0) {
                    // Mostrar datos
                    foreach ($result as $row) {
                        echo "<div class='libro'>";
                        echo "<h2>" . htmlspecialchars($row["titulo"]) . "</h2>";
                        echo "<p>" . htmlspecialchars($row["autor"]) . "</p>";
                        echo "<img src='" . htmlspecialchars($row["imagen_url"]) . "' alt='Imagen del libro'>";
                        echo "</div>";
                    }
                } else {
                    echo "0 resultados";
                }
            } catch (PDOException $e) {
                // Manejo de excepciones
                echo 'Error de consulta: ' . $e->getMessage();
            }
        }
    }
}

// Crear una instancia del modelo y obtener los libros
$libroModel = new libroModel();
$libroModel->obtenerLibros();
?>
