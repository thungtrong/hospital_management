package com.hospitalmanagement.service;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.Prescription;
import com.hospitalmanagement.repository.PrescriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrescriptionService implements PagingAndSortingService<Prescription, Long> {
    @Autowired
    private PrescriptionRepository prescriptionRepository;

    @Override
    public Prescription insert(Prescription prescription) {
        return prescriptionRepository.save(prescription);
    }

    @Override
    public Prescription update(Prescription prescription) {
        if (prescription.getId() == null)
            throw new IllegalArgumentException();

        if (prescriptionRepository.existsById(prescription.getId()) == false)
            throw new RecordNotFoundException("Prescription not found");

        return prescriptionRepository.save(prescription);
    }

    @Override
    public List<Prescription> findAll() {
        return prescriptionRepository.findAll();
    }

    @Override
    public Prescription findById(Long id) {
        return prescriptionRepository.findById(id).orElse(null);
    }

    @Override
    public boolean deleteById(Long id) {
        if (!prescriptionRepository.existsById(id))
            throw new RecordNotFoundException("Prescription not found");

        prescriptionRepository.deleteById(id);

        return true;
    }

    @Override
    public boolean existsById(Long id) {
        return prescriptionRepository.existsById(id);
    }

    @Override
    public Iterable<Prescription> findAll(Sort sort) {
        return prescriptionRepository.findAll(sort);
    }

    @Override
    public Page<Prescription> findAll(int page, int size, Sort sort) {
        return prescriptionRepository.findAll(PageRequest.of(page, size, sort));
    }
}
