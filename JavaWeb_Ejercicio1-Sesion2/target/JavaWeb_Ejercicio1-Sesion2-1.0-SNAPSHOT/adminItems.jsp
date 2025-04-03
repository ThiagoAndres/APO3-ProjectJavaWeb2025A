<%@include file="lib/header.jsp" %>
<%-- 
    EMPEZAR CÓDIGO PARA FORMULARIO DE GESTIÓN DE ITEMS AQUÍ -> CRUD
--%>
<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<div>
    <img src="images/banner.jpg" alt="banner principal">
</div>
<div class="container">
    <h1 class="mt-4">Gestión de Usuarios</h1>

    <!-- Formulario para añadir usuarios -->
    <form method="post" action="UsuariosServlet" enctype="multipart/form-data">
        <%--<input type="hidden" name="action" value="registro" name="registro">--%>
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="identificacion">Identificación</label>
                <input type="text" class="form-control" name="identificacion" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre" required>
            </div>

            <div class="col-md-6 mb-3">
                <label for="correo">Correo</label>
                <input type="email" class="form-control" name="correo" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="edad">Edad</label>
                <input type="number" class="form-control" name="edad" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="telefono">Telefono</label>
                <input type="text" class="form-control" name="telefono" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="direccion">Dirección</label>
                <input type="text" class="form-control" name="direccion" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="tipoUsuario">Tipo de usuario</label>
                <input type="text" class="form-control" name="tipoUsuario" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="imagenPerfil">Imagen de Perfil</label>
                <input type="file" class="form-control" name="imagenPerfil">
            </div>
            <div>
                <button class="btn btn-primary" type="submit" name="action" value="registrar">Añadir Usuario</button>
            </div>
        </div>
        
    </form>

    <hr />

    <!-- Tabla de usuarios -->
    <h2>Lista de Usuarios</h2>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Identificacion</th>
                <th>Nombre</th>                
                <th>Correo</th>
                <th>Edad</th>
                <th>Teléfono</th>
                <th>Dirección</th>
                <th>TipoUsuario</th>
                <th>Password</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                LinkedList<Usuario> usuarios = (LinkedList<Usuario>) request.getAttribute("usuarios");
                if (usuarios != null) {
                for (Usuario usuario : usuarios) {
            %>
            <tr>
                <td><%= usuario.getIdentificacion()%></td>
                <td><%= usuario.getNombres()%></td>
                <td><%= usuario.getCorreo()%></td>
                <td><%= usuario.getEdad()%></td>
                <td><%= usuario.getTelefono()%></td>
                <td><%= usuario.getDireccion()%></td>
                <td><%= usuario.getTipoUsuario()%></td>

                <td>
                    <!-- Botón para abrir el modal de edición -->
                    <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modalEdit<%= usuario.getIdentificacion()%>">Editar</button>
                    <a href="UsuariosServlet?action=delete&id=<%= usuario.getIdentificacion()%>" class="btn btn-danger btn-sm">Eliminar</a>
                </td>
            </tr>

            <!-- Modal para editar usuario -->
        <div class="modal fade" id="modalEdit<%= usuario.getIdentificacion()%>" tabindex="-1" aria-labelledby="modalLabel<%= usuario.getIdentificacion()%>" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel<%= usuario.getIdentificacion()%>">Editar Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="post" action="UsuariosServlet" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" name="identificacion" value="<%= usuario.getIdentificacion()%>">
                            <input type="hidden" name="editar" value="true">
                            <div class="mb-3">
                                <label for="nombre<%= usuario.getIdentificacion()%>" class="form-label">Nombre</label>
                                <input type="text" class="form-control" name="nombre" value="<%= usuario.getNombres()%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="edad<%= usuario.getIdentificacion()%>" class="form-label">Edad</label>
                                <input type="number" class="form-control" name="edad" value="<%= usuario.getEdad()%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="correo<%= usuario.getIdentificacion()%>" class="form-label">Correo</label>
                                <input type="email" class="form-control" name="correo" value="<%= usuario.getCorreo()%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="imagenPerfil<%= usuario.getIdentificacion()%>" class="form-label">Imagen de Perfil</label>
                                <input type="file" class="form-control" name="imagenPerfil">
                                <img src="<%= usuario.getImagenPerfil()%>" alt="Perfil" width="100" class="mt-2">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%

            }%>
            <%
        
    } else {
%>
        <tr><td colspan="8">No hay usuarios registrdos</td></tr>
<%
    }
%>
        </tbody>
    </table>
</div>
<a href="login.jsp" > Login</a>

<%@include file="lib/footer.jsp" %>