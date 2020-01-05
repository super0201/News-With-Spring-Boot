package com.fpoly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fpoly.intercepter.AuthorizeInterceptor;
import com.fpoly.intercepter.AuthorizeInterceptorAD;
import com.fpoly.intercepter.AuthorizeInterceptorDG;
import com.fpoly.intercepter.AuthorizeInterceptorNQC;
import com.fpoly.intercepter.AuthorizeInterceptorPV;

@Configuration
public class InterConfig implements WebMvcConfigurer {

	@Autowired
	AuthorizeInterceptorAD authAD;

	@Autowired
	AuthorizeInterceptorDG authDG;

	@Autowired
	AuthorizeInterceptorPV authPV;

	@Autowired
	AuthorizeInterceptorNQC authNQC;

	@Autowired
	AuthorizeInterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// Chặn trang, nếu muốn chặn thêm thì cứ thêm (trang 1, trang 2,...)
		// ("/admin/**") nghĩa là link URI mà bắt đầu là /admin/** là chặn hết

		// Không vai trò
		registry.addInterceptor(auth).addPathPatterns("/phongvien/**", "/nhaquangcao/**", "/admin/**");
		
		// Vai trò ADMIN
		registry.addInterceptor(authAD).addPathPatterns("/phongvien/**", "/nhaquangcao/**");

		// Vai trò ĐỌC GIẢ
		registry.addInterceptor(authDG).addPathPatterns("/admin/**", "/phongvien/**", "/nhaquangcao/**");

		// Vai trò PHÓNG VIÊN
		registry.addInterceptor(authPV).addPathPatterns("/admin/**", "/nhaquangcao/**");

		// Vai trò NHÀ QUẢNG CÁO
		registry.addInterceptor(authNQC).addPathPatterns("/admin/**", "/phongvien/**");
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
}