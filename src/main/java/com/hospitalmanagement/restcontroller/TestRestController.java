package com.hospitalmanagement.restcontroller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
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
import com.hospitalmanagement.exception.RecordNotFoundException;
import com.hospitalmanagement.model.Test;
import com.hospitalmanagement.service.TestService;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/test")
public class TestRestController {
	
	@Autowired
	private TestService testService;
	
	@GetMapping("/all")
	public ResponseEntity<List<Test>> list()
	{
		return new ResponseEntity<>(testService.findAll(), HttpStatus.OK);
	}
	
	@GetMapping("/page")
	public ResponseEntity<Page<Test>> page(
			@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size, 
			@RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc)
	{
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Test> result = testService.findAll(page, size, sort);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("findById/{id}")
	public ResponseEntity<Test> findById(@PathVariable Integer id)
	{
		return new ResponseEntity<>(testService.findById(id), HttpStatus.OK);
	}
	
	@PostMapping("/create")
	public ResponseEntity<Test> create(@Valid @RequestBody Test test, BindingResult bindingResult) throws ModelNotVaildException
	{
		if (bindingResult.hasErrors())
		{
			throw ModelNotVaildException.fromBindingResult(bindingResult);
		}
		return new ResponseEntity<>(testService.insert(test), HttpStatus.CREATED);
	}
	
	@PutMapping("/update")
	public ResponseEntity<Test> update(@Valid @RequestBody Test test, BindingResult bindingResult) throws ModelNotVaildException
	{
		if (bindingResult.hasErrors())
		{
			throw ModelNotVaildException.fromBindingResult(bindingResult);
		}
		return new ResponseEntity<>(testService.update(test), HttpStatus.ACCEPTED);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Boolean> delete(@PathVariable Integer id)
	{
		return new ResponseEntity<>(testService.deleteById(id), HttpStatus.OK);
	}
	
}
