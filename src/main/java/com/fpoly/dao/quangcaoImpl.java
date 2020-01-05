package com.fpoly.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder.In;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.entity.advertisement;
import com.fpoly.entity.categories;
import com.fpoly.entity.news;
import com.fpoly.entity.position;

@Transactional
@Repository
public class quangcaoImpl implements quangcao {
	@Autowired
	SessionFactory factory;

	/**
	 * getListPosition()
	 * Get list positon 
	 * @param null
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<position> getListPosition() {
		String hql = "FROM position";
		Session session = factory.getCurrentSession();
		TypedQuery<position> query = session.createQuery(hql, position.class);
		return query.getResultList();
	}

	/**
	 * create()
	 * Create advertisement
	 * @param entity
	 * @return entity
	 * @author nguyen-khang
	 */
	@Override
	public advertisement create(advertisement entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	/**
	 * update()
	 * Update advertisement
	 * @param entity
	 * @return entity
	 * @author nguyen-khang
	 */
	@Override
	public advertisement update(advertisement entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);
		return entity;
	}

	/**
	 * getAdvertisement_trangchu()
	 * Get adversitiment by status = true and postion = 1 and display > 0, shuffle list and getDisplay - 1
	 * @param null
	 * @return a
	 * @author nguyen-khang
	 */
	@Override
	public advertisement getAdvertisement_trangchu() {
		String hql = "FROM advertisement WHERE status = 'True' " + "and position.id = 1 " + "and display > 0";
		Session session = factory.getCurrentSession();
		TypedQuery<advertisement> query = session.createQuery(hql, advertisement.class);
		List<advertisement> list = query.getResultList();
		Collections.shuffle(list);
		advertisement a = list.get(0);
		a.setDisplay(a.getDisplay() - 1);
		session.update(a);
		return a;
	}

	/**
	 * getAdvertisement_trangcon()
	 * Get adversitiment by status = true and postion = 2 and display > 0, shuffle list and getDisplay - 1
	 * @param null
	 * @return a
	 * @author nguyen-khang
	 */
	@Override
	public advertisement getAdvertisement_trangcon() {
		String hql = "FROM advertisement WHERE status = 'True' " + "and position.id = 2 " + "and display > 0";
		Session session = factory.getCurrentSession();
		TypedQuery<advertisement> query = session.createQuery(hql, advertisement.class);
		List<advertisement> list = query.getResultList();
		Collections.shuffle(list);
		advertisement a = list.get(0);
		a.setDisplay(a.getDisplay() - 1);
		session.update(a);
		return a;
	}

	/**
	 * getAdvertisement_trangcon()
	 * Get advertisiment by username and status = true
	 * @param username
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<advertisement> getListAdvertisementTrue(String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM advertisement a WHERE a.status = 'True' and a.member.username = :username";
		TypedQuery<advertisement> query = session.createQuery(hql, advertisement.class);
		query.setParameter("username", username);
		return query.getResultList();
	}

	/**
	 * getListAdvertisementFalse()
	 * Get advertisiment by username and status = false
	 * @param username
	 * @return query.getResultList();
	 * @author nguyen-khang
	 */
	@Override
	public List<advertisement> getListAdvertisementFalse(String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM advertisement a WHERE a.status = 'False' and a.member.username = :username ";
		TypedQuery<advertisement> query = session.createQuery(hql, advertisement.class);
		query.setParameter("username", username);
		return query.getResultList();
	}

	/**
	 * findById()
	 * Find advertisement by id
	 * @param id
	 * @return session.find(advertisement.class, id);
	 * @author nguyen-khang
	 */
	@Override
	public advertisement findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(advertisement.class, id);
	}

	/**
	 * delete()
	 * Delete advertisement by id
	 * @param id
	 * @return entity
	 * @author nguyen-khang
	 */
	@Override
	public advertisement delete(Integer id) {
		advertisement entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}
	
	@Override
	public Integer getTrangchu() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT price from position where id = 1";
		TypedQuery<Integer> query = session.createQuery(hql, Integer.class);
		Integer price = query.getSingleResult();
		return price;
	}

	@Override
	public Integer getTrangcon() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT price from position where id = 2";
		TypedQuery<Integer> query = session.createQuery(hql, Integer.class);
		Integer price = query.getSingleResult();
		return price;
	}

}
