package com.hospitalmanagement.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/test-form")
public class TestFormController {
	@GetMapping({"/create"})
	public ModelAndView create()
	{
		ModelAndView model = new ModelAndView("test-form/create-test-form");
		model.addObject("toDay", new Date());
		return model;
	}
}
