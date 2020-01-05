package com.fpoly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.news;

@Transactional
@Repository
public class newsDaoImpl implements newsDao {

	@Autowired
	SessionFactory factory;

	/**
	 * findById()
	 * Find news by id
	 * @param id
	 * @return session.find(news.class, id);
	 * @author van-tam
	 */
	@Override
	public news findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(news.class, id);
	}

	/**
	 * findAll()
	 * Find news by id
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<news> findAll() {
		String hql = "FROM news";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		return query.getResultList();
	}

	/**
	 * create()
	 * Create news
	 * @param entity
	 * @return entity
	 * @author thai-bao
	 */
	@Override
	public news create(news entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	/**
	 * update()
	 * Update news
	 * @param entity
	 * @return entity
	 * @author thai-bao
	 */
	@Override
	public void update(news entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	/**
	 * delete()
	 * delete news
	 * @param id
	 * @return entity
	 * @author thai-bao
	 */
	@Override
	public news delete(Integer id) {
		news entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	/**
	 * findAllDuyet()
	 * Find news status = 1
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<news> findAllDuyet() {
		String hql = "FROM news WHERE status = 1 ";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		return query.getResultList();
	}


	/**
	 * findAllChuaDuyet()
	 * Find news status = 0
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<news> findAllChuaDuyet() {
		String hql = "FROM news WHERE status = 0";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		return query.getResultList();
	}

	/**
	 * findAllbyusername()
	 * Find news by id username
	 * @param username
	 * @return query.getResultList();
	 * @author thai-bao
	 */
	@Override
	public List<news> findAllbyusername(String username) {
		String hql = "FROM news WHERE MemberId = :username ";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		query.setParameter("username", username);
		return query.getResultList();
	}

	/**
	 * findAllbyusernamefalse()
	 * Find news by id username and status = 0
	 * @param username
	 * @return query.getResultList();
	 * @author thai-bao
	 */
	@Override
	public List<news> findAllbyusernamefalse(String username) {
		String hql = "FROM news WHERE MemberId = :username and status = 0 ";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		query.setParameter("username", username);
		return query.getResultList();
	}

	/**
	 * findAllbyusernametrue()
	 * Find news by username and status = 1
	 * @param username
	 * @return query.getResultList();
	 * @author thai-bao
	 */
	@Override
	public List<news> findAllbyusernametrue(String username) {
		String hql = "FROM news WHERE MemberId = :username and status = 1 ";
		Session session = factory.getCurrentSession();
		TypedQuery<news> query = session.createQuery(hql, news.class);
		query.setParameter("username", username);
		return query.getResultList();
	}

	/**
	 * getListNewsUpdate()
	 * Update news by id
	 * @param id, value
	 * @return null
	 * @author van-tam
	 */
	@Override
	public void getListNewsUpdate(Integer id, Integer value) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("UPDATE news a Set a.type.id = :type WHERE a.id = :id");
		query.setParameter("id", id);
		query.setParameter("type", value);
		query.executeUpdate();
	}

	/**
	 * getTinHot()
	 * Get list news by id = 1
	 * @param null
	 * @return query.getSingleResult();
	 * @author van-tam
	 */
	@Override
	public news getTinHot() {
		Session session = factory.getCurrentSession();
		String hql = "FROM news n WHERE n.type.id = 1";
		TypedQuery<news> query = session.createQuery(hql, news.class);
		return query.getSingleResult();

	}

	/**
	 * update_TinHot()
	 * Update news set id = 3 where id = 1
	 * @param null
	 * @return null
	 * @author van-tam
	 */
	@Override
	public void update_TinHot() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("UPDATE news a Set a.type.id = :type WHERE a.id = :id");
		news list = this.getTinHot();
		query.setParameter("type", 3);
		query.setParameter("id", list.getId());
		query.executeUpdate();
	}
	
	/**
	 * getlistType()
	 * get list new 
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<news> getlistType() {
		Session session = factory.getCurrentSession();
		String hql = "FROM news n WHERE n.type.id = 1";
		TypedQuery<news> query = session.createQuery(hql, news.class);
		return query.getResultList();
}
}
