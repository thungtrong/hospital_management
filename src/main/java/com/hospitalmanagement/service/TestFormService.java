package com.hospitalmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.TestForm;
import com.hospitalmanagement.repository.TestFormRepository;

@Service
public class TestFormService implements PagingAndSortingService<TestForm, Long> {

	@Autowired
	private TestFormRepository testFormRepository;

	@Override
	public TestForm insert(TestForm patient) {
		return testFormRepository.save(patient);
	}

	@Override
	public TestForm update(TestForm patient) {
		if (patient.getId() == null)
			throw new IllegalArgumentException();
		
		if (testFormRepository.existsById(patient.getId()) == false)
			throw new RecordNotFoundException("Test not found");
		
		return testFormRepository.save(patient);
	}
	
	@Override
	public List<TestForm> findAll() {
		return testFormRepository.findAll();
	}

	@Override
	public TestForm findById(Long id) {
		TestForm testForm = testFormRepository.findById(id).orElse(null);
		testForm.getDetails();
		return testForm;
	}

	@Override
	public boolean deleteById(Long id) {
		if (!testFormRepository.existsById(id))
			throw new RecordNotFoundException("Test not found");
		
		testFormRepository.deleteById(id);
		return true;
	}

	@Override
	public List<TestForm> findAll(Sort sort) {
		return testFormRepository.findAll(sort);
	}

	@Override
	public Page<TestForm> findAll(int page, int size, Sort sort) {
		return testFormRepository.findAll(PageRequest.of(page, size, sort));
	}

	@Override
	public boolean existsById(Long id) {
		return testFormRepository.existsById(id);
	}

}
