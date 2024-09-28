<?php
include_once "../modelos/mainModel.php";

class clienteVistaModelo extends mainModel {
    public static function mostrarlibros_model() {
        $sql = mainModel::conectar()->prepare("SELECT * FROM libros WHERE lib_categoria ='Novela' ");
        $sql->execute();
        return $sql;
    }
}
$resultado = clienteVistaModelo::mostrarlibros_model();
if ($resultado->rowCount() > 0) {

    foreach ($resultado as $fila) {
        
        echo "Código: " . $fila['lib_codigo'] . "<br>";
        echo "Título: " . $fila['lib_titulo'] . "<br>";
        // Mostrar la imagen BLOB directamente
        echo '<img src="data:image/jpeg;base64,' . base64_encode($fila['lib_img']) . '" alt="Imagen de ' . $fila['lib_titulo'] . '" style="width: 100px; height: auto;"><br>';

        echo "Autor Código: " . $fila['lib_autor_codigo'] . "<br>";
        echo "Categoría: " . $fila['lib_categoria'] . "<br>";
        echo "Cantidad Real: " . $fila['lib_cantidad_real'] . "<br>";
        echo "Stock Actual: " . $fila['stock_actual'] . "<br>";
        echo "<hr>";
    }
} else {
    echo "No se encontraron libros en la categoría 'Novela'.";
}
?>

<script src="Diseñoprueba/libro.js"></script>