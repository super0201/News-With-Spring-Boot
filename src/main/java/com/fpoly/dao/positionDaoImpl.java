package com.fpoly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.position;

@Transactional
@Repository
public class positionDaoImpl implements positionDao {

	@Autowired
	SessionFactory factory;

	/**
	 * findById()
	 * Find position by id
	 * @param id
	 * @return session.find(position.class, id);
	 * @author van-tam
	 */
	@Override
	public position findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(position.class, id);
	}

	/**
	 * findAll()
	 * get list position
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<position> findAll() {
		String hql = "FROM position";
		Session session = factory.getCurrentSession();
		TypedQuery<position> query = session.createQuery(hql, position.class);
		return query.getResultList();
	}

	/**
	 * create()
	 * Create position
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public position create(position entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	/**
	 * update()
	 * update position
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public void update(position entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	/**
	 * delete()
	 * delete position
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public position delete(Integer id) {
		position entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}
}
