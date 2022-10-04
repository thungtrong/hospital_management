package com.hospitalmanagement.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hospitalmanagement.exception.ModelNotVaildException;
import com.hospitalmanagement.model.Patient;
import com.hospitalmanagement.service.PatientService;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/patient")
public class PatientRestController {
	@Autowired
	private PatientService patientService;
	
	@GetMapping(value="/all", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<Patient>> list() {
		return new ResponseEntity<>(patientService.findAll(), HttpStatus.OK);
	}

	@GetMapping(value="/page")
	public ResponseEntity<Page<Patient>> page(@RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "10") Integer size, @RequestParam(defaultValue = "id") String orderBy,
			@RequestParam(defaultValue = "true") Boolean asc) {
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Patient> result = patientService.findAll(page, size, sort);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@GetMapping("findById/{id}")
	public ResponseEntity<Patient> findById(@PathVariable Long id) {
		return new ResponseEntity<>(patientService.findById(id), HttpStatus.OK);
	}
	
	@PostMapping("/create")
	public ResponseEntity<Patient> create(@Valid @RequestBody Patient patient, BindingResult bindingResult) throws ModelNotVaildException {
		if (bindingResult.hasErrors()) {
			throw ModelNotVaildException.fromBindingResult(bindingResult);
		}
		return new ResponseEntity<>(patientService.insert(patient), HttpStatus.CREATED);
	}

	@PutMapping("/update")
	public ResponseEntity<Patient> update(@Valid @RequestBody Patient patient, BindingResult bindingResult) throws ModelNotVaildException {
		if (bindingResult.hasErrors()) {
			throw ModelNotVaildException.fromBindingResult(bindingResult);
		}
		return new ResponseEntity<>(patientService.update(patient), HttpStatus.ACCEPTED);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Boolean> delete(@PathVariable Long id) {
		return new ResponseEntity<>(patientService.deleteById(id), HttpStatus.OK);
	}
	
	@GetMapping("/findByNameAndPhone")
	public ResponseEntity<List<Patient>> findByNameAndPhone(@RequestParam String name, @RequestParam String phoneNumber)
	{
		List<Patient> patients = patientService.findByNameAndPhone(name, phoneNumber);
		return new ResponseEntity<>(patients, HttpStatus.OK);
	}
	
}