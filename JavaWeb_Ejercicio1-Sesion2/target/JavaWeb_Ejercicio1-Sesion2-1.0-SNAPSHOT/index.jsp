<%@include file="lib/header.jsp" %>
<div>
    <img src="images/banner.jpg" alt="banner principal">
</div>
<div class="container">
    <form>
        <div class="form-group">
            <label >Identificación</label>
            <input type="text" class="form-control" name="dni" placeholder="Identificación">
        </div>
        <div class="form-group">
            <label >Nombres</label>
            <input type="text" class="form-control" name="nombre" placeholder="Nombre completo">
        </div>
        <div class="form-group">
            <label>Correo</label>
            <input type="email" class="form-control" name="correo" aria-describedby="emailHelp" placeholder="Enter email">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <label >Edad</label>
            <input type="text" class="form-control" name="edad" placeholder="Digite su edad">
        </div>
        <div class="form-group">
            <label >Teléfono</label>
            <input type="text" class="form-control" name="telefono" placeholder="Digite su teléfono">
        </div><br>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
    <br><h3>Ver mensaje</h3>

    <div class="alert alert-primary" role="alert">
        <%
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String edad = request.getParameter("edad");
            String telefono = request.getParameter("telefono");

            String saludar = "Hola " + nombre + " tu edad es: " + edad;
            out.print(saludar);
        %>
    </div>
</div>
<a href="login.jsp" > Login</a>


<%@include file="lib/footer.jsp" %>