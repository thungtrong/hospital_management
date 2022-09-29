package com.hospitalmanagement.service;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.Medicine;
import com.hospitalmanagement.repository.MedicineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicineService implements PagingAndSortingService<Medicine, Integer> {
    @Autowired
    private MedicineRepository medicineRepository;
    @Override
    public Medicine insert(Medicine medicine) {
        return medicineRepository.save(medicine);
    }

    @Override
    public Medicine update(Medicine medicine) {
        if (medicine.getId() == null)
            throw new IllegalArgumentException();

        if (medicineRepository.existsById(medicine.getId()) == false)
            throw new RecordNotFoundException("Medicine not found");

        return medicineRepository.save(medicine);
    }

    @Override
    public List<Medicine> findAll() {
        return medicineRepository.findAll();
    }

    @Override
    public Medicine findById(Integer id) {
        return medicineRepository.findById(id).orElse(null);
    }

    @Override
    public boolean deleteById(Integer id) {
        if (!medicineRepository.existsById(id))
            throw new RecordNotFoundException("Medicine not found");

        medicineRepository.deleteById(id);

        return true;
    }

    @Override
    public boolean existsById(Integer id) {
        return medicineRepository.existsById(id);
    }

    @Override
    public Iterable<Medicine> findAll(Sort sort) {
        return medicineRepository.findAll(sort);
    }

    @Override
    public Page<Medicine> findAll(int page, int size, Sort sort) {
        return medicineRepository.findAll(PageRequest.of(page, size, sort));
    }
}

