package udb.edu.principal;

import dao.UsuarioDAO;
import modelo.Usuario;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("INICIANDO PRUEBAS DE UsuarioDAO...");

        // ✅ Instancia de UsuarioDAO
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        // 🔹 1. Insertar un nuevo usuario
        Usuario nuevoUsuario = new Usuario("JAVA", "PRUEBA", "java.prueba@example.com", "password123", "Alumno");
        if (usuarioDAO.insertarUsuario(nuevoUsuario)) {
            System.out.println("Usuario insertado correctamente.");
        } else {
            System.out.println("Error al insertar usuario.");
        }

        // 🔹 2. Obtener usuario por ID (cambia el ID por uno existente en la BD)
        int idUsuarioBuscar = 1; // Ajusta según tu base de datos
        Usuario usuarioPorId = usuarioDAO.obtenerUsuarioPorId(idUsuarioBuscar);
        System.out.println(usuarioPorId != null ? "Usuario encontrado: " + usuarioPorId : "No se encontró el usuario por ID.");

        // 🔹 3. Obtener usuario por correo
        String correoBuscar = "java.prueba@example.com";
        Usuario usuarioPorCorreo = usuarioDAO.obtenerUsuarioPorCorreo(correoBuscar);
        System.out.println(usuarioPorCorreo != null ? "Usuario encontrado por correo: " + usuarioPorCorreo : "No se encontró el usuario por correo.");

        // 🔹 4. Actualizar datos del usuario
        if (usuarioPorCorreo != null) {
            usuarioPorCorreo.setNombre("JAVA DAO");
            usuarioPorCorreo.setContraseña("nuevaClave123");
            if (usuarioDAO.actualizarUsuario(usuarioPorCorreo)) {
                System.out.println("Usuario actualizado correctamente.");
            } else {
                System.out.println("Error al actualizar usuario.");
            }
        }

        // 🔹 5. Eliminar usuario (cambia el ID según tu BD)
        int idEliminar = 4; // Ajusta según la base de datos
        if (usuarioDAO.eliminarUsuario(idEliminar)) {
            System.out.println("Usuario eliminado correctamente.");
        } else {
            System.out.println("No se pudo eliminar el usuario.");
        }

        // 🔹 6. Listar todos los usuarios registrados
        List<Usuario> usuarios = usuarioDAO.listarUsuarios();
        System.out.println("Lista de usuarios en la base de datos:");
        for (Usuario u : usuarios) {
            System.out.println(u);
        }

        System.out.println("Fin de pruebas.");
    }
}