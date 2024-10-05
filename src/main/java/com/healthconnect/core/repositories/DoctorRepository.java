package com.healthconnect.core.repositories;

import com.healthconnect.core.model.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, Long> {
    // Add any custom queries if needed
}

