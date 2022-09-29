package com.hospitalmanagement.config;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.hospitalmanagement.model.Account;

public class UserPrincipal implements UserDetails{
	static final String DOCTOR = "DOCTOR";
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
		return Collections.singleton(new SimpleGrantedAuthority(DOCTOR));
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
