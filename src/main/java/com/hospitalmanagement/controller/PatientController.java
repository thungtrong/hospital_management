package com.hospitalmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.model.Patient;
import com.hospitalmanagement.service.PatientService;

@Controller
@RequestMapping("/patient")
public class PatientController {
	
	@Autowired
	private PatientService patientService;
	
	@GetMapping({"/list", "/", ""})
	public ModelAndView list(
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, 
			@RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc
//			@RequestParam(defaultValue = "") String qName, @RequestParam(defaultValue = "") String qPhoneNumber
			,Authentication authentication
			)
	{
		ModelAndView modelAndView = new ModelAndView("patient/list-patient");
		
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Patient> pagePatient = patientService.findAll(page-1, size, sort);
		
		modelAndView.addObject("patientList", pagePatient.getContent());
		modelAndView.addObject("patientListSize", pagePatient.getSize());
		modelAndView.addObject("currentPage", pagePatient.getNumber()+1);
		modelAndView.addObject("totalPage", pagePatient.getTotalPages());
		
		UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
        modelAndView.addAllObjects(userPrincipal.getRolesMap());
		
		return modelAndView;
	}
	
	@GetMapping({"/create"})
	public String create()
	{
		return "patient/create-patient";
	}
	
	@GetMapping({"/update/{id}"})
	public ModelAndView update(@PathVariable Long id)
	{
		ModelAndView modelAndView = new ModelAndView("patient/update-patient");
		Patient patient = patientService.findById(id);
		modelAndView.addObject("patient", patient);
		return modelAndView;
	}
	
	
}
