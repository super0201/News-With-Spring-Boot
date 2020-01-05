package com.fpoly.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fpoly.dao.memberDao;
import com.fpoly.dao.newsDao;
import com.fpoly.entity.member;

@Controller
@Transactional
public class loginController {

	@Autowired
	memberDao dao;
	@Autowired
	newsDao newsdao;
	@Autowired
	HttpSession httpsession;

	@GetMapping("/login")
	public String Login() {
		return "content/login";
	}

	/**
	 * Login()
	 * Check username, password and authorizeInterceptor
	 * @param model, username,  pw, request,  response
	 * @return content/login
	 * @author van-tam
	 */
	@PostMapping("/login")
	public String Login(ModelMap model, @RequestParam("id") String username, @RequestParam("password") String pw,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		member user = dao.findById(username);
		httpsession = request.getSession();
		if (user == null) {
			model.addAttribute("message", "Tài khoản không hợp lệ");
		} else if (!pw.equals(user.getPassword())) {
			model.addAttribute("message", "Mật khẩu không hợp lệ");
		} else {
			httpsession.setAttribute("user", user);

			/**
			 * Admin
			 */
			if (user.getRole().getId() == 1) {
				httpsession.setAttribute("fullname", user.getFullName());
				httpsession.setAttribute("userName", user.getUsername());
				httpsession.setAttribute("userAD", user);
				httpsession.setAttribute("images", user.getImages());
				httpsession.setAttribute("link", "/admin/index");
				return "redirect:/admin/index";
			}

			/**
			 * Phóng viên
			 */
			if (user.getRole().getId() == 2) {
				httpsession.setAttribute("fullname", user.getFullName());
				httpsession.setAttribute("userName", user.getUsername());
				httpsession.setAttribute("userPV", user);
				httpsession.setAttribute("images", user.getImages());
				httpsession.setAttribute("link", "/phongvien/createnews");
				return "redirect:/phongvien/createnews";
			}
			
			/**
			 * Nhà quảng cáo
			 */
			if (user.getRole().getId() == 3) {
				httpsession.setAttribute("fullname", user.getFullName());
				httpsession.setAttribute("userName", user.getUsername());
				httpsession.setAttribute("userNQC", user);
				httpsession.setAttribute("images", user.getImages());
				httpsession.setAttribute("link", "/nhaquangcao/danhsachquangcao");
				return "redirect:/nhaquangcao/danhsachquangcao";
			}

			/**
			 * Đọc giả
			 */
			if (user.getRole().getId() == 4) {
				httpsession.setAttribute("fullname", user.getFullName());
				httpsession.setAttribute("userName", user.getUsername());
				httpsession.setAttribute("userDG", user);
				httpsession.setAttribute("images", user.getImages());
				httpsession.setAttribute("link", "/");
				return "redirect:/";
			}
		}
		return "content/login";
	}

	/**
	 * logout()
	 * Logout account and remove session
	 * @param model
	 * @return redirect:/
	 * @author van-tam
	 */
	@RequestMapping("/logout")
	public String logout(Model model) {
		httpsession.removeAttribute("user");
		httpsession.removeAttribute("userAD");
		httpsession.removeAttribute("userName");
		httpsession.removeAttribute("userPV");
		httpsession.removeAttribute("userNQC");
		httpsession.removeAttribute("userDG");
		httpsession.removeAttribute("fullname");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageVT");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageDBV");
		return "redirect:/";
	}
}
