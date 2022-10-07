package com.hospitalmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.model.TestForm;
import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.model.Test;
import com.hospitalmanagement.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	private TestService testService;
	
	@GetMapping(value={"/list", "/", ""})
	public ModelAndView list(
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, 
			@RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc
//			@RequestParam(defaultValue = "") String qName, @RequestParam(defaultValue = "") String qPhoneNumber
			,Authentication authentication
			)
	{
		ModelAndView modelAndView = new ModelAndView("test/list-test");
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Test> pageTest = testService.findAll(page-1, size, sort);
		
		modelAndView.addObject("testList", pageTest.getContent());
		modelAndView.addObject("testListSize", pageTest.getSize());
		modelAndView.addObject("currentPage", pageTest.getNumber()+1);
		modelAndView.addObject("totalPage", pageTest.getTotalPages());
		
		UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
        modelAndView.addAllObjects(userPrincipal.getRolesMap());
		
		return modelAndView;
	}
	
	@GetMapping({"/create"})
	public String create()
	{
		return "test/create-test";
	}
	
	@GetMapping({"/update/{id}"})
	public ModelAndView update(@PathVariable Integer id)
	{
		ModelAndView modelAndView = new ModelAndView("test/update-test");
		Test test = testService.findById(id);
		modelAndView.addObject("test", test);
		return modelAndView;
	}

}
