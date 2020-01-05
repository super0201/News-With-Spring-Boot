package com.fpoly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.reportDao;

@Controller
public class reportController {
	@Autowired
	reportDao dao;

	/**
	 * inventoryBycategories()
	 * Statistics views
	 * @param model
	 * @return admin/thongKe/tkluotxem
	 * @author hong-cong
	 */
	@RequestMapping("admin/tkluotxem")
	public String inventoryBycategories(Model model) {
		model.addAttribute("views", dao.viewsBycategories());
		return "admin/thongKe/tkluotxem";
	}

	/**
	 * revenueBycategories()
	 * Statistics articles by category
	 * @param model
	 * @return admin/thongKe/tkbaiviet
	 * @author hong-cong
	 */
	@RequestMapping("admin/tkbaiviet")
	public String revenueBycategories(Model model) {
		model.addAttribute("status", dao.postsBycategories());
		return "admin/thongKe/tkbaiviet";

	}

	/**
	 * advertByadvertisement()
	 * Reporter revenue statistics
	 * @param model
	 * @return admin/thongKe/doanhthu_phongvien
	 * @author hong-cong
	 */
	@RequestMapping("admin/tkphongvien")
	public String advertByadvertisement(Model model) {
		model.addAttribute("price", dao.advertByadvertisement());
		model.addAttribute("views", dao.priceBymember());
		return "admin/thongKe/doanhthu_phongvien";
	}
	
	/**
	 * advertByadvertisement2()
	 * Advertiser revenue statistics
	 * @param model
	 * @return admin/thongKe/doanhthu_quangcao
	 * @author hong-cong
	 */
	@RequestMapping("admin/tkquangcao")
	public String advertByadvertisement2(Model model) {
		model.addAttribute("price", dao.advertByadvertisement());
		model.addAttribute("views", dao.priceBymember());
		return "admin/thongKe/doanhthu_quangcao";
	}
}
