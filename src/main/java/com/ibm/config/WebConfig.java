package com.ibm.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.ibm.interceptor.AuthInterceptor;

@Configuration
@ComponentScan
public class WebConfig extends WebMvcConfigurerAdapter {
	
	@Bean
    public AuthInterceptor AuthInterceptor() {
        return new AuthInterceptor();
    }

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor((HandlerInterceptor)new AuthInterceptor())
		.addPathPatterns("/**") 
		.excludePathPatterns("/member/**");
	}

}