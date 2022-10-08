package com.hospitalmanagement.restcontroller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.exception.ModelNotVaildException;
import com.hospitalmanagement.model.Account;
import com.hospitalmanagement.model.Doctor;
import com.hospitalmanagement.request.ChangePasswordRequest;
import com.hospitalmanagement.response.BasicResponse;
import com.hospitalmanagement.service.AccountService;
import com.hospitalmanagement.service.DoctorService;

@RestController
@RequestMapping(ConstValue.BASE_API_URL + "/account")
public class AccountRestController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@PostMapping({ "/create" })
	public ResponseEntity<Object> create(@RequestBody Account account) {
		Doctor doctor = account.getDoctor();
		if (doctor == null || doctor.getId() == null) {
			throw new IllegalArgumentException();
		}
		if (accountService.findByDoctorId(doctor.getId()) != null) {
			BasicResponse response = new BasicResponse();
			
			response.failure("Doctor already have a account");
			return new ResponseEntity<>(response, HttpStatus.CONFLICT);
		}
		account.setEnable(true);
		account.setRole(UserPrincipal.DOCTOR);
		account.setPassword(passwordEncoder.encode("12345678"));
		accountService.saveAccount(account);

		BasicResponse response = new BasicResponse();

		response.success("Create account successfully");
		return new ResponseEntity<>(response, HttpStatus.CREATED);
	}

	@PutMapping("/toggle-status")
	public ResponseEntity<BasicResponse> toggleStatus(@RequestBody Account account, Authentication authentication) {
		BasicResponse body = new BasicResponse();

		UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
		if (!userPrincipal.isAdmin()) {
			body.failure("You do not have permission to perform this action");
			return new ResponseEntity<>(body, HttpStatus.FORBIDDEN);
		}

		// Not allow disable current account
		String username = account.getUsername(); // username which toggle status
		if (userPrincipal.getUsername().equals(username)) {
			body.failure("You can not disable your-self");
			return new ResponseEntity<>(body, HttpStatus.FORBIDDEN);
		}

		if (username.length() == 0) {
			body.failure("Username should not be empty");
			return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
		}

		try {
			Account account2 = accountService.findByUsername(account.getUsername());
			account2.setEnable(!account2.getEnable());
			accountService.saveAccount(account2);


			String statusString = account2.getEnable() ? "enable" : "disable";
			body.success(String.format("%s is %s now", username, statusString));
			return new ResponseEntity<>(body, HttpStatus.OK);
		} catch (Exception e) {
			body.failure("Something went wrong! Please try again after some time");
			return new ResponseEntity<>(body, HttpStatus.OK);
		}
	}

	@Autowired
	private DoctorService doctorService;

	@PutMapping("/update-profile")
	public ResponseEntity<Object> updateProfile(@Valid @RequestBody Doctor doctor, BindingResult bindingResult)
			throws ModelNotVaildException {
		if (bindingResult.hasErrors())
			throw ModelNotVaildException.fromBindingResult(bindingResult);

		Doctor doctor2 = doctorService.findById(doctor.getId());
		doctor2.setName(doctor.getName());
		doctor2.setAddress(doctor.getAddress());
		doctor2.setDateOfBirth(doctor.getDateOfBirth());
		doctor.setGender(doctor.getGender());
		doctor.setPhoneNumber(doctor.getPhoneNumber());
		doctorService.update(doctor2);
		return new ResponseEntity<>(doctor2, HttpStatus.ACCEPTED);
	}

	@PutMapping("change-password")
	public ResponseEntity<Object> changePassword(@Valid @RequestBody ChangePasswordRequest request,
			BindingResult bindingResult, Authentication authentication) throws ModelNotVaildException {
		
		if (bindingResult.hasErrors()) {
			throw ModelNotVaildException.fromBindingResult(bindingResult);
		}

		BasicResponse response = new BasicResponse();
		UserPrincipal userPrincipal = (UserPrincipal) authentication.getPrincipal();
		Account account = userPrincipal.getAccount();
		
		if (passwordEncoder.matches(request.getOldPassword(), account.getPassword()) == false) {
			response.failure("Password is not correct");
			return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
		}
		
		String newPassword = request.getNewPassword();
		if (newPassword.equals(request.getConfirmNewPassword()) == false) {
			response.failure("Confirm password is not correct");
			return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
		}

		newPassword = passwordEncoder.encode(newPassword);
		account.setPassword(newPassword);
		accountService.update(account);

		response.success("Change password successfully");
		
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
}