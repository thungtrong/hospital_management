package com.hospitalmanagement.restcontroller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
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
import com.hospitalmanagement.model.Illness;
import com.hospitalmanagement.model.Medicine;
import com.hospitalmanagement.service.MedicineService;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/medicine")
public class MedicineRestController {
    @Autowired
    private MedicineService medicineService;
    @GetMapping("/all")
    public ResponseEntity<List<Medicine>> list() {
        return new ResponseEntity<>(medicineService.findAll(), HttpStatus.OK);
    }
    @GetMapping("/page")
    public ResponseEntity<Page<Medicine>> page(@RequestParam(defaultValue = "0") Integer page,
                                               @RequestParam(defaultValue = "10") Integer size, @RequestParam(defaultValue = "id") String orderBy,
                                               @RequestParam(defaultValue = "true") Boolean asc) {
        Sort sort = asc ? Sort.by(Sort.Order.asc(orderBy)) : Sort.by(Sort.Order.desc(orderBy));
        Page<Medicine> result = medicineService.findAll(page, size, sort);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    @PostMapping("/create")
    public ResponseEntity<Medicine> create(@Valid @RequestBody Medicine medicine, BindingResult bindingResult) throws ModelNotVaildException {
    	if (bindingResult.hasErrors())
    		throw ModelNotVaildException.fromBindingResult(bindingResult);
        return new ResponseEntity<>(medicineService.insert(medicine), HttpStatus.CREATED);
    }
    @GetMapping("findById/{id}")
    public ResponseEntity<Medicine> findById(@PathVariable Integer id) {
        return new ResponseEntity<>(medicineService.findById(id), HttpStatus.OK);
    }
    @PutMapping("/update")
    public ResponseEntity<Medicine> update(@Valid @RequestBody Medicine medicine, BindingResult bindingResult) throws ModelNotVaildException {
    	if (bindingResult.hasErrors())
    		throw ModelNotVaildException.fromBindingResult(bindingResult);
        return new ResponseEntity<>(medicineService.update(medicine), HttpStatus.ACCEPTED);
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Boolean> delete(@PathVariable Integer id) {
        return new ResponseEntity<>(medicineService.deleteById(id), HttpStatus.OK);
    }
    
    @GetMapping("/findByName")
	public ResponseEntity<List<Medicine>> findByName(@RequestParam String name) {
		return new ResponseEntity<>(medicineService.findAllByName(name), HttpStatus.OK);
	}
}
