package com.hospitalmanagement.restcontroller;

import java.util.List;

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
import com.hospitalmanagement.model.TestForm;
import com.hospitalmanagement.model.TestFormDetail;
import com.hospitalmanagement.service.TestFormService;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/test-form")
public class TestFormRestController {
	
	@Autowired
	private TestFormService testFormService;
	
	@GetMapping("/all")
	public ResponseEntity<List<TestForm>> list()
	{
		return new ResponseEntity<>(testFormService.findAll(), HttpStatus.OK);
	}
	
	@GetMapping("/page")
	public ResponseEntity<Page<TestForm>> page(
			@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size, 
			@RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc)
	{
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<TestForm> result = testFormService.findAll(page, size, sort);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("findById/{id}")
	public ResponseEntity<TestForm> findById(@PathVariable Long id)
	{
		return new ResponseEntity<>(testFormService.findById(id), HttpStatus.OK);
	}
	
	@PostMapping("/create")
	public ResponseEntity<TestForm> create(@RequestBody TestForm test)
	{
		List<TestFormDetail> details = test.getDetails();
		for (TestFormDetail detail: details)
		{
			detail.setTestForm(test);
		}
		return new ResponseEntity<>(testFormService.insert(test), HttpStatus.CREATED);
//		return new ResponseEntity<>(test, HttpStatus.CREATED);
	}
	
	@PutMapping("/update")
	public ResponseEntity<TestForm> update(@Valid @RequestBody TestForm test)
	{
		List<TestFormDetail> details = test.getDetails();
		for (TestFormDetail detail: details)
		{
			detail.setTestForm(test);
		}
		return new ResponseEntity<>(testFormService.update(test), HttpStatus.ACCEPTED);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Boolean> delete(@PathVariable Long id)
	{
		return new ResponseEntity<>(testFormService.deleteById(id), HttpStatus.OK);
	}
	@DeleteMapping("/deleteDetails")
	public ResponseEntity<Boolean> deleteDetails(@RequestParam List<Long> ids)
	{
//		return new ResponseEntity<>(ids, HttpStatus.OK);
		return new ResponseEntity<>(testFormService.deleteDetailsByIds(ids), HttpStatus.OK);
	}
	
}
