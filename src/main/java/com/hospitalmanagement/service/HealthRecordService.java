package com.hospitalmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.HealthRecord;
import com.hospitalmanagement.repository.HealthRecordRepository;
import com.hospitalmanagement.repository.PrescriptionDetailRepository;

@Service
public class HealthRecordService implements PagingAndSortingService<HealthRecord, Long> {
    @Autowired
    private HealthRecordRepository healthRecordRepository;
    @Autowired
    private PrescriptionDetailRepository detailRepository;

    @Override
    public HealthRecord insert(HealthRecord healthRecord) {
        return healthRecordRepository.save(healthRecord);
    }

    @Override
    public HealthRecord update(HealthRecord healthRecord) {
        if (healthRecord.getId() == null)
            throw new IllegalArgumentException();
        if (healthRecordRepository.existsById(healthRecord.getId()) == false)
            throw new RecordNotFoundException("Health record not found");

        detailRepository.deleteByHealthRecordNull();
        healthRecord = healthRecordRepository.save(healthRecord);
        return healthRecord;
    }

    @Override
    public List<HealthRecord> findAll() {
        return healthRecordRepository.findAll();
    }

    @Override
    public HealthRecord findById(Long id) {
        return healthRecordRepository.findById(id).orElse(null);
    }

    @Override
    public boolean deleteById(Long id) {
        if (!healthRecordRepository.existsById(id))
            throw new RecordNotFoundException("Health record not found to delete");
        healthRecordRepository.deleteById(id);
        return true;
    }

    @Override
    public boolean existsById(Long id) {
        return healthRecordRepository.existsById(id);
    }

    @Override
    public Iterable<HealthRecord> findAll(Sort sort) {
        return healthRecordRepository.findAll(sort);
    }

    @Override
    public Page<HealthRecord> findAll(int page, int size, Sort sort) {
        return healthRecordRepository.findAll(PageRequest.of(page, size, sort));
    }
}
