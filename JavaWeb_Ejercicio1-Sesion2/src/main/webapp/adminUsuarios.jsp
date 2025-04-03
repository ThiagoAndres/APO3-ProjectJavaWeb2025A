<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.GestionarUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="lib/header.jsp" %>

<div class="container mt-4">
    <h1 class="mb-4">Administrar Usuarios</h1>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Identificación</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Edad</th>
                <th>Teléfono</th>
                <th>Dirección</th>
                <th>Tipo de Usuario</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                LinkedList<Usuario> usuarios = (LinkedList<Usuario>) request.getAttribute("usuarios");
                if (usuarios == null) {
                    usuarios = new LinkedList<>();
                }

                for (Usuario usuario : usuarios) {%>
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
                    <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#modalEdit<%= usuario.getIdentificacion()%>">
                        Editar
                    </button>

                    <!-- Formulario para eliminar un registro de Usuario -->
                    <form action="UsuariosServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= usuario.getIdentificacion()%>">
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                    </form>
                </td>
            </tr>

            <!-- Modal para Editar un registro de Usuario -->
        <div class="modal fade" id="modalEdit<%= usuario.getIdentificacion()%>" tabindex="-1" aria-labelledby="modalEditLabel<%= usuario.getIdentificacion()%>" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form method="post" action="UsuariosServlet" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="identificacion" value="<%= usuario.getIdentificacion()%>">

                            <div class="mb-3">
                                <label>Nombre</label>
                                <input type="text" class="form-control" name="nombre" value="<%= usuario.getNombres()%>" required>
                            </div>

                            <div class="mb-3">
                                <label>Correo</label>
                                <input type="email" class="form-control" name="correo" value="<%= usuario.getCorreo()%>" required>
                            </div>

                            <div class="mb-3">
                                <label>Edad</label>
                                <input type="number" class="form-control" name="edad" value="<%= usuario.getEdad()%>" required>
                            </div>

                            <div class="mb-3">
                                <label>Imagen de Perfil</label>
                                <input type="file" class="form-control" name="imagenPerfil">
                                <% if (usuario.getImagenPerfil() != null && !usuario.getImagenPerfil().isEmpty()) {%>
                                <img src="<%= usuario.getImagenPerfil()%>" width="100" class="mt-2">
                                <% } %>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <% }%>
        </tbody>
    </table>
</div>

<%@ include file="lib/footer.jsp" %>
