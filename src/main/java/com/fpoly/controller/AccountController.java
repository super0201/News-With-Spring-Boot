package com.fpoly.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.fpoly.dao.memberDao;
import com.fpoly.dao.roleDao;
import com.fpoly.entity.member;

@Controller
@Configuration
public class AccountController {

	@Autowired
	memberDao dao;
	
	@Autowired
	roleDao role;
	
	@Autowired
	ServletContext app;

	 /**
	 * query()
	 * Get list member
	 * @param null
	 * @return ok
	 * @author van-tam
	 */
	@RequestMapping("account/query")
	public String query() {
		List<member> list = dao.findAll();
		for (member c : list) {
			System.out.println(c.getEmail());
		}
		return "ok";
	}
	
	/**
	 * register()
	 * Rigister
	 * @param model
	 * @return content/signup
	 * @author van-tam
	 */
	@GetMapping("/signup")
	public String register(Model model) {
		member user = new member();
		model.addAttribute("form", user);
		return "content/signup";
	}

	/**
	 * register()
	 * Insert member
	 * @param model, up_images, file
	 * @return content/signup
	 * @author van-tam
	 */
	@PostMapping("/signup")
	public String register(Model model, @RequestParam("up_images") MultipartFile file,
			@Validated @ModelAttribute("form") member user, BindingResult errors) {
		if (file.isEmpty()) {
			user.setImages("trump.png");
		} else {
			user.setImages(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/news/" + user.getImages());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
		} else {
			try {
				dao.create(user);
				model.addAttribute("messageDK", "Đăng ký thành công");
			} catch (Exception e) {
				model.addAttribute("messageDK", "Tài khoản đã được sử dụng");
			}
		}
		return "content/signup";
	}
	
	
	/**
	 * register()
	 * Rigister
	 * @param model
	 * @return content/signup
	 * @author van-tam
	 */
	@GetMapping("admin/registerpv")
	public String register_pv(Model model) {
		member user = new member();
		model.addAttribute("form", user);
		return "admin/tinTuc/register_phongvien";
	}

	
	/**
	 * register()
	 * Insert member
	 * @param model, up_images, file
	 * @return content/signup
	 * @author van-tam
	 */
	@PostMapping("/register_phongvien")
	public String register_phongvien(Model model, @RequestParam("up_images") MultipartFile file,
			@Validated @ModelAttribute("form") member user, BindingResult errors) {
		if (file.isEmpty()) {
			user.setImages("trump.png");
		} else {
			user.setImages(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/news/" + user.getImages());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
		} else {
			try {
				user.setRole(role.findById(2));
				dao.create(user);
				model.addAttribute("messageDKPV", "Thêm mới phóng viên thành công !");
			} catch (Exception e) {
				model.addAttribute("messageDKPV", "Tài khoản đã được sử dụng !");
			}
		}
		return "admin/tinTuc/register_phongvien";
	}

}
