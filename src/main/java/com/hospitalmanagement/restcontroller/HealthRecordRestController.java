package com.hospitalmanagement.restcontroller;

import java.util.List;

import javax.naming.NoPermissionException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
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

import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.exception.ModelNotVaildException;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.model.HealthRecord;
import com.hospitalmanagement.service.HealthRecordService;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/health-record")
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
    public ResponseEntity<HealthRecord> create(@Valid @RequestBody HealthRecord healthRecord, BindingResult bindingResult) throws ModelNotVaildException {
        if (bindingResult.hasErrors())
            throw ModelNotVaildException.fromBindingResult(bindingResult);
        return new ResponseEntity<>(healthRecordService.insert(healthRecord), HttpStatus.CREATED);
    }

    @PutMapping("/update")
    public ResponseEntity<HealthRecord> update(@Valid @RequestBody HealthRecord healthRecord, 
        Authentication authentication, BindingResult bindingResult) throws NoPermissionException, ModelNotVaildException 
        {
        if (bindingResult.hasErrors())
            throw ModelNotVaildException.fromBindingResult(bindingResult);

        UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
        // Doctor can not change "who created healthRecord"
        if (userPrincipal.isDoctor())
        {
            HealthRecord heaalthRecord2 = healthRecordService.findById(healthRecord.getId());
            Doctor doctor = heaalthRecord2.getDoctor();
            if (doctor!=null && !doctor.getId().equals(healthRecord.getDoctor().getId()))
            {
                throw new NoPermissionException("You are not allowed to change who created this health record");
            }
        }

        healthRecord.getHealthRecordDetails().forEach(prescriptionDetail -> {
            prescriptionDetail.setHealthRecord(healthRecord);
        });
        return new ResponseEntity<>(healthRecordService.update(healthRecord), HttpStatus.ACCEPTED);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Boolean> delete(@PathVariable Long id) {
        return new ResponseEntity<>(healthRecordService.deleteById(id), HttpStatus.OK);
    }
}
