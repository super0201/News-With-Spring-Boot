package com.fpoly.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.dao.categoriesDao;
import com.fpoly.dao.memberDao;
import com.fpoly.dao.newsDao;
import com.fpoly.dao.newsDaoImpl;
import com.fpoly.dao.typeDao;
import com.fpoly.entity.categories;
import com.fpoly.entity.member;
import com.fpoly.entity.news;
import com.fpoly.entity.type;

@Controller
@Transactional
public class NewController {
	@Autowired
	categoriesDao catDao;
	@Autowired
	newsDaoImpl newDAO;
	@Autowired
	ServletContext app;
	@Autowired
	SessionFactory factory;
	@Autowired
	newsDao newsdao;
	@Autowired
	typeDao typedao;
	@Autowired
	memberDao memdao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse reponse;
	@Autowired
	HttpSession httpsession;

	/**
	 * qlthembaiviet() 
	 * Get list categories
	 * @param model
	 * @return admin/phongVien/qlthembaiviet
	 * @author thai-bao
	 */
	@RequestMapping("/phongvien/thembaiviet")
	public String qlthembaiviet(Model model) {
		List<categories> list = catDao.findAll();
		model.addAttribute("listCat", list);
		return "admin/phongVien/qlthembaiviet";
	}

	/**
	 * getbaiviet() 
	 * Get list categories
	 * @param model, request, reponse
	 * @return admin/phongVien/qlthembaiviet
	 * @author thai-bao
	 */
	@GetMapping("/phongvien/createnews")
	public String getbaiviet(Model model, HttpServletRequest request, HttpServletResponse reponse) {
		HttpSession session = request.getSession();
		String Username = (String) session.getAttribute("userName");
		news ne = new news();
		model.addAttribute("form", ne);
		List<categories> list = catDao.findAll();
		model.addAttribute("listCat", list);
		return "admin/phongVien/qlthembaiviet";
	}

