package com.hospitalmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.model.AdmissionForm;
import com.hospitalmanagement.model.Patient;
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
		ModelAndView modelAndView = new ModelAndView("admission/list-admission");
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<AdmissionForm> pageAdmission = admissionFormService.findAll(page-1, size, sort);
		
		modelAndView.addObject("admissionList", pageAdmission.getContent());
		modelAndView.addObject("admissionListSize", pageAdmission.getSize());
		modelAndView.addObject("currentPage", pageAdmission.getNumber()+1);
		modelAndView.addObject("totalPage", pageAdmission.getTotalPages());
		
		return modelAndView;
	}
	
	@GetMapping({"/create"})
	public String create()
	{
		return "admission/create-admission";
	}
	
	@GetMapping({"/update/{id}"})
	public ModelAndView update(@PathVariable Long id)
	{
		ModelAndView modelAndView = new ModelAndView("admission/update-admission");
		AdmissionForm form = admissionFormService.findById(id);
		modelAndView.addObject("admission", form);
		return modelAndView;
	}
	
	@GetMapping("/view/{id}")
	public ModelAndView view(@PathVariable Long id)
	{
		ModelAndView modelAndView = new ModelAndView("admission/view-admission");
		AdmissionForm form = admissionFormService.findById(id);
		modelAndView.addObject("admission", form);
		return modelAndView;
	}
}
