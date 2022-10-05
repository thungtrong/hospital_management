package com.hospitalmanagement.service;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.Illness;
import com.hospitalmanagement.repository.IllnessRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class IllnessService implements PagingAndSortingService<Illness, Integer> {

    @Autowired
    private IllnessRepository illnessRepository;
    @Override
    public Illness insert(Illness illness) {
        return illnessRepository.save(illness);
    }

    @Override
    public Illness update(Illness illness) {
        if (illness.getId() == null)
            throw new IllegalArgumentException();

        if (illnessRepository.existsById(illness.getId()) == false)
            throw new RecordNotFoundException("Illness not found");

        return illnessRepository.save(illness);
    }

    @Override
    public List<Illness> findAll() {
        return illnessRepository.findAll();
    }

    @Override
    public Illness findById(Integer integer) {
        return illnessRepository.findById(integer).orElse(null);
    }

    @Override
    public boolean deleteById(Integer integer) {
        if (!illnessRepository.existsById(integer))
            throw new RecordNotFoundException("Illness not found");

        illnessRepository.deleteById(integer);

        return true;
    }

    @Override
    public boolean existsById(Integer integer) {
        return illnessRepository.existsById(integer);
    }

    @Override
    public Iterable<Illness> findAll(Sort sort) {
        return illnessRepository.findAll(sort);
    }

    @Override
    public Page<Illness> findAll(int page, int size, Sort sort) {
        return illnessRepository.findAll(PageRequest.of(page, size, sort));
    }

	public List<Illness> findAllByName(String name) {
		return illnessRepository.findAllByNameContainingIgnoreCase(name);
	}
}
