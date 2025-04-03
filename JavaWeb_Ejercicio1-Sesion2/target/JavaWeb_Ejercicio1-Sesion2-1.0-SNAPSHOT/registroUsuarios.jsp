<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="lib/header.jsp" %>

<div class="container">
    <h1 class="mt-4">Registro de Usuarios</h1>

    <form method="post" action="UsuariosServlet" enctype="multipart/form-data">
        <input type="hidden" name="action" value="registrar">

        <div class="form-group">
            <label for="identificacion">Identificación</label>
            <input type="text" class="form-control" name="identificacion" required>
        </div>

        <div class="form-group">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" name="nombre" required>
        </div>

        <div class="form-group">
            <label for="correo">Correo</label>
            <input type="email" class="form-control" name="correo" required>
        </div>

        <div class="form-group">
            <label for="edad">Edad</label>
            <input type="number" class="form-control" name="edad" required>
        </div>

        <div class="form-group">
            <label for="telefono">Teléfono</label>
            <input type="text" class="form-control" name="telefono" required>
        </div>

        <div class="form-group">
            <label for="direccion">Dirección</label>
            <input type="text" class="form-control" name="direccion" required>
        </div>

        <div class="form-group">
            <label for="tipoUsuario">Tipo de usuario</label>
            <input type="text" class="form-control" name="tipoUsuario" required>
        </div>

        <div class="form-group">
            <label for="password">Contraseña</label>
            <input type="password" class="form-control" name="password" required>
        </div>

        <div class="form-group">
            <label for="imagenPerfil">Imagen de Perfil</label>
            <input type="file" class="form-control" name="imagenPerfil">
        </div>

        <button type="submit" class="btn btn-primary">Registrar</button>
        <a href="adminUsuarios.jsp" class="btn btn-secondary">Ver Registros Guardados</a>
    </form>
</div>

<%@include file="lib/footer.jsp" %>
