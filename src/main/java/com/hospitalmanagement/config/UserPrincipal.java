package com.hospitalmanagement.config;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.hospitalmanagement.model.Account;

public class UserPrincipal implements UserDetails{
	static final String DOCTOR = "DOCTOR";
	static final String ADMIN = "ADMIN";
	
	private Account account;
	
	public UserPrincipal() {
		// TODO Auto-generated constructor stub
	}
	
	public UserPrincipal(Account account)
	{
		this.account = account;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		System.out.println(account);
		String role = account.getRole();
		role = role.equals("") ? DOCTOR : ADMIN; 
		return Collections.singleton(new SimpleGrantedAuthority(role));
	}

	@Override
	public String getPassword() {
		return account.getPassword();
	}

	@Override
	public String getUsername() {
		return account.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
//		return account.getEnable();
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
//		return account.getEnable();
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
//		return account.getEnable();
		return true;
	}

}
