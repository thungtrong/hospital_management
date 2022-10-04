package com.hospitalmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.Test;
import com.hospitalmanagement.repository.TestRepository;

@Service
public class TestService implements PagingAndSortingService<Test, Integer> {

	@Autowired
	private TestRepository testRepository;

	@Override
	public Test insert(Test patient) {
		return testRepository.save(patient);
	}

	@Override
	public Test update(Test patient) {
		if (patient.getId() == null)
			throw new IllegalArgumentException();
		
		if (testRepository.existsById(patient.getId()) == false)
			throw new RecordNotFoundException("Test not found");
		
		return testRepository.save(patient);
	}
	
	@Override
	public List<Test> findAll() {
		return testRepository.findAll();
	}

	@Override
	public Test findById(Integer id) {
		return testRepository.findById(id).orElse(null);
	}

	@Override
	public boolean deleteById(Integer id) {
		if (!testRepository.existsById(id))
			throw new RecordNotFoundException("Test not found");
		
		testRepository.deleteById(id);

		return true;
	}

	@Override
	public List<Test> findAll(Sort sort) {
		return testRepository.findAll(sort);
	}

	@Override
	public Page<Test> findAll(int page, int size, Sort sort) {
		return testRepository.findAll(PageRequest.of(page, size, sort));
	}

	@Override
	public boolean existsById(Integer id) {
		return testRepository.existsById(id);
	}
}
