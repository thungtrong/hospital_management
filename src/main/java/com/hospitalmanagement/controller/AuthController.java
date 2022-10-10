package com.hospitalmanagement.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {

	@GetMapping(value = { "/login" })
	public ModelAndView loginPage(HttpServletRequest request, Authentication authentication) {
		ModelAndView model = new ModelAndView();

		if (authentication != null && authentication.isAuthenticated()) {
			model.setViewName("redirect:/");
			return model;
		}

		model.setViewName("login");
		String error = request.getParameter("error");
		if (error != null)
			model.addObject("error", true);

		return model;
	}


	
}
