package com.fpoly.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fpoly.dao.memberDao;
import com.fpoly.dao.quangcao;
import com.fpoly.entity.advertisement;
import com.fpoly.entity.categories;
import com.fpoly.entity.position;

@Controller
@Transactional
public class quangcaoController {

	@Autowired
	SessionFactory factory;
	@Autowired
	memberDao memdao;
	@Autowired
	quangcao qc;
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext app;
	@Autowired
	HttpSession httpsession;

	/**
	 * getListPosition()
	 * get list position
	 * @param model
	 * @return admin/nhaQuangCao/qlthemquangcao
	 * @author nguyen-khang
	 */
	@RequestMapping("/nhaquangcao/themquangcao")
	public String getListPosition(Model model) {
		List<position> list = qc.getListPosition();
		model.addAttribute("listposition", list);
		return "admin/nhaQuangCao/qlthemquangcao";
	}

	/**
	 * getListAdvertisement()
	 * get list advertisement = true and false
	 * @param model
	 * @return admin/nhaQuangCao/danhsachquangcao
	 * @author nguyen-khang
	 */
	@RequestMapping("/nhaquangcao/danhsachquangcao")
	public String getListAdvertisement(Model model) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("userName");
		List<advertisement> list = qc.getListAdvertisementTrue(username);
		model.addAttribute("list_AdvertisementTrue", list);
		List<advertisement> list2 = qc.getListAdvertisementFalse(username);
		model.addAttribute("list_AdvertisementFalse", list2);
		return "admin/nhaQuangCao/danhsachquangcao";
	}

	/**
	 * insertQuangCao()
	 * Create advertisement
	 * @param model, request, ad, file
	 * @return redirect:/nhaquangcao/danhsachquangcao
	 * @author nguyen-khang
	 */
	@PostMapping("/insert")
	public String insertQuangCao(Model model, HttpServletRequest request, advertisement ad,
			@RequestParam("imagess") MultipartFile file) {
		Integer trangchu = qc.getTrangchu();
		Integer trangcon = qc.getTrangcon();
		
		HttpSession session = request.getSession();
		String Username = (String) session.getAttribute("userName");
		Integer money = Integer.parseInt(request.getParameter("money"));
		Integer position = Integer.parseInt(request.getParameter("position.id"));
		Date date = new Date(System.currentTimeMillis());

		if (file.isEmpty()) {
			ad.setImages("trump.png");
		} else {
			ad.setImages(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/news/" + ad.getImages());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (position == 1) {
			Integer amount = money / trangchu;
			ad.setAmount(amount);
			ad.setDisplay(amount);
			ad.setCreatedAt(date);
			ad.setStatus(false);
			ad.setmember(memdao.findById(Username));
			qc.create(ad);
		} else {
			Integer amount = money / trangcon;
			ad.setAmount(amount);
			ad.setDisplay(amount);
			ad.setCreatedAt(date);
			ad.setStatus(false);
			ad.setmember(memdao.findById(Username));
			qc.create(ad);
		}
		httpsession.setAttribute("messageDBV", "Thêm mới quảng cáo thành công !");
		return "redirect:/nhaquangcao/danhsachquangcao";
	}

	/**
	 * delele()
	 * Delete advertisement
	 * @param model, id
	 * @return redirect:/nhaquangcao/danhsachquangcao
	 * @author nguyen-khang
	 */
	@RequestMapping("/delete/{id}")
	public String delele(Model model, @PathVariable("id") Integer id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		qc.delete(id);
		httpsession.setAttribute("messageDBV", "Xóa quảng cáo thành công !");
		return "redirect:/nhaquangcao/danhsachquangcao";
	}

//	@PostMapping("/updates")
//	public String updateQuangCao(Model model, HttpServletRequest request, advertisement ad,
//			@RequestParam("imagess") MultipartFile file) {
//		Integer trangchu = 10000;
//		Integer trangcon = 5000;
//		HttpSession session = request.getSession();
//		String Username = (String) session.getAttribute("userName");
//		Integer money = Integer.parseInt(request.getParameter("money"));
//		Integer position = Integer.parseInt(request.getParameter("position.id"));
//		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
//		Date date = new Date(System.currentTimeMillis());
//
//		if (file.isEmpty()) {
//			ad.setImages("trump.png");
//		} else {
//			ad.setImages(file.getOriginalFilename());
//			try {
//				String path = app.getRealPath("/static/images/news/" + ad.getImages());
//				file.transferTo(new File(path));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		if (position == 1) {
//			Integer amount = money / trangchu;
//			ad.setAmount(amount);
//			ad.setDisplay(amount);
//			ad.setUpdatedAt(date);
//			qc.update(ad);
//		} else {
//			Integer amount = money / trangcon;
//			ad.setAmount(amount);
//			ad.setDisplay(amount);
//			ad.setUpdatedAt(date);
//			qc.update(ad);
//		}
//		httpsession.setAttribute("messageDBV", "Thêm mới quảng cáo thành công !");
//
//		return "redirect:/nhaquangcao/danhsachquangcao";
//	}

//	/**
//	 * quangcaoEdit()
//	 * Edit advertisement
//	 * @param model, id
//	 * @return admin/nhaQuangCao/updatequangcao
//	 * @author nguyen-khang
//	 */
//	@RequestMapping("/nhaquangcao/quangcaoEdit/{id}")
//	public String quangcaoEdit(Model model, @PathVariable("id") Integer id) {
//		Session session = factory.getCurrentSession();
//		advertisement entity = session.get(advertisement.class, id);
//		model.addAttribute("advertisement", entity);
//
//		List<position> list = qc.getListPosition();
//		model.addAttribute("listposition", list);
//
//		Integer trangchu = 10000;
//		Integer trangcon = 5000;
//
//		Integer position = entity.getPosition().getId();
//
//		if (position == 1) {
//			Integer amount = entity.getAmount() * trangchu;
//			model.addAttribute("ad", amount);
//		} else {
//			Integer amount = entity.getAmount() * trangcon;
//			model.addAttribute("ad", amount);
//		}
//
//		return "admin/nhaQuangCao/updatequangcao";
//	}
}
