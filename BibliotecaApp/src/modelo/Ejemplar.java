/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author cabre
 */
public class Ejemplar {
    
    private int idEjemplar;
    private String titulo;
    private String autor;
    private String ubicacion;
    private int cantidadDisponible;
    private String tipo; // Libro, Revista, CD, Tesis, Documento

    public Ejemplar(int idEjemplar, String titulo, String autor, String ubicacion, int cantidadDisponible, String tipo) {
        this.idEjemplar = idEjemplar;
        this.titulo = titulo;
        this.autor = autor;
        this.ubicacion = ubicacion;
        this.cantidadDisponible = cantidadDisponible;
        this.tipo = tipo;
    }
    
    //Metodos Get
    public int getIdEjemplar() {
        return idEjemplar;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getAutor() {
        return autor;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public int getCantidadDisponible() {
        return cantidadDisponible;
    }

    public String getTipo() {
        return tipo;
    }
    
    //Metodos Set

    public void setIdEjemplar(int idEjemplar) {
        this.idEjemplar = idEjemplar;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public void setCantidadDisponible(int cantidadDisponible) {
        this.cantidadDisponible = cantidadDisponible;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
}
