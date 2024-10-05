package com.healthconnect.core.service;

import com.healthconnect.core.model.MedicalRecord;
import com.healthconnect.core.repositories.MedicalRecordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MedicalRecordService {

    private final MedicalRecordRepository medicalRecordRepository;

    @Autowired
    public MedicalRecordService(MedicalRecordRepository medicalRecordRepository) {
        this.medicalRecordRepository = medicalRecordRepository;
    }

    public MedicalRecord createMedicalRecord(MedicalRecord medicalRecord) {
        return medicalRecordRepository.save(medicalRecord);
    }

    public List<MedicalRecord> getAllMedicalRecords() {
        return medicalRecordRepository.findAll();
    }

    public Optional<MedicalRecord> getMedicalRecordById(Long id) {
        return medicalRecordRepository.findById(id);
    }

    public MedicalRecord updateMedicalRecord(Long id, MedicalRecord updatedRecord) {
        if (medicalRecordRepository.existsById(id)) {
            updatedRecord.setId(id);
            return medicalRecordRepository.save(updatedRecord);
        }
        throw new ResourceNotFoundException("MedicalRecord not found with id " + id);
    }

    public void deleteMedicalRecord(Long id) {
        if (medicalRecordRepository.existsById(id)) {
            medicalRecordRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("MedicalRecord not found with id " + id);
        }
    }
}

