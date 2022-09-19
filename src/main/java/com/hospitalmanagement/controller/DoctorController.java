package com.hospitalmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DoctorController {
	
	@RequestMapping("/test-form")
	public ModelAndView testForm()
	{
		return new ModelAndView("test-form");
	}
	
}
