/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.time.LocalDate;

/**
 *
 * @author cabre
 */
public class Mora {
    
    private int idMora;
    private int idAlumno;
    private int idPrestamo;
    private double monto;
    private LocalDate fechaRegistro;
    private String estado; // Pendiente, Pagado

    public Mora(int idMora, int idAlumno, int idPrestamo, double monto, LocalDate fechaRegistro, String estado) {
        this.idMora = idMora;
        this.idAlumno = idAlumno;
        this.idPrestamo = idPrestamo;
        this.monto = monto;
        this.fechaRegistro = fechaRegistro;
        this.estado = estado;
    }

    public int getIdMora() {
        return idMora;
    }

    public void setIdMora(int idMora) {
        this.idMora = idMora;
    }

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }

    public int getIdPrestamo() {
        return idPrestamo;
    }

    public void setIdPrestamo(int idPrestamo) {
        this.idPrestamo = idPrestamo;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public LocalDate getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(LocalDate fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
