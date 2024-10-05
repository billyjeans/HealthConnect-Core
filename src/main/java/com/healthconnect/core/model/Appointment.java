package com.healthconnect.core.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "appointments")
public class Appointment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @Column(name = "appointment_date") // Optional: explicit column mapping
    private LocalDateTime appointmentDate;

    @Column(name = "status") // Optional: explicit column mapping
    private String status; // e.g., SCHEDULED, CANCELLED, COMPLETED
}
