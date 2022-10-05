package com.hospitalmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.model.Department;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.service.DepartmentService;
import com.hospitalmanagement.service.DoctorService;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	
	@Autowired
	private DoctorService doctorService;
	@Autowired
	private DepartmentService departmentService;
	
	@GetMapping({"/list", "/", ""})
	public ModelAndView list(
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, 
			@RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc
//			@RequestParam(defaultValue = "") String qName, @RequestParam(defaultValue = "") String qPhoneNumber
			)
	{
		ModelAndView modelAndView = new ModelAndView("doctor/list-doctor");
		
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Doctor> pageDoctor = doctorService.findAll(page-1, size, sort);
		
		modelAndView.addObject("doctorList", pageDoctor.getContent());
		modelAndView.addObject("doctorListSize", pageDoctor.getSize());
		modelAndView.addObject("currentPage", pageDoctor.getNumber()+1);
		modelAndView.addObject("totalPage", pageDoctor.getTotalPages());
		


		return modelAndView;
	}
	
	@GetMapping({"/create"})
	public ModelAndView create()
	{
		ModelAndView modelAndView = new ModelAndView("doctor/create-doctor");
		
		List<Department> departments = departmentService.findAll();
		modelAndView.addObject("departmentList", departments);
		
		return modelAndView;
	}
	
	@GetMapping({"/update/{id}"})
	public ModelAndView update(@PathVariable Long id)
	{
		ModelAndView modelAndView = new ModelAndView("doctor/update-doctor");
		Doctor doctor = doctorService.findById(id);
		modelAndView.addObject("doctor", doctor);
		return modelAndView;
	}
	
	
}
