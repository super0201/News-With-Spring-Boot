package com.fpoly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.dao.advertisementDao;
import com.fpoly.dao.quangcao;
import com.fpoly.entity.advertisement;

@Transactional
@Controller
public class advertisementController {

	@Autowired
	advertisementDao addao;
	@Autowired
	SessionFactory factory;
	@Autowired
	HttpServletRequest request;
	@Autowired
	quangcao qc;
	@Autowired
	HttpSession httpsession;

	/**
	 * advertisementListCD()
	 * Get list advertisement = true and advertisement = false 
	 * @param admin/tinTuc/qlquangcao
	 * @return string
	 * @author van-tam
	 */
	@RequestMapping("/admin/quangcao")
	public String advertisementListCD(Model model) {
		List<advertisement> list = addao.findPositionFALSE();
		List<advertisement> listD = addao.findPositionTRUE();
		model.addAttribute("listAD", list);
		model.addAttribute("listADD", listD);
		return "admin/tinTuc/qlquangcao";
	}

	/**
	 * quangcaoEdit()
	 * Approved advertisement
	 * @param model, id
	 * @return redirect:/admin/quangcao
	 * @author van-tam
	 */
	@RequestMapping("/admin/AdvernEdit/{id}")
	public String quangcaoEdit(Model model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		advertisement entity = session.get(advertisement.class, id);
		entity.setStatus(true);
		
		httpsession.setAttribute("messageQC", "Quảng cáo đã được phê duyệt thành công !");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageVT");
		addao.update(entity);
		return "redirect:/admin/quangcao";
	}

	/**
	 * deleleAdver()
	 * ?????????????
	 * @param model, id
	 * @return redirect:/admin/quangcao
	 * @author van-tam
	 */
	@RequestMapping("/admin/AdvernDelete/{id}")
	public String deleleAdver(Model model, @PathVariable("id") Integer id) {
		httpsession.setAttribute("messageQC", "Quảng cáo đã được xóa thành công !");
		httpsession.removeAttribute("messageDM");
		httpsession.removeAttribute("messageBV1");
		httpsession.removeAttribute("messageBV2");
		httpsession.removeAttribute("messageVT");
		addao.delete(id);
		return "redirect:/admin/quangcao";
	}

}
