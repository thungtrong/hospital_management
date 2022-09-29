package com.hospitalmanagement.restcontroller;

import com.hospitalmanagement.model.Medicine;
import com.hospitalmanagement.model.Prescription;
import com.hospitalmanagement.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/prescription")
public class PrescriptionRestController {
    @Autowired
    private PrescriptionService prescriptionService;
    @GetMapping("/all")
    public Object getAll(){
        return prescriptionService.findAll();
    }
    @GetMapping("/page")
    public ResponseEntity<Page<Prescription>> page(@RequestParam(defaultValue = "0") Integer page,
                                                   @RequestParam(defaultValue = "10") Integer size, @RequestParam(defaultValue = "id") String orderBy,
                                                   @RequestParam(defaultValue = "true") Boolean asc) {
        Sort sort = asc ? Sort.by(Sort.Order.asc(orderBy)) : Sort.by(Sort.Order.desc(orderBy));
        Page<Prescription> result = prescriptionService.findAll(page, size, sort);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    @GetMapping("/findById/{id}")
    public ResponseEntity<Prescription> findById(@PathVariable Long id) {
        return new ResponseEntity<>(prescriptionService.findById(id), HttpStatus.OK);
    }
    @PostMapping("/create")
    public ResponseEntity<Prescription> create(@RequestBody Prescription prescription) {
        return new ResponseEntity<>(prescriptionService.insert(prescription), HttpStatus.CREATED);
    }
    @PutMapping("/update")
    public ResponseEntity<Prescription> update(@RequestBody Prescription prescription) {
        return new ResponseEntity<>(prescriptionService.update(prescription), HttpStatus.ACCEPTED);
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Boolean> delete(@PathVariable Long id) {
        return new ResponseEntity<>(prescriptionService.deleteById(id), HttpStatus.OK);
    }
}
