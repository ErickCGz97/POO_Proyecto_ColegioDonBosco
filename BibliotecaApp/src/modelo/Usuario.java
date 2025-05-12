package modelo;

public class Usuario {
    private Integer idUsuario;  // Se usa Integer para permitir valores NULL (AUTO_INCREMENT en BD)
    private String nombre;
    private String apellido;
    private String correo;
    private String contraseña;
    private String tipoUsuario; // "Administrador", "Profesor", "Alumno"

    // ✅ Constructor sin ID (Para nuevos registros)
    public Usuario(String nombre, String apellido, String correo, String contraseña, String tipoUsuario) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.contraseña = contraseña;
        this.tipoUsuario = tipoUsuario;
    }

    // ✅ Constructor con ID (Para usuarios ya registrados)
    public Usuario(Integer idUsuario, String nombre, String apellido, String correo, String contraseña, String tipoUsuario) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.contraseña = contraseña;
        this.tipoUsuario = tipoUsuario;
    }

    // 🔍 Métodos Getter y Setter
    public Integer getIdUsuario() { return idUsuario; }
    public void setIdUsuario(Integer idUsuario) { this.idUsuario = idUsuario; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getContraseña() { return contraseña; }
    public void setContraseña(String contraseña) { this.contraseña = contraseña; }

    public String getTipoUsuario() { return tipoUsuario; }
    public void setTipoUsuario(String tipoUsuario) { this.tipoUsuario = tipoUsuario; }

    // 🔍 Método toString() para visualizar datos de usuario fácilmente
    @Override
    public String toString() {
        return "Usuario{" +
                "idUsuario=" + idUsuario +
                ", nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", correo='" + correo + '\'' +
                ", tipoUsuario='" + tipoUsuario + '\'' +
                '}';
    }
}