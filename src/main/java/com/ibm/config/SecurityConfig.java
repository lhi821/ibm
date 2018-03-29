package com.ibm.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	public void configure(WebSecurity web) throws Exception{
		web.ignoring().antMatchers("/css/**", "js/**", "/");
	}
	
	@Override
	public void configure(HttpSecurity http) throws Exception{
		http.csrf().disable();
//		http.authorizeRequests()
//			//.antMatchers("/member/*").access("ROLE_ADMIN")
//			.antMatchers("/**").permitAll();
//		http.formLogin()
//		// 로그인 페이지 : 컨트롤러 매핑을 하지 않으면 기본 제공되는 로그인 페이지가 뜬다.
//		.loginProcessingUrl("/member/index");
//	
//		http.logout()
//		// /logout 을 호출할 경우 로그아웃
//		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//		// 로그아웃이 성공했을 경우 이동할 페이지
//		.logoutSuccessUrl("/member/index");
//		
//		http.sessionManagement()
//		// session 허용 개수 1
//		.maximumSessions(1)
//		// 이미 다른 사람이 로그인하고 있을 경우 같은 아이디로 새로운 접속 불가
//		.maxSessionsPreventsLogin(true);
		
//		http.sessionManagement().sessionAuthenticationStrategy();
	}
}
