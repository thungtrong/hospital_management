package com.hospitalmanagement.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.model.Account;

@Controller
public class AuthController {

	@RequestMapping(value = { "/index", "/" })
	public String index(HttpServletResponse response, Authentication authentication) {
		System.out.println(authentication.getAuthorities());
		return "index";
	}

	@GetMapping(value = { "/login" })
	public ModelAndView loginPage(HttpServletRequest request) {
		System.out.println("login page");
		String error = request.getParameter("error");
		ModelAndView model = new ModelAndView("login");
		if (error != null)
			model.addObject("error", true);
		return model;
	}

	@RequestMapping(value = { "signup" })
	public ModelAndView signup() {
		return new ModelAndView("signup");
	}

}
