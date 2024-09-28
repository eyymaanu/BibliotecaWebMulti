
function mostrarLibro(libroId) {
    //ocultar los demás libros
    let libros = document.querySelectorAll(".libro");
    libros.forEach(libro => {
        libro.style.display="none";
    });

// Mostrar el libro
let libroSeleccionado = document.getElementById("libro-" + libroId);
if (libroSeleccionado){
    libroSeleccionado.style.display="block";
}
}