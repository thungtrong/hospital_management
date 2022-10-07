package com.hospitalmanagement.config;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.hospitalmanagement.model.Account;

public class UserPrincipal implements UserDetails{
	public static final String DOCTOR = "DOCTOR";
	public static final String ADMIN = "ADMIN";
	public static final String ROLE_DOCTOR = "ROLE_DOCTOR";
	public static final String ROLE_ADMIN = "ROLE_ADMIN";
	
	
	private Account account;
	
	private Map<String, Boolean> rolesMap;
	
	public UserPrincipal() {
		// TODO Auto-generated constructor stub
	}
	
	public UserPrincipal(Account account)
	{
		this.account = account;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		String role = account.getRole();
		role = role.equals(ADMIN) ? ROLE_ADMIN : ROLE_DOCTOR;
		
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
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
//		if (account.getEnable() == null)
//			return false;
//		return account.getEnable();
		return true;
	}

	public Account getAccount() {
		return account;
	}
	
	public void setAccount(Account account)
	{
		this.account=account;
	}

	public Map<String, Boolean> getRolesMap() {
		if (rolesMap == null || rolesMap.isEmpty()) {
			rolesMap = new HashMap<>();
			rolesMap.put("isDoctor", account.getRole().equals(DOCTOR));
			rolesMap.put("isAdmin", account.getRole().equals(ADMIN));
		}
		
		return rolesMap;
	}
	

	
}
