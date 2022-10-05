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

import com.hospitalmanagement.model.TestForm;
import com.hospitalmanagement.model.Medicine;
import com.hospitalmanagement.model.Test;
import com.hospitalmanagement.service.MedicineService;

@Controller
@RequestMapping("/medicine")
public class MedicineController {
	@Autowired
	private MedicineService medicineService;
	
	@GetMapping(value={"/list", "/", ""})
	public ModelAndView list(
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size, 
			@RequestParam(defaultValue = "id") String orderBy, @RequestParam(defaultValue = "true") Boolean asc
//			@RequestParam(defaultValue = "") String qName, @RequestParam(defaultValue = "") String qPhoneNumber
			)
	{
		ModelAndView modelAndView = new ModelAndView("medicine/list-medicine");
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Medicine> pageTest = medicineService.findAll(page-1, size, sort);
		
		modelAndView.addObject("medicineList", pageTest.getContent());
		modelAndView.addObject("medicineListSize", pageTest.getSize());
		modelAndView.addObject("currentPage", pageTest.getNumber()+1);
		modelAndView.addObject("totalPage", pageTest.getTotalPages());
		
		return modelAndView;
	}
	
	@GetMapping({"/create"})
	public String create()
	{
		return "medicine/create-medicine";
	}
	
	@GetMapping({"/update/{id}"})
	public ModelAndView update(@PathVariable Integer id)
	{
		ModelAndView modelAndView = new ModelAndView("medicine/update-medicine");
		Medicine medicine = medicineService.findById(id);
		modelAndView.addObject("medicine", medicine);
		return modelAndView;
	}

}
