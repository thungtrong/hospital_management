package com.hospitalmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.repository.DoctorRepository;
import org.springframework.stereotype.Service;

@Service
public class DoctorService implements PagingAndSortingService<Doctor, Long> {

	@Autowired
	private DoctorRepository doctorRepository;

	@Override
	public Doctor insert(Doctor doctor) {
		return doctorRepository.save(doctor);
	}

	@Override
	public Doctor update(Doctor doctor) {
		if (doctor.getId() == null)
			throw new IllegalArgumentException();
		
		if (doctorRepository.existsById(doctor.getId()) == false)
			throw new RecordNotFoundException("Doctor not found");
		
		return doctorRepository.save(doctor);
	}
	
	@Override
	public List<Doctor> findAll() {
		return doctorRepository.findAll();
	}

	@Override
	public Doctor findById(Long id) {
		return doctorRepository.findById(id).orElse(null);
	}

	@Override
	public boolean deleteById(Long id) {
		if (!doctorRepository.existsById(id))
			throw new RecordNotFoundException("Doctor not found");
		
		doctorRepository.deleteById(id);

		return true;
	}

	@Override
	public List<Doctor> findAll(Sort sort) {
		return doctorRepository.findAll(sort);
	}

	@Override
	public Page<Doctor> findAll(int page, int size, Sort sort) {
		return doctorRepository.findAll(PageRequest.of(page, size, sort));
	}

	@Override
	public boolean existsById(Long id) {
		return doctorRepository.existsById(id);
	}

	

}