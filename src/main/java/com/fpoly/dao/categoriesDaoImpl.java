package com.fpoly.dao;

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
public class categoriesDaoImpl implements categoriesDao {

	@Autowired
	SessionFactory factory;

	/**
	 * findById()
	 * Find categories
	 * @param id
	 * @return session.find(categories.class, id);
	 * @author van-tam
	 */
	@Override
	public categories findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(categories.class, id);
	}

	/**
	 * findAll()
	 * Get list categories
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<categories> findAll() {
		String hql = "FROM categories";
		Session session = factory.getCurrentSession();
		TypedQuery<categories> query = session.createQuery(hql, categories.class);
		return query.getResultList();
	}

	/**
	 * create()
	 * Create categories
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public categories create(categories entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	/**
	 * update()
	 * update categories
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public void update(categories entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	/**
	 * delete()
	 * delete categories
	 * @param id
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public categories delete(Integer id) {
		categories entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}
	
	/**
	 * findCAT()
	 * Find news by categories
	 * @param id
	 * @return query.getResultList();
	 * @author van-tam
	 */
	public List<news> findCAT(Integer id) {
		String hql = "FROM news n WHERE categoriesId = " + id;
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		return query.getResultList();
	}

}
