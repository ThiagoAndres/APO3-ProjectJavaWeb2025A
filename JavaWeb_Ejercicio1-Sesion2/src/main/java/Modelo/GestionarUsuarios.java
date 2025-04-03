package Modelo;

import java.util.LinkedList;

public class GestionarUsuarios {

    private LinkedList<Usuario> listaUsuarios = new LinkedList<>();

    public LinkedList<Usuario> getListaUsuarios() {
        for (Usuario usuario : listaUsuarios) {
            //prueba de impresión de elementos en mi lista 
            System.out.println("usuario : " + usuario.getNombres());
        }
        return listaUsuarios;

    }

    public void agregarUsuario(Usuario usuario) {
        listaUsuarios.add(usuario);
        //prueba para verificar si mi registro fue guardado en la lista
        System.out.println("usuario registrado:  " + usuario.getNombres());
    }

    public void eliminarUsuario(String identificacion) {
        listaUsuarios.removeIf(usuario -> usuario.getIdentificacion().equals(identificacion));
    }

    public void editarUsuario(Usuario usuarioEditado) {
        for (Usuario usuario : listaUsuarios) {
            if (usuario.getIdentificacion().equals(usuarioEditado.getIdentificacion())) {
                usuario.setNombres(usuarioEditado.getNombres());
                usuario.setCorreo(usuarioEditado.getCorreo());
                usuario.setEdad(usuarioEditado.getEdad());
                usuario.setTelefono(usuarioEditado.getTelefono());
                usuario.setDireccion(usuarioEditado.getDireccion());
                usuario.setTipoUsuario(usuarioEditado.getTipoUsuario());
                usuario.setPassword(usuarioEditado.getPassword());
                usuario.setImagenPerfil(usuarioEditado.getImagenPerfil());
                break;
            }
        }
    }

    public Usuario buscarUsuario(String identificacion) {
        for (Usuario usuario : listaUsuarios) {
            if (usuario.getIdentificacion().equals(identificacion)) {
                return usuario;
            }
        }
        return null;
    }
}
