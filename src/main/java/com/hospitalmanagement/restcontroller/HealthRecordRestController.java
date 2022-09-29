package com.hospitalmanagement.restcontroller;

import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.model.HealthRecord;
import com.hospitalmanagement.service.HealthRecordService;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/healthcare")
public class HealthRecordRestController {
    @Autowired
    private HealthRecordService healthRecordService;
    @GetMapping("/all")
    public ResponseEntity<List<HealthRecord>> list() {
        return new ResponseEntity<>(healthRecordService.findAll(), HttpStatus.OK);
    }
    @GetMapping("/page")
    public ResponseEntity<Page<HealthRecord>> page(@RequestParam(defaultValue = "0") Integer page,
                                             @RequestParam(defaultValue = "10") Integer size, @RequestParam(defaultValue = "id") String orderBy,
                                             @RequestParam(defaultValue = "true") Boolean asc) {
        Sort sort = asc ? Sort.by(Sort.Order.asc(orderBy)) : Sort.by(Sort.Order.desc(orderBy));
        Page<HealthRecord> result = healthRecordService.findAll(page, size, sort);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    @GetMapping("findById/{id}")
    public ResponseEntity<HealthRecord> findById(@PathVariable Long id) {
        return new ResponseEntity<>(healthRecordService.findById(id), HttpStatus.OK);
    }
    @PostMapping("/create")
    public ResponseEntity<HealthRecord> create(@RequestBody HealthRecord healthRecord) {
        return new ResponseEntity<>(healthRecordService.insert(healthRecord), HttpStatus.CREATED);
    }
    @PutMapping("/update")
    public ResponseEntity<HealthRecord> update(@RequestBody HealthRecord healthRecord) {
        return new ResponseEntity<>(healthRecordService.update(healthRecord), HttpStatus.ACCEPTED);
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Boolean> delete(@PathVariable Long id) {
        return new ResponseEntity<>(healthRecordService.deleteById(id), HttpStatus.OK);
    }
}
