package com.hospitalmanagement.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import com.hospitalmanagement.model.HealthRecord;
import com.hospitalmanagement.model.TestForm;
import com.hospitalmanagement.response.TestFormResponse;
import com.hospitalmanagement.service.HealthRecordService;

@Controller
@RequestMapping("/health-record")
public class HealthRecordController {
	@Autowired
	private HealthRecordService healthRecordService;
	
	@GetMapping(value={"/list", "/", ""})
	public ModelAndView list(
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, 
			@RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc
//			@RequestParam(defaultValue = "") String qName, @RequestParam(defaultValue = "") String qPhoneNumber
			)
	{
		ModelAndView modelAndView = new ModelAndView("health-record/list-health-record");
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<HealthRecord> pageTestForm = healthRecordService.findAll(page-1, size, sort);
		
		
		modelAndView.addObject("healthRecordList", pageTestForm.getContent());
		modelAndView.addObject("healthRecordListSize", pageTestForm.getSize());
		modelAndView.addObject("currentPage", pageTestForm.getNumber()+1);
		modelAndView.addObject("totalPage", pageTestForm.getTotalPages());
		
		return modelAndView;
	}
	
	@GetMapping({"/create"})
	public ModelAndView create()
	{
		ModelAndView model = new ModelAndView("health-record/create-health-record");
		model.addObject("toDay", new Date());
		return model;
	}
	
	@GetMapping({"/update/{id}"})
	public ModelAndView update(@PathVariable Long id)
	{
		ModelAndView modelAndView = new ModelAndView("health-record/update-health-record");
		HealthRecord healthRecord = healthRecordService.findById(id);
		modelAndView.addObject("healthRecord", healthRecord);
		return modelAndView;
	}
	
	@GetMapping("/view/{id}")
	public ModelAndView view(@PathVariable Long id)
	{
		ModelAndView modelAndView = new ModelAndView("health-record/view-health-record");
		HealthRecord healthRecord = healthRecordService.findById(id);
		modelAndView.addObject("healthRecord", healthRecord);
		return modelAndView;
	}
}
