package com.hospitalmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.AdmissionForm;
import com.hospitalmanagement.repository.AdmissionFormRepository;

@Service
public class AdmissionFormService implements PagingAndSortingService<AdmissionForm, Long> {

	@Autowired
	private AdmissionFormRepository admissionFormRepository;

	@Override
	public AdmissionForm insert(AdmissionForm admissionForm) {
		return admissionFormRepository.save(admissionForm);
	}

	@Override
	public AdmissionForm update(AdmissionForm admissionForm) {
		if (admissionForm.getId() == null)
			throw new IllegalArgumentException();
		
		if (admissionFormRepository.existsById(admissionForm.getId()) == false)
			throw new RecordNotFoundException("Admission form not found");
		
		return admissionFormRepository.save(admissionForm);
	}
	
	@Override
	public List<AdmissionForm> findAll() {
		return admissionFormRepository.findAll();
	}

	@Override
	public AdmissionForm findById(Long id) {
		return admissionFormRepository.findById(id).orElse(null);
	}

	@Override
	public boolean deleteById(Long id) {
		if (!admissionFormRepository.existsById(id))
			throw new RecordNotFoundException();
		
		admissionFormRepository.deleteById(id);

		return true;
	}

	@Override
	public List<AdmissionForm> findAll(Sort sort) {
		return admissionFormRepository.findAll(sort);
	}

	@Override
	public Page<AdmissionForm> findAll(int page, int size, Sort sort) {
		return admissionFormRepository.findAll(PageRequest.of(page, size, sort));
	}

	@Override
	public boolean existsById(Long id) {
		return admissionFormRepository.existsById(id);
	}

	

}
