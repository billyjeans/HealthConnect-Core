package com.healthconnect.core.model;


import lombok.Data;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "doctors")
public class Doctor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String specialty;

    @OneToMany(mappedBy = "doctor")
    private List<Appointment> appointments;
}

