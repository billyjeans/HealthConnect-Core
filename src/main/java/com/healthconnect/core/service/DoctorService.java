package com.healthconnect.core.service;

import com.healthconnect.core.model.Doctor;
import com.healthconnect.core.repositories.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DoctorService {

    private final DoctorRepository doctorRepository;

    @Autowired
    public DoctorService(DoctorRepository doctorRepository) {
        this.doctorRepository = doctorRepository;
    }

    public Doctor createDoctor(Doctor doctor) {
        return doctorRepository.save(doctor);
    }

    public List<Doctor> getAllDoctors() {
        return doctorRepository.findAll();
    }

    public Optional<Doctor> getDoctorById(Long id) {
        return doctorRepository.findById(id);
    }

    public Doctor updateDoctor(Long id, Doctor updatedDoctor) {
        if (doctorRepository.existsById(id)) {
            updatedDoctor.setId(id);
            return doctorRepository.save(updatedDoctor);
        }
        throw new ResourceNotFoundException("Doctor not found with id " + id);
    }

    public void deleteDoctor(Long id) {
        if (doctorRepository.existsById(id)) {
            doctorRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("Doctor not found with id " + id);
        }
    }
}

