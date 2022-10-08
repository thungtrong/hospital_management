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
import com.hospitalmanagement.service.IllnessService;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/illness")
public class IllnessRestController {
    @Autowired
    private IllnessService illnessService;

    @GetMapping("/all")
    public ResponseEntity<List<Illness>> list() {
        return new ResponseEntity<>(illnessService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/page")
    public ResponseEntity<Page<Illness>> page(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "10") Integer size, @RequestParam(defaultValue = "id") String orderBy,
            @RequestParam(defaultValue = "true") Boolean asc) {
        Sort sort = asc ? Sort.by(Sort.Order.asc(orderBy)) : Sort.by(Sort.Order.desc(orderBy));
        Page<Illness> result = illnessService.findAll(page, size, sort);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("findById/{id}")
    public ResponseEntity<Illness> findById(@PathVariable Integer id) {
        return new ResponseEntity<>(illnessService.findById(id), HttpStatus.OK);
    }

    @PostMapping("/create")
    public ResponseEntity<Illness> create(@Valid @RequestBody Illness illness, BindingResult bindingResult)
            throws ModelNotVaildException {
        if (bindingResult.hasErrors())
            throw ModelNotVaildException.fromBindingResult(bindingResult);
        return new ResponseEntity<>(illnessService.insert(illness), HttpStatus.CREATED);
    }

    @PutMapping("/update")
    public ResponseEntity<Illness> update(@Valid @RequestBody Illness illness, BindingResult bindingResult)
            throws ModelNotVaildException {
        if (bindingResult.hasErrors())
            throw ModelNotVaildException.fromBindingResult(bindingResult);
        return new ResponseEntity<>(illnessService.update(illness), HttpStatus.ACCEPTED);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Boolean> delete(@PathVariable Integer id) {
        return new ResponseEntity<>(illnessService.deleteById(id), HttpStatus.OK);
    }

    @GetMapping("/findByName")
    public ResponseEntity<List<Illness>> findByName(@RequestParam String name) {
        return new ResponseEntity<>(illnessService.findAllByName(name), HttpStatus.OK);
    }
}
