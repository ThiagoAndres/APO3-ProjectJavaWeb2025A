package Servlets;

import Modelo.GestionarUsuarios;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class UsuariosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private GestionarUsuarios gestionarUsuarios = new GestionarUsuarios();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        

        System.out.println("**** Ingreso a post *****");
        String action = request.getParameter("action");
        System.out.println("**** acción ----: " + action);

        if ("registrar".equals(action)) {
            registrarUsuario(request, response);
        } else if ("edit".equals(request.getParameter("editar"))) {
            editarUsuario(request, response);
        } else if ("delete".equals(action)) {
            eliminarUsuario(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String identificacion = request.getParameter("identificacion");
        String nombres = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String tipoUsuario = request.getParameter("tipoUsuario");
        String password = request.getParameter("password");

        Part imagenPart = request.getPart("imagenPerfil");
        String imagenPerfil = "images/default.png"; // Ruta por defecto
        if (imagenPart != null && imagenPart.getSize() > 0) {
            imagenPerfil = "images/" + imagenPart.getSubmittedFileName();
            //guardar img
        }

        Usuario nuevoUsuario = new Usuario(identificacion, nombres, correo, edad, telefono, direccion, tipoUsuario, password, imagenPerfil);
        gestionarUsuarios.agregarUsuario(nuevoUsuario);

        LinkedList<Usuario> usuarios = gestionarUsuarios.getListaUsuarios();

        // prueba en consola: imprimiendo el tamaño de lista de usuarios
        System.out.println("Usuarios enviados al JSP: " + usuarios.size());

        request.setAttribute("usuarios", usuarios);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminUsuarios.jsp");
        dispatcher.forward(request, response);
        
        //request.setAttribute("usuarios", gestionarUsuarios.getListaUsuarios());
        //request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String identificacion = request.getParameter("identificacion");
        String nombres = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String tipoUsuario = request.getParameter("tipoUsuario");
        String password = request.getParameter("password");

        Part imagenPart = request.getPart("imagenPerfil");
        String imagenPerfil = "images/default.png";
        if (imagenPart != null && imagenPart.getSize() > 0) {
            imagenPerfil = "images/" + imagenPart.getSubmittedFileName();
        }

        Usuario usuarioEditado = new Usuario(identificacion, nombres, correo, edad, telefono, direccion, tipoUsuario, password, imagenPerfil);
        gestionarUsuarios.editarUsuario(usuarioEditado);
       
        request.setAttribute("usuarios", gestionarUsuarios.getListaUsuarios());
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminUsuarios.jsp");
        dispatcher.forward(request, response);
        //request.setAttribute("usuarios", gestionarUsuarios.getListaUsuarios());
        //request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String identificacion = request.getParameter("id");
        gestionarUsuarios.eliminarUsuario(identificacion);

        request.setAttribute("usuarios", gestionarUsuarios.getListaUsuarios());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
