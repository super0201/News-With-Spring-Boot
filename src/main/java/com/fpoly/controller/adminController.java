package com.fpoly.controller;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Transactional
public class adminController {
	@Autowired
	SessionFactory factory;

	/**
	 * qlthongke()
	 * Move page qlthongke 
	 * @param model
	 * @return admin/content/qlthongke
	 * @author van-tam
	 */
	@RequestMapping("/admin/thongke")
	public String qlthongke(Model model) {
		return "admin/content/qlthongke";
	}

	/**
	 * qltinhtrang()
	 * Move page qltinhtrang 
	 * @param model
	 * @return admin/content/qltinhtrang
	 * @author van-tam
	 */
	@RequestMapping("/admin/tinhtrang")
	public String qltinhtrang(Model model) {
		return "admin/content/qltinhtrang";
	}
}
