package com.hospitalmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.model.AdmissionForm;
import com.hospitalmanagement.service.AdmissionFormService;

@Controller
@RequestMapping("/admission")
public class AdmissionFormController {
	
	@Autowired
	private AdmissionFormService admissionFormService;
	
	@GetMapping(value={"/list", "/", ""})
	public ModelAndView list(
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, 
			@RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc
//			@RequestParam(defaultValue = "") String qName, @RequestParam(defaultValue = "") String qPhoneNumber
			)
	{
		ModelAndView modelAndView = new ModelAndView("admission-form/list-admission");
		return modelAndView;
	}
	
	@GetMapping({"/create"})
	public String create()
	{
		return "admission-form/create-admission";
	}
	
	@GetMapping({"/update/{id}"})
	public ModelAndView update(@PathVariable Long id)
	{
		ModelAndView modelAndView = new ModelAndView("admission-form/update-admission");
		AdmissionForm form = admissionFormService.findById(id);
		modelAndView.addObject("admissionForm", form);
		return modelAndView;
	}
}
