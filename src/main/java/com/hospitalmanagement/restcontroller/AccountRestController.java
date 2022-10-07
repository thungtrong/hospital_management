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
@RequestMapping(ConstValue.BASE_API_URL + "/account")
public class AccountRestController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private BCryptPasswordEncoder encoder;

	@PutMapping({"/", ""})
	public Account insertOrUpdate(@RequestBody Account account)
	{
		account.setPassword(encoder.encode(account.getPassword()));
		accountService.saveAccount(account);
		return account;
	}
	@PutMapping("/toggle-status")
	public Boolean toggleStatus(@RequestBody Account account)
	{
		try {
			Account account2 = accountService.findByUsername(account.getUsername());
			account2.setEnable(!account2.getEnable());
			accountService.saveAccount(account2);
			System.out.println(account2.getEnable());
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}