package com.fpoly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.type;

@Transactional
@Repository
public class typeDaoImpl implements typeDao {

	@Autowired
	SessionFactory factory;

	/**
	 * findById()
	 * Find type by id
	 * @param id
	 * @return session.find(type.class, id);
	 * @author van-tam
	 */
	@Override
	public type findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(type.class, id);
	}

	/**
	 * findAll()
	 * Find all type
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<type> findAll() {
		String hql = "FROM type";
		Session session = factory.getCurrentSession();
		TypedQuery<type> query = session.createQuery(hql, type.class);
		return query.getResultList();
	}

	/**
	 * findAll()
	 * Find all type
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public type create(type entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	/**
	 * update()
	 * Update type
	 * @param entity
	 * @return null
	 * @author van-tam
	 */
	@Override
	public void update(type entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

}
