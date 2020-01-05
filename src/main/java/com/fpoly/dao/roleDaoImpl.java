package com.fpoly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.role;

@Transactional
@Repository
public class roleDaoImpl implements roleDao {

	@Autowired
	SessionFactory factory;

	/**
	 * findById()
	 * Find role by id 
	 * @param id
	 * @return session.find(role.class, id);
	 * @author van-tam
	 */
	@Override
	public role findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(role.class, id);
	}

	/**
	 * findAll()
	 * Find all role
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<role> findAll() {
		String hql = "FROM role";
		Session session = factory.getCurrentSession();
		TypedQuery<role> query = session.createQuery(hql, role.class);
		return query.getResultList();
	}

	/**
	 * create()
	 * Create role
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public role create(role entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	/**
	 * update()
	 * Update role
	 * @param entity
	 * @return null
	 * @author van-tam
	 */
	@Override
	public void update(role entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	/**
	 * findById()
	 * Find role by id
	 * @param id
	 * @return session.find(role.class, id);
	 * @author van-tam
	 */
	@Override
	public role findById(String id) {
		Session session = factory.getCurrentSession();
		return session.find(role.class, id);
	}

}
