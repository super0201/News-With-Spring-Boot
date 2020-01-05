package com.fpoly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.displayDao;
import com.fpoly.dao.quangcao;
import com.fpoly.entity.advertisement;
import com.fpoly.entity.categories;
import com.fpoly.entity.member;
import com.fpoly.entity.news;

@Controller
@Transactional
public class homeController {
	
	@Autowired
	SessionFactory factory;

	@Autowired
	displayDao dispalydao;

	@Autowired
	quangcao qc;

	/**
	 * index()
	 * Get list news, categories, advertiment
	 * @param model
	 * @return layout/conten
	 * @author nguyen-khang
	 */
	@RequestMapping("/")
	public String index(Model model) {
		List<news> list = dispalydao.getTinHot();
		model.addAttribute("tinhot", list);

		List<news> list1 = dispalydao.getTinMoi();
		model.addAttribute("tinmoi", list1);

		List<news> list2 = dispalydao.getTinThuong();
		model.addAttribute("tinthuong", list2);

		List<categories> list3 = dispalydao.getListDanhMuc();
		model.addAttribute("listdanhmuc", list3);

		advertisement list4 = qc.getAdvertisement_trangchu();
		model.addAttribute("trangchu", list4);

		advertisement list5 = qc.getAdvertisement_trangcon();
		model.addAttribute("trangcon", list5);

		return "layout/content";
	}

	/**
	 * chiTiet()
	 * Get list news, categories, advertiment and update views colums ++1 when click function getChiTiet() 
	 * @param model, request, id, entity, n
	 * @return content/details
	 * @author nguyen-khang
	 */
	@RequestMapping("/chitiet")
	public String chiTiet(Model model, HttpServletRequest request, @Param("id") Integer id, news entity, news n) {
		news news = dispalydao.getChiTiet(id);
		news.setViews(news.getViews() + 1);
		dispalydao.update(news);
		model.addAttribute("tinchitiet", news);

		List<news> list1 = dispalydao.getTinThuong();
		model.addAttribute("tinthuong", list1);

		List<news> list2 = dispalydao.getTinMoi();
		model.addAttribute("tinmoi", list2);

		List<categories> list3 = dispalydao.getListDanhMuc();
		model.addAttribute("listdanhmuc", list3);

		advertisement list4 = qc.getAdvertisement_trangchu();
		model.addAttribute("trangchu_detail", list4);

		advertisement list5 = qc.getAdvertisement_trangcon();
		model.addAttribute("trangcon_detail", list5);

		HttpSession session = request.getSession(true);
		String Username = (String) session.getAttribute("userName");
		member members = (member) session.getAttribute("user");
		if (members != null) {
			String fullname = members.getFullName();
			String img = members.getImages();
			model.addAttribute("fullname", fullname);
			model.addAttribute("img", img);
		}
		model.addAttribute("Username", Username);
		model.addAttribute("id", id);
		return "content/details";
	}

	/**
	 * timKiem()
	 * Search news from categories and get list categories, news, advertisiment
	 * @param model, request, id
	 * @return content/search
	 * @author nguyen-khang
	 */
	@RequestMapping("/timkiem")
	public String timKiem(Model model, HttpServletRequest request, @Param("id") Integer id) {
		List<news> list = dispalydao.getListCategoriesById(id);
		model.addAttribute("listsearch", list);

		List<news> list1 = dispalydao.getTinThuong();
		model.addAttribute("tinthuong", list1);
		List<categories> list3 = dispalydao.getListDanhMuc();
		model.addAttribute("listdanhmuc", list3);

		advertisement list4 = qc.getAdvertisement_trangchu();
		model.addAttribute("trangchu_search", list4);

		advertisement list5 = qc.getAdvertisement_trangcon();
		model.addAttribute("trangcon_search", list5);
		return "content/search";
	}

	/**
	 * timKiemButton()
	 * Search news by title and get list categories, news, advertisiment
	 * @param model
	 * @return content/search
	 * @author nguyen-khang
	 */
	@PostMapping("/search")
	public String timKiemButton(HttpServletRequest request, Model model) {
		String title = request.getParameter("search");
		
		List<news> list = dispalydao.getListSearch(title);
		model.addAttribute("listsearch", list);
		
		List<news> list1 = dispalydao.getTinThuong();
		model.addAttribute("tinthuong", list1);
		
		List<categories> list3 = dispalydao.getListDanhMuc();
		model.addAttribute("listdanhmuc", list3);
		
		advertisement list4 = qc.getAdvertisement_trangchu();
		model.addAttribute("trangchu_search", list4);

		advertisement list5 = qc.getAdvertisement_trangcon();
		model.addAttribute("trangcon_search", list5);
		return "content/search";
	}
}
