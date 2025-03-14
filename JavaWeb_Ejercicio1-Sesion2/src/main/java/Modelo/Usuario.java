package Modelo;
/**
 *
 * @author UMARIANA
 */
public class Usuario extends Persona{
   String direccion;
   String nombreUsuario;
   String password;

    public Usuario(String direccion, String nombreUsuario, String password, String identificacion, String nombres, String apellidos, String correo, int edad, String telefono) {
        super(identificacion, nombres, apellidos, correo, edad, telefono);
        this.direccion = direccion;
        this.nombreUsuario = nombreUsuario;
        this.password = password;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }  
   
}
