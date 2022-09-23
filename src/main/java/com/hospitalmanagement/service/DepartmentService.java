package com.hospitalmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.Department;
import com.hospitalmanagement.repository.DepartmentRepository;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService implements PagingAndSortingService<Department, Integer> {

	@Autowired
	private DepartmentRepository departmentRepository;

	@Override
	public Department insert(Department department) {
		return departmentRepository.save(department);
	}

	@Override
	public Department update(Department department) {
		if (department.getId() == null)
			throw new IllegalArgumentException();
		
		if (departmentRepository.existsById(department.getId()) == false)
			throw new RecordNotFoundException("Department not found");
		
		return departmentRepository.save(department);
	}
	
	@Override
	public List<Department> findAll() {
		return departmentRepository.findAll();
	}

	@Override
	public Department findById(Integer id) {
		return departmentRepository.findById(id).orElse(null);
	}

	@Override
	public boolean deleteById(Integer id) {
		if (!departmentRepository.existsById(id))
			throw new RecordNotFoundException("Department not found");
		
		departmentRepository.deleteById(id);

		return true;
	}

	@Override
	public List<Department> findAll(Sort sort) {
		return departmentRepository.findAll(sort);
	}

	@Override
	public Page<Department> findAll(int page, int size, Sort sort) {
		return departmentRepository.findAll(PageRequest.of(page, size, sort));
	}

	@Override
	public boolean existsById(Integer id) {
		return departmentRepository.existsById(id);
	}

	

}