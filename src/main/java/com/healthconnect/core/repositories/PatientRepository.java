package com.healthconnect.core.repositories;

import com.healthconnect.core.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {
    // Add any custom queries if needed
}

