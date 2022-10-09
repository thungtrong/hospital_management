package com.hospitalmanagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hospitalmanagement.config.UserPrincipal;
import com.hospitalmanagement.model.Account;
import com.hospitalmanagement.repository.AccountRepository;

@Service
public class AccountService implements UserDetailsService {

	@Autowired
	private AccountRepository accountRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountRepository.findById(username).orElse(null);

		if (account == null)
			throw new UsernameNotFoundException(String.format("%s not exists", username));
		return new UserPrincipal(account);
	}

	public Account findByUsername(String username) {
		Account account = accountRepository.findById(username).orElse(null);
		return account;
	}

	public Account saveAccount(Account account) {
		return accountRepository.save(account);
	}

	public Page<Account> findAll(int page, int size, Sort sort) {
		return accountRepository.findAll(PageRequest.of(page, size, sort));
	}

	public Account findByDoctorId(Long doctorId) {
		return accountRepository.findByDoctorId(doctorId);
	}

    public Account update(Account account) {
		if (account.getUsername() != null && account.getUsername().isEmpty())
		{
			throw new IllegalArgumentException("Username must not be empty");
		}
		return accountRepository.save(account);
    }

}
