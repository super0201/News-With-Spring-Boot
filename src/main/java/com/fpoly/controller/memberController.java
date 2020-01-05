package com.fpoly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.memberDao;
import com.fpoly.entity.member;

@Controller
@Transactional
public class memberController {

	@Autowired
	memberDao memdao;
	member men;

	/**
	 * nguoidung()
	 * Get list member
	 * @param model
	 * @return admin/nguoiDung/qlnguoidung
	 * @author van-tam
	 */
	@RequestMapping("admin/nguoidung")
	public String nguoidung(ModelMap model) {
		List<member> list = memdao.findRoleND();
		model.addAttribute("listND", list);
		return "admin/nguoiDung/qlnguoidung";
	}

	/**
	 * phongvien()
	 * Get list member
	 * @param model
	 * @return admin/nguoiDung/qlphongvien
	 * @author van-tam
	 */
	@RequestMapping("admin/phongvien")
	public String phongvien(ModelMap model) {
		List<member> list = memdao.findRolePV();
		model.addAttribute("listPV", list);
		return "admin/nguoiDung/qlphongvien";
	}

	/**
	 * nhaquangcao()
	 * Get list member
	 * @param model
	 * @return admin/tinTuc/qlnhaquangcao
	 * @author van-tam
	 */
	@RequestMapping("admin/nhaquangcao")
	public String nhaquangcao(ModelMap model) {
		List<member> list = memdao.findRoleNQC();
		model.addAttribute("listNQC", list);
		return "admin/tinTuc/qlnhaquangcao";
	}

}
