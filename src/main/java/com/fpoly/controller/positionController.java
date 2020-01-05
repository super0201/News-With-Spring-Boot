package com.fpoly.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.positionDao;
import com.fpoly.entity.position;

@Controller
@Transactional
public class positionController {

	@Autowired
	positionDao podao;
	@Autowired
	SessionFactory factory;
	@Autowired
	HttpSession httpsession;

	/**
	 * getListPosition()
	 * Get list position 
	 * @param model
	 * @return admin/tinTuc/themvitri
	 * @author van-tam
	 */
	@RequestMapping("/admin/themvitri")
	public String getListPosition(Model model) {
		List<position> list = podao.findAll();
		model.addAttribute("listVT", list);
		return "admin/tinTuc/themvitri";
	}

	/**
	 * createPosition()
	 * Creare position
	 * @param model, entity
	 * @return redirect:/admin/themvitri
	 * @author van-tam
	 */
	@PostMapping("/admin/createPosition")
	public String createPosition(Model model, position entity) {
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		entity.setCreatedAt(date);
		podao.create(entity);

		httpsession.setAttribute("messageVT", "Thêm mới vị trí thành công");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");
		return "redirect:/admin/themvitri";
	}

	/**
	 * positionEdit()
	 * Edit position
	 * @param model, id
	 * @return admin/tinTuc/suavitri
	 * @author van-tam
	 */
	@RequestMapping("/admin/positionEdit/{id}")
	public String positionEdit(Model model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		position entity = session.get(position.class, id);
		model.addAttribute("position", entity);
		return "admin/tinTuc/suavitri";
	}

	/**
	 * update()
	 * Update position
	 * @param model, entity
	 * @return redirect:/admin/themvitri
	 * @author van-tam
	 */
	@PostMapping("/admin/updatePosition")
	public String update(Model model, position entity) {
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		httpsession.setAttribute("messageVT", "Cập nhật vị trí thành công !");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");

		entity.setUpdatedAt(date);
		podao.update(entity);
		return "redirect:/admin/themvitri";
	}

	/**
	 * delelePosition()
	 * Delete position
	 * @param model, id
	 * @return redirect:/admin/themvitri
	 * @author van-tam
	 */
	@RequestMapping("/admin/positionDelete/{id}")
	public String delelePosition(Model model, @PathVariable("id") Integer id) {
		podao.delete(id);
		
		httpsession.setAttribute("messageVT", "Xóa vị trí thành công !");
		httpsession.removeAttribute("messageQC");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");
		return "redirect:/admin/themvitri";
	}

}
