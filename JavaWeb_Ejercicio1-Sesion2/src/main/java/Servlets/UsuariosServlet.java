package Servlets;

import Modelo.GestionarUsuarios;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andrés Castillo
 */
public class UsuariosServlet extends HttpServlet {

    private GestionarUsuarios gestionarUsuarios;

    @Override
    public void init() throws ServletException {
        //super.init();
        gestionarUsuarios = new GestionarUsuarios(); // Inicializamos la gestión de usuarios
    }

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //LinkedList<Usuario> usuarios = new LinkedList<>();
        LinkedList<Usuario>usuarios = gestionarUsuarios.obtenerUsuarios();
        request.setAttribute("usuarios", usuarios);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("registro".equals(action)) {
            // Capturamos los datos del formulario de registro
            String identificacion = request.getParameter("identificacion");
            String nombres = request.getParameter("nombres");
            String correo = request.getParameter("correo");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String password = request.getParameter("password");
            String imagenPerfil = request.getParameter("imagenPerfil");

            // Creamos el nuevo usuario
            Usuario nuevoUsuario = new Usuario(identificacion, nombres, correo, edad, telefono, direccion, tipoUsuario, password, imagenPerfil);
            gestionarUsuarios.agregarUsuario(nuevoUsuario);

            // Redirigimos a la página de inicio después de agregar el usuario
            response.sendRedirect("/index.jsp");

        } else if ("editar".equals(action)) {
            // Capturamos los datos para editar
            String identificacion = request.getParameter("identificacion");
            String nombres = request.getParameter("nombres");
            String correo = request.getParameter("correo");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String password = request.getParameter("password");
            String imagenPerfil = request.getParameter("imagenPerfil");

            // Creamos el usuario editado
            Usuario usuarioEditado = new Usuario(identificacion, nombres, correo, edad, telefono, direccion, tipoUsuario, password, imagenPerfil);
            gestionarUsuarios.editarUsuario(identificacion, usuarioEditado);
            // Redirigimos a la página de inicio después de editar
            response.sendRedirect("index.jsp");

        } else if ("delete".equals(action)) {
            // Eliminar un usuario por su identificacion
            String identificacion = request.getParameter("identificacion");
            gestionarUsuarios.eliminarUsuario(identificacion);

            // Redirigimos a la página de inicio después de eliminar
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
