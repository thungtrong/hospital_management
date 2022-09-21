package com.hospitalmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.Patient;
import com.hospitalmanagement.repository.PatientRepository;

@Service
public class PatientService implements PagingAndSortingService<Patient, Long> {

	@Autowired
	private PatientRepository patientRepository;

	@Override
	public Patient insert(Patient patient) {
		return patientRepository.save(patient);
	}

	@Override
	public Patient update(Patient patient) {
		if (patient.getId() == null)
			throw new IllegalArgumentException();
		
		if (patientRepository.existsById(patient.getId()) == false)
			throw new RecordNotFoundException("Patient not found");
		
		return patientRepository.save(patient);
	}
	
	@Override
	public List<Patient> findAll() {
		return patientRepository.findAll();
	}

	@Override
	public Patient findById(Long id) {
		return patientRepository.findById(id).orElse(null);
	}

	@Override
	public boolean deleteById(Long id) {
		if (!patientRepository.existsById(id))
			throw new RecordNotFoundException("Patient not found");
		
		patientRepository.deleteById(id);

		return true;
	}

	@Override
	public List<Patient> findAll(Sort sort) {
		return patientRepository.findAll(sort);
	}

	@Override
	public Page<Patient> findAll(int page, int size, Sort sort) {
		return patientRepository.findAll(PageRequest.of(page, size, sort));
	}

	@Override
	public boolean existsById(Long id) {
		return patientRepository.existsById(id);
	}

	

}
