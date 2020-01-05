package com.fpoly.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.member;

@Transactional
@Repository
public class memberDaoImpl implements memberDao {

	@Autowired
	SessionFactory factory;

	/**
	 * findById()
	 * Find id member
	 * @param id
	 * @return session.find(member.class, id);
	 * @author van-tam
	 */
	@Override
	public member findById(String id) {
		Session session = factory.getCurrentSession();
		return session.find(member.class, id);

	}

	/**
	 * findAll()
	 * Get list member
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<member> findAll() {
		String hql = "FROM member";
		Session session = factory.getCurrentSession();
		TypedQuery<member> query = session.createQuery(hql, member.class);
		return query.getResultList();
	}

	/**
	 * create()
	 * Create member
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public member create(member entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	/**
	 * update()
	 * Update member
	 * @param entity
	 * @return entity
	 * @author van-tam
	 */
	@Override
	public void update(member entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
	}

	/**
	 * findRoleND()
	 * Find member by id = 4
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<member> findRoleND() {
		String hql = "FROM member Where roleId = 4";
		Session session = factory.getCurrentSession();
		TypedQuery<member> query = session.createQuery(hql, member.class);
		return query.getResultList();
	}

	/**
	 * findRolePV()
	 * Find member by id = 2
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<member> findRolePV() {
		String hql = "FROM member Where roleId = 2";
		Session session = factory.getCurrentSession();
		TypedQuery<member> query = session.createQuery(hql, member.class);
		return query.getResultList();
	}

	/**
	 * findRoleNQC()
	 * Find member by id = 3
	 * @param null
	 * @return query.getResultList();
	 * @author van-tam
	 */
	@Override
	public List<member> findRoleNQC() {
		String hql = "FROM member Where roleId = 3";
		Session session = factory.getCurrentSession();
		TypedQuery<member> query = session.createQuery(hql, member.class);
		return query.getResultList();
	}

}
