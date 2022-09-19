package com.hospitalmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {
	
	@RequestMapping(value={"index","login", "/"})
	public ModelAndView index()
	{
		return new ModelAndView("index");
	}
	
	@RequestMapping(value= {"signup"})
	public ModelAndView signup()
	{
		return new ModelAndView("signup");
	}
}
