package com.fpoly.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.categories;
import com.fpoly.entity.news;

@Transactional
@Repository
public class displayDaoimpl implements displayDao {
	@Autowired
	SessionFactory factory;

	/**
	 * getViews()
	 * get views by news
	 * @param id
	 * @return views
	 * @author nguyen-khang
	 */
	@Override
	public Integer getViews(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT v.views from news v where v.id = :id";
		TypedQuery<Integer> query = session.createQuery(hql, Integer.class);
		query.setParameter("id", id);
		Integer views = query.getSingleResult();
		return views;
	}

	/**
	 * update()
	 * update news
	 * @param news
	 * @return null
	 * @author nguyen-khang
	 */
	@Override
	public void update(news news) {
		Session session = factory.getCurrentSession();
		session.update(news);
	}

	/**
	 * getChiTiet()
	 * Get news from id
	 * @param id
	 * @return query.getSingleResult();
	 * @author nguyen-khang
	 */
	@Override
	public news getChiTiet(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM news n WHERE n.id = :id";
		TypedQuery<news> query = session.createQuery(hql, news.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}

	/**
	 * getListCategoriesById()
	 * get list news from id categories
	 * @param id
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<news> getListCategoriesById(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM news n WHERE n.categories.id = :categories and status = 'True'";
		TypedQuery<news> query = session.createQuery(hql, news.class);
		query.setParameter("categories", id);
		return query.getResultList();
	}

	/**
	 * getTinHot()
	 * get news id = 1 and status = True
	 * @param null
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<news> getTinHot() {
		String hql = "FROM news where type = 1 and status = 'True'";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		return query.getResultList();
	}

	/**
	 * getTinThuong()
	 * get news id = 2 and status = True
	 * @param null
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<news> getTinThuong() {
		String hql = "FROM news where type = 2 and status = 'True'";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		return query.getResultList();
	}

	/**
	 * getTinMoi()
	 * get news id = 3 and status = True
	 * @param null
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<news> getTinMoi() {
		String hql = "FROM news where type = 3 and status = 'True'";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		List<news> list = query.getResultList();
		Collections.shuffle(list);
		return list.subList(0, 4);
	}

	/**
	 * getListDanhMuc()
	 * get list categories
	 * @param null
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<categories> getListDanhMuc() {
		String hql = "FROM categories";
		Session session = factory.getCurrentSession();
		TypedQuery<categories> query = session.createQuery(hql, categories.class);
		return query.getResultList();
	}

	/**
	 * getListSearch()
	 * get list news from title and status = True
	 * @param name
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<news> getListSearch(String name) {
		String hql = "FROM news n where n.title like :name and status = 'True'";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		String nametitle = "%" + name + "%";
		query.setParameter("name", nametitle);
		return query.getResultList();
	}
}
