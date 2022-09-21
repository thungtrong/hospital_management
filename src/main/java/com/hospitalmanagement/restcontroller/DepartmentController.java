package com.hospitalmanagement.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hospitalmanagement.model.Department;
import com.hospitalmanagement.service.DepartmentService;

@RestController
@RequestMapping(ConstValue.BASE_URL + "/department")
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;

	@GetMapping("/all")
	public ResponseEntity<List<Department>> list() {
		return new ResponseEntity<>(departmentService.findAll(), HttpStatus.OK);
	}

	@GetMapping("/page")
	public ResponseEntity<Page<Department>> page(@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "10") Integer size, @RequestParam(defaultValue = "id") String orderBy,
			@RequestParam(defaultValue = "true") Boolean asc) {
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Department> result = departmentService.findAll(page, size, sort);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping("findById/{id}")
	public ResponseEntity<Department> findById(@PathVariable Integer id) {
		return new ResponseEntity<>(departmentService.findById(id), HttpStatus.OK);
	}

	@PostMapping("/create")
	public ResponseEntity<Department> create(@RequestBody Department department) {
		return new ResponseEntity<>(departmentService.insert(department), HttpStatus.CREATED);
	}

	@PutMapping("/update")
	public ResponseEntity<Department> update(@RequestBody Department department) {
		return new ResponseEntity<>(departmentService.update(department), HttpStatus.ACCEPTED);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Boolean> delete(@PathVariable Integer id) {
		return new ResponseEntity<>(departmentService.deleteById(id), HttpStatus.OK);
	}
}