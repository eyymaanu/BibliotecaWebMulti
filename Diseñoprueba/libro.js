function mostrarLibro(libroId) {
    document.querySelector('.libros').style.display = 'none'; // Oculta la sección principal
    document.getElementById(libroId).style.display = 'block'; // Muestra el libro específico
}

// Función para volver a la vista principal
function volver() {
    document.querySelector('.libros').style.display = 'flex'; // Muestra la sección principal
    document.querySelectorAll('.libro-detalle').forEach(function(seccion) {
        seccion.style.display = 'none'; // Oculta todos los detalles de los libros
    });
}