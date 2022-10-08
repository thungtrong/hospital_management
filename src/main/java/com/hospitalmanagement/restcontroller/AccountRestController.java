package com.hospitalmanagement.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.model.Account;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.response.BasicResponse;
import com.hospitalmanagement.service.AccountService;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/account")
public class AccountRestController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private BCryptPasswordEncoder encoder;

	@PostMapping({ "/create" })
	public ResponseEntity<Object> create(@RequestBody Account account) {
		Doctor doctor = account.getDoctor();
		if (doctor == null || doctor.getId() == null) {
			throw new IllegalArgumentException();
		}
		if (accountService.findByDoctorId(doctor.getId()) != null) {
			BasicResponse response = new BasicResponse();
			response.setStatus(false);
			response.setMessage("Doctor already have a account");
			return new ResponseEntity<>(response, HttpStatus.CONFLICT);
		}
		account.setEnable(true);
		account.setRole(UserPrincipal.DOCTOR);
		account.setPassword(encoder.encode("12345678"));
		accountService.saveAccount(account);

		BasicResponse response = new BasicResponse();
		response.setStatus(true);
		response.setMessage("Create account successfully");
		return new ResponseEntity<>(response, HttpStatus.CREATED);
	}

	@PutMapping("/toggle-status")
	public ResponseEntity<BasicResponse> toggleStatus(@RequestBody Account account, Authentication authentication) {
		BasicResponse body = new BasicResponse();

		UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
		if (!userPrincipal.isAdmin()) {
			body.setStatus(false);
			body.setMessage("You do not have permission to perform this action");
			return new ResponseEntity<>(body, HttpStatus.FORBIDDEN);
		}

		// Not allow disable current account
		String username = account.getUsername(); // username which toggle status
		if (userPrincipal.getUsername().equals(username)) {
			body.setStatus(false);
			body.setMessage("You can not disable your-self");
			return new ResponseEntity<>(body, HttpStatus.FORBIDDEN);
		}

		if (username.length() == 0) {
			body.setStatus(false);
			body.setMessage("Username should not be empty");
			return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
		}

		try {
			Account account2 = accountService.findByUsername(account.getUsername());
			account2.setEnable(!account2.getEnable());
			accountService.saveAccount(account2);

			body.setStatus(true);
			String statusString = account2.getEnable() ? "enable" : "disable";
			body.setMessage(String.format("%s is %s now", username, statusString));
			return new ResponseEntity<>(body, HttpStatus.OK);
		} catch (Exception e) {
			body.setStatus(true);
			body.setMessage("Something went wrong! Please try again after some time");
			return new ResponseEntity<>(body, HttpStatus.OK);
		}
	}
}