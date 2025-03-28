package Modelo;

import java.util.LinkedList;

public class GestionarUsuarios {

    private LinkedList<Usuario> usuarios = new LinkedList<>();

    public GestionarUsuarios() {
        usuarios = new LinkedList<>();
    }

    // Agregar un usuario
    public void agregarUsuario(Usuario usuario) {
        usuarios.add(usuario);
    }

    // Editar un usuario
    public void editarUsuario(String identificacion, Usuario usuarioEditado) {
        for (int i = 0; i < usuarios.size(); i++) {
            if (usuarios.get(i).getIdentificacion().equals(identificacion)) {
                usuarios.set(i, usuarioEditado);
                break;
            }
        }
    }

    // Eliminar un usuario
    public void eliminarUsuario(String identificacion) {
        usuarios.removeIf(usuario -> usuario.getIdentificacion().equals(identificacion));
    }

    // Obtener todos los usuarios
    public LinkedList<Usuario> obtenerUsuarios() {
        
        return usuarios;
    }

    // Buscar un usuario por identificación
    public Usuario obtenerUsuarioPorIdentificacion(String identificacion) {
        for (Usuario usuario : usuarios) {
            if (usuario.getIdentificacion().equals(identificacion)) {
                return usuario;
            }
        }
        return null;
    }
}
