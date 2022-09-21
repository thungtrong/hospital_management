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

import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.service.DoctorService;

@RestController
@RequestMapping(ConstValue.BASE_URL + "/doctor")
public class DoctorController {
	@Autowired
	private DoctorService doctorService;

	@GetMapping("/all")
	public ResponseEntity<List<Doctor>> list() {
		return new ResponseEntity<>(doctorService.findAll(), HttpStatus.OK);
	}

	@GetMapping("/page")
	public ResponseEntity<Page<Doctor>> page(@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "10") Integer size, @RequestParam(defaultValue = "id") String orderBy,
			@RequestParam(defaultValue = "true") Boolean asc) {
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Doctor> result = doctorService.findAll(page, size, sort);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping("findById/{id}")
	public ResponseEntity<Doctor> findById(@PathVariable Long id) {
		return new ResponseEntity<>(doctorService.findById(id), HttpStatus.OK);
	}

	@PostMapping("/create")
	public ResponseEntity<Doctor> create(@RequestBody Doctor doctor) {
		return new ResponseEntity<>(doctorService.insert(doctor), HttpStatus.CREATED);
	}

	@PutMapping("/update")
	public ResponseEntity<Doctor> update(@RequestBody Doctor doctor) {
		return new ResponseEntity<>(doctorService.update(doctor), HttpStatus.ACCEPTED);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Boolean> delete(@PathVariable Long id) {
		return new ResponseEntity<>(doctorService.deleteById(id), HttpStatus.OK);
	}
}