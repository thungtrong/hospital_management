package com.hospitalmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hospitalmanagement.model.Account;
import com.hospitalmanagement.service.AccountService;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private AccountService accountService;

	@RequestMapping({ "/list", "", "/" })
	public ModelAndView list(
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer size,
			@RequestParam(defaultValue = "username") String orderBy, @RequestParam(defaultValue = "true") Boolean asc,
			Authentication authentication) {
		ModelAndView model = new ModelAndView("account/list-account");
		Sort sort = asc ? Sort.by(Order.asc(orderBy)) : Sort.by(Order.desc(orderBy));
		Page<Account> pageAccount = accountService.findAll(page - 1, size, sort);

		model.addObject("accountList", pageAccount.getContent());
		model.addObject("accountListSize", pageAccount.getSize());
		model.addObject("currentPage", pageAccount.getNumber() + 1);
		model.addObject("totalPage", pageAccount.getTotalPages());
		model.addObject("currentAccount", authentication.getName());
		return model;
	}

	@GetMapping(value = "/create")
	public ModelAndView create() {
		ModelAndView model = new ModelAndView("account/create-account");

		return model;
	}

}
