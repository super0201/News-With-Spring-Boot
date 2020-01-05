package com.fpoly.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fpoly.dao.categoriesDao;
import com.fpoly.entity.categories;

@Transactional
@Controller
public class categoriesController {

	@Autowired
	categoriesDao catDao;
	@Autowired
	SessionFactory factory;
	@Autowired
	HttpSession httpsession;

	/**
	 * categorsies()
	 * Get list categorsies
	 * @param model
	 * @return admin/tinTuc/qldanhmuc
	 * @author van-tam
	 */
	@RequestMapping("admin/danhmuc")
	public String categorsies(Model model) {
		List<categories> list = catDao.findAll();
		model.addAttribute("listCat", list);
		return "admin/tinTuc/qldanhmuc";
	}

	/**
	 * createPost()
	 * Create categories
	 * @param model, entity
	 * @return redirect:/admin/danhmuc
	 * @author van-tam
	 */
	@PostMapping("/admin/createCategories")
	public String createPost(Model model, categories entity) {
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		entity.setCreatedAt(date);
		catDao.create(entity);
		httpsession.setAttribute("messageDM", "Thêm danh mục thành công !");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageVT");
		return "redirect:/admin/danhmuc";
	}

	/**
	 * deleleCategories()
	 * Detele categories
	 * @param model, id
	 * @return redirect:/admin/danhmuc
	 * @author van-tam
	 */
	@RequestMapping("/admin/categoriesDelete/{id}")
	public String deleleCategories(Model model, @PathVariable("id") Integer id) {
		
		if(!catDao.findCAT(id).isEmpty()) {
			httpsession.setAttribute("messageDM", "Không thể xóa, danh mục đang được sử dụng !");
		}else {
			httpsession.setAttribute("messageDM", "Xóa danh mục thành công !");
			catDao.delete(id);
		}
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageVT");
		return "redirect:/admin/danhmuc";
	}

	/**
	 * categoriesEdit()
	 * Edit categories
	 * @param model, id
	 * @return admin/tinTuc/suadanhmuc
	 * @author van-tam
	 */
	@RequestMapping("/admin/categoriesEdit/{id}")
	public String categoriesEdit(Model model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		categories entity = session.get(categories.class, id);
		model.addAttribute("categoriesList", entity);
		return "admin/tinTuc/suadanhmuc";
	}

	/**
	 * update()
	 * Update categories
	 * @param model, entity
	 * @return redirect:/admin/danhmuc
	 * @author van-tam
	 */
	@PostMapping("/admin/updateCategories")
	public String update(Model model, categories entity) {
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		entity.setUpdatedAt(date);
		catDao.update(entity);
		
		httpsession.setAttribute("messageDM", "Danh mục được cập nhật thành công !");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageVT");
		return "redirect:/admin/danhmuc";
	}

}
