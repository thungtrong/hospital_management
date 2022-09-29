package com.hospitalmanagement.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hospitalmanagement.model.Account;
import com.hospitalmanagement.service.AccountService;

@RestController
@RequestMapping("/account")
public class AccountRestController {
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@PutMapping("/")
	public Account insertOrUpdate(@RequestBody Account account)
	{
		account.setPassword(encoder.encode(account.getPassword()));
		accountService.saveAccount(account);
		return account;
	}
	
	
}
