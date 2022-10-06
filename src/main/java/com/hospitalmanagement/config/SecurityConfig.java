package com.hospitalmanagement.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	@Qualifier(value = "accountService")
	private UserDetailsService userDetailService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder()
	{
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public AuthenticationProvider authProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailService);
		provider.setPasswordEncoder(passwordEncoder());
		return provider;
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.csrf().disable()
		.authorizeRequests()
			.antMatchers(HttpMethod.DELETE).hasAnyRole(UserPrincipal.ADMIN)
			.antMatchers("/public/**", "/api/account/**").permitAll()
			.anyRequest().authenticated()
		.and()
        .formLogin()
        	.loginPage("/login").permitAll()
        	.loginProcessingUrl("/login").permitAll()
        .and()
        .logout()
        	.invalidateHttpSession(true)
        	.clearAuthentication(true)
        	.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
        	.logoutSuccessUrl("/login")
        .and()
        .authenticationProvider(authProvider())
        .httpBasic();
	}
}