	/**
	 * createnews()
	 *  Create news
	 * @param model, Ne, errors, file
	 * @return admin/phongVien/qlthembaiviet
	 * @author thai-bao
	 */
	@PostMapping("/phongvien/createnews")
	public String createnews(Model model, @Validated @ModelAttribute("form") news Ne, BindingResult errors,
			@RequestParam("images") MultipartFile file, HttpServletRequest request, HttpServletResponse reponse) {

		HttpSession session = request.getSession();
		if (file.isEmpty()) {
			Ne.setImagestitle("trump.png");
		} else {
			Ne.setImagestitle(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/news/" + Ne.getImagestitle());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (errors.hasErrors()) {
			List<categories> list = catDao.findAll();
			model.addAttribute("listCat", list);
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			return "admin/phongVien/qlthembaiviet";

		} else {

			try {
				String Username = (String) session.getAttribute("userName");
				System.out.println(Username);
				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date(System.currentTimeMillis());
				Ne.setmember(memdao.findById(Username));
				Ne.setDate(date);
				Ne.setStatus(false);
				Ne.setViews(0);
				newDAO.create(Ne);

				httpsession.setAttribute("messageBV1", "Bài viết của bạn đã được thêm thành công !");
				httpsession.removeAttribute("messageQC");
				httpsession.removeAttribute("messageDM");
				httpsession.removeAttribute("messageBV2");
				httpsession.removeAttribute("messageVT");

			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", "lỗi");
			}
			return "redirect:/phongvien/thongtin";
		}

	}

	/**
	 * qlthongtin() 
	 * Get list news by username when status = true and false
	 * @param model
	 * @return admin/phongVien/qlthongtin
	 * @author thai-bao
	 */
	@RequestMapping("/phongvien/thongtin")
	public String qlthongtin(Model model) {

		HttpSession session = request.getSession();
		String Username = (String) session.getAttribute("userName");

		List<categories> list1 = catDao.findAll();
		model.addAttribute("listCat", list1);

		List<news> list = newsdao.findAllbyusernamefalse(Username);
		model.addAttribute("list", list);

		List<news> list2 = newsdao.findAllbyusernametrue(Username);
		model.addAttribute("list2", list2);

		return "admin/phongVien/qlthongtin";
	}

	/**
	 * updatebaiviet() 
	 * Edit news
	 * @param model, id
	 * @return admin/phongVien/updatebaiviet
	 * @author thai-bao
	 */
	@RequestMapping("/phongvien/update/{id}")
	public String updatebaiviet(Model model, @PathVariable("id") int id) {
		Session session = factory.getCurrentSession();

		List<categories> list1 = catDao.findAll();
		model.addAttribute("listCat", list1);

		news entity = session.get(news.class, id);
		model.addAttribute("form", entity);
		return "admin/phongVien/updatebaiviet";
	}

	/**
	 * updatenews() 
	 * Update news
	 * @param model, entity, errors, file
	 * @return redirect:/phongvien/thongtin
	 * @author thai-bao
	 */
	@RequestMapping("/phongvien/update")
	public String updatenews(Model model, @Validated @ModelAttribute("form") news entity, BindingResult errors,
			@RequestParam("images") MultipartFile file) {

		if (!file.isEmpty()) {

			entity.setImagestitle(file.getOriginalFilename());

			try {
				String path = app.getRealPath("/static/images/news/" + entity.getImagestitle());

				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			List<categories> list1 = catDao.findAll();
			model.addAttribute("listCat", list1);
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			return "admin/phongVien/updatebaiviet";
		} else {
			try {
				HttpSession session = request.getSession();
				String Username = (String) session.getAttribute("userName");
				System.out.println("tên phóng viên là : " + Username);

				Date date = new Date(System.currentTimeMillis());
				entity.setmember(memdao.findById(Username));
				entity.setDate(date);
				entity.setStatus(false);
				entity.setViews(0);
				newsdao.update(entity);
				httpsession.setAttribute("messageBV1", "Bài viết của bạn đã được cập nhật thành công !");
				httpsession.removeAttribute("messageQC");
				httpsession.removeAttribute("messageDM");
				httpsession.removeAttribute("messageBV2");
				httpsession.removeAttribute("messageVT");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/phongvien/thongtin";
	}

	/**
	 * newsDelete()
	 * Delete news
	 * @param model, id
	 * @return redirect:/phongvien/thongtin
	 * @author thai-bao
	 */
	@RequestMapping("/phongvien/delete/{id}")
	public String newsDelete(Model model, @PathVariable("id") Integer id) {
		newsdao.delete(id);
		httpsession.setAttribute("messageBV1", "Bài viết của bạn đã được xóa thành công !");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageVT");
		return "redirect:/phongvien/thongtin";
	}

	/**
	 * newsDuyet() 
	 * Get list news status = true and false
	 * @param model
	 * @return admin/tinTuc/qlbaiviet
	 * @author van-tam
	 */
	@RequestMapping("/admin/index")
	public String newsDuyet(Model model) {
		List<news> listD = newsdao.findAllDuyet();
		List<news> listCD = newsdao.findAllChuaDuyet();
		model.addAttribute("listNED", listD);
		model.addAttribute("listNECD", listCD);
		
		List<type> list = typedao.findAll();
		model.addAttribute("listType", list);
		return "admin/tinTuc/qlbaiviet";
	}

	@RequestMapping("/admin/chitietbaiviet")
	public String chitietbaiviet(Model model) {
		return "admin/tinTuc/chitietbaiviet";
	}

	/**
	 * newssDelete() 
	 * Delete news
	 * @param model, id
	 * @return redirect:/admin/index
	 * @author van-tam
	 */
	@RequestMapping("/admin/newsDelete/{id}")
	public String newssDelete(Model model, @PathVariable("id") Integer id) {
		newsdao.delete(id);
		httpsession.setAttribute("messageBV1", "Xóa bài viết thành công !");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageVT");
		return "redirect:/admin/index";
	}

	/**
	 * newsEdit() 
	 * Edit news
	 * @param model, id
	 * @return admin/tinTuc/chitietbaiviet
	 * @author van-tam
	 */
	@GetMapping("/admin/newsEdit/{id}")
	public String newsEdit(Model model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		news entity = session.get(news.class, id);
		model.addAttribute("news", entity);
		List<type> list = typedao.findAll();
		model.addAttribute("listType", list);
		return "admin/tinTuc/chitietbaiviet";
	}

	/**
	 * newsEdit() 
	 * Approved news status = True
	 * @param model, entity, id, request
	 * @return redirect:/admin/index
	 * @author van-tam
	 */
	@PostMapping("/admin/updateNews")
	public String updateNews2(Model model, news entity, member id, HttpServletRequest request) {
		
		Integer typeId = Integer.parseInt(request.getParameter("type.id"));
		HttpSession session = request.getSession();
		String Username = (String) session.getAttribute("userName");
		String fullname = request.getParameter("fullnames");
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		entity.setMember2(memdao.findById(Username));
		entity.setUpdatedAt(date);
		entity.setStatus(true);
		/* convert hot into new */
		if (typeId == 1) {
			if (!newsdao.getlistType().isEmpty()) {
				newsdao.update_TinHot();
			}
		}
		newsdao.update(entity);
		httpsession.setAttribute("messageBV1",
				"Bài viết của phóng viên " + fullname + " đã được phê duyệt thành công !");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageVT");
		return "redirect:/admin/index";
	}

	/**
	 * newsEditType() Updated news types already available
	 * 
	 * @param model, entity, request
	 * @return redirect:/admin/index
	 * @author van-tam
	 */
	@PostMapping("/update")
	public String newsEditType(Model model, news entity, HttpServletRequest request) {
		/*
		 * Integer idd = Integer.parseInt(request.getParameter("id")); Integer typeId =
		 * Integer.parseInt(request.getParameter("type.id")); String fullname =
		 * request.getParameter("fullname"); convert hot into new if (typeId == 1) {
		 * newsdao.update_TinHot(); }
		 */
		Integer idd = Integer.parseInt(request.getParameter("id"));
		Integer typeId = Integer.parseInt(request.getParameter("type.id"));
		String fullname = request.getParameter("fullname");
		if (typeId == 1) {
			if (!newsdao.getlistType().isEmpty()) {
				newsdao.update_TinHot();
			}
		}
		
		newsdao.getListNewsUpdate(idd, typeId);
		httpsession.setAttribute("messageBV2",
				"Bài viết của phóng viên " + fullname + " đã được cập nhật thành công !");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageVT");
		return "redirect:/admin/index";
	}

}